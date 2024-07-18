sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'alansmith34a42/ProductFAQApp/test/integration/FirstJourney',
		'alansmith34a42/ProductFAQApp/test/integration/pages/ProductFAQList',
		'alansmith34a42/ProductFAQApp/test/integration/pages/ProductFAQObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProductFAQList, ProductFAQObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('alansmith34a42/ProductFAQApp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProductFAQList: ProductFAQList,
					onTheProductFAQObjectPage: ProductFAQObjectPage
                }
            },
            opaJourney.run
        );
    }
);