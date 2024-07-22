namespace alansmith_34_a42;

using { S4HCP_ServiceOrder_Odata } from '../srv/external/S4HCP_ServiceOrder_Odata.cds';

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
    S4HC_ServiceOrder : Association to one S4HCP_ServiceOrder_Odata.A_ServiceOrder;
}
entity ProductFAQ
{
    key ID : Integer;
    issue : LargeString;
    question : LargeString;
    answer : LargeString;
//   embedding : Vector(1536);
}