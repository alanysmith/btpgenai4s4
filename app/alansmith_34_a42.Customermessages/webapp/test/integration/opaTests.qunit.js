sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'alansmith34a42/Customermessages/test/integration/FirstJourney',
		'alansmith34a42/Customermessages/test/integration/pages/CustomerMessageList',
		'alansmith34a42/Customermessages/test/integration/pages/CustomerMessageObjectPage'
    ],
    function(JourneyRunner, opaJourney, CustomerMessageList, CustomerMessageObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('alansmith34a42/Customermessages') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCustomerMessageList: CustomerMessageList,
					onTheCustomerMessageObjectPage: CustomerMessageObjectPage
                }
            },
            opaJourney.run
        );
    }
);