/**
 * 
 * @Before(event = { "Action1" }, entity = "alansmith_34_a42Srv.CustomerMessage")
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
*/
const lLMProxy = require('./utils/genAIHubProxyDirect');
const LOG = cds.log('GenAI');

module.exports = async function(request) {
	// Your code here

try {
    // Extract the customer message ID from the request parameters
    const { ID } = request.params[0];

    // Fetch the customer message from the database using the ID
    const customerMessage = await SELECT.one.from('alansmith_34_a42.CustomerMessage').where({ ID });

    const {
        fullMessageCustomerLanguage,
        messageCategory,
        messageSentiment,
        S4HC_ServiceOrder_ServiceOrder: attachedSOId
    } = customerMessage;

    let replyPrompt = '';
    if (messageCategory === 'Technical') {
        // Embed the customer message to find relevant FAQs
        const fullMessageEmbedding = await lLMProxy.embed(request, fullMessageCustomerLanguage, process.env.embeddingEndpoint);
        const fullMessageEmbeddingStr = JSON.stringify(fullMessageEmbedding);

        // Select the closest FAQ Item
        const relevantFAQs = await SELECT`id, issue, question, answer`
            .from('alansmith_34_a42.ProductFAQ')
            .where`cosine_similarity(embedding, to_real_vector(${fullMessageEmbeddingStr})) > 0.7`;

        // Construct part of the prompt for a Technical issue
        const faqItem = relevantFAQs[0] || { question: '', answer: '' };
        replyPrompt = `
                Generate a helpful reply message including the troubleshooting procedure to the newCustomerMessage based on previousCustomerMessages and relevantFAQItem:
                relevantFAQItem: ${faqItem.question} ${faqItem.answer}`;
    } else {
        // Generate a different prompt type based on the sentiment
        const messageType = messageSentiment === 'Negative' ? 'a "we are sorry" note' : 'a gratitude note';
        replyPrompt = `
                Generate ${messageType} to the newCustomerMessage based on previousCustomerMessages:`;
    }

    // Complete the prompt - common to both cases
    replyPrompt += `
            newCustomerMessage: ${fullMessageCustomerLanguage}
            Produce the reply in two languages: in the original language of newCustomerMessage and in English. Return the result in the following JSON template:
            JSON template: {
                suggestedResponseEnglish: Text,
                suggestedResponseCustomerLanguage: Text
            }`;

    // Generate the reply body using the constructed prompt
    const resultRaw = await lLMProxy.completion(request, replyPrompt, process.env.completionEndpoint);
    const resultJSON = JSON.parse(resultRaw);
    const {
        suggestedResponseCustomerLanguage,
        suggestedResponseEnglish
    } = resultJSON;

    // Update the customer message in the database with the generated reply
    await UPDATE('alansmith_34_a42.CustomerMessage').set({
        suggestedResponseCustomerLanguage,
        suggestedResponseEnglish,
    }).where({ ID });

    LOG.info(`CustomerMessage with ID ${ID} updated with a reply to the customer.`);
} catch (err) {
    LOG.error(JSON.stringify(err));

    const message = err.rootCause?.message || 'An error occurred';
    request.reject({
        code: '',
        message,
        target: '',
        status: 500,
    });
}
}