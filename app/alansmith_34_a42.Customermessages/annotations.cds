using alansmith_34_a42Srv as service from '../../srv/service';
using from '../annotations';



annotate service.CustomerMessage with @(
    UI.FieldGroup #Main : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : titleEnglish,
            },
            {
                $Type : 'UI.DataField',
                Value : customerName,
            },
            {
                $Type : 'UI.DataField',
                Value : productName,
            },
            {
                $Type : 'UI.DataField',
                Value : summaryEnglish,
            },
            {
                $Type : 'UI.DataField',
                Value : messageCategory,
            },
            {
                $Type : 'UI.DataField',
                Value : messageUrgency,
            },
            {
                $Type : 'UI.DataField',
                Value : messageSentiment,
            },
            {
                $Type : 'UI.DataField',
                Value : titleCustomerLanguage,
            },
            {
                $Type : 'UI.DataField',
                Value : customerId,
            },
            {
                $Type : 'UI.DataField',
                Value : productId,
            },
            {
                $Type : 'UI.DataField',
                Value : summaryCustomerLanguage,
            },
            {
                $Type : 'UI.DataField',
                Value : originatingCountry,
            },
            {
                $Type : 'UI.DataField',
                Value : sourceLanguage,
            },
            {
                $Type : 'UI.DataField',
                Value : fullMessageCustomerLanguage,
            },
            {
                $Type : 'UI.DataField',
                Value : fullMessageEnglish,
            },
            {
                $Type : 'UI.DataField',
                Value : suggestedResponseEnglish,
            },
            {
                $Type : 'UI.DataField',
                Value : suggestedResponseCustomerLanguage,
            },
            {
                $Type : 'UI.DataField',
                Value : S4HC_ServiceOrder_ServiceOrder,
                Label : 'Service Order',
            },
        ],
    }
);
annotate service.CustomerMessage with {
    S4HC_ServiceOrder @Common.Text : {
            $value : S4HC_ServiceOrder.ServiceOrder,
            ![@UI.TextArrangement] : #TextSeparate,
        }
};
annotate service.CustomerMessage with {
    S4HC_ServiceOrder @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'A_ServiceOrder',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : S4HC_ServiceOrder_ServiceOrder,
                    ValueListProperty : 'ServiceOrder',
                },
            ],
            Label : 'Service Order',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.A_ServiceOrder with {
    ServiceOrder @Common.Text : {
        $value : ServiceOrderDescription,
        ![@UI.TextArrangement] : #TextSeparate,
    }
};
annotate service.CustomerMessage with @(
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'alansmith_34_a42Srv.Action1',
            Label : 'Generate Reply',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'alansmith_34_a42Srv.Action2',
            Label : 'Maintain SO',
        },
    ]
);
