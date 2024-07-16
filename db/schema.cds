namespace alansmith_34_a42;

entity CustomerMessage
{
    key ID : UUID
        @mandatory;
    titleEnglish : String(100);
    customerName : String(100);
    productName : String(100);
    summaryEnglish : String(500);
    messageCategory : String(50);
    messageUrgency : String(20);
    messageSentiment : String(20);
    titleCustomerLanguage : String(100);
    customerId : String(36);
    productId : String(36);
    summaryCustomerLanguage : String(500);
    originatingCountry : String(50);
    sourceLanguage : String(50);
    fullMessageCustomerLanguage : String(5000);
    fullMessageEnglish : String(5000);
    suggestedResponseEnglish : String(5000);
    suggestedResponseCustomerLanguage : String(5000);
}
