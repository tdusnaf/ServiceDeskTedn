sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'servicedesk/admintipossolic/test/integration/FirstJourney',
		'servicedesk/admintipossolic/test/integration/pages/Tipos_solicitudList',
		'servicedesk/admintipossolic/test/integration/pages/Tipos_solicitudObjectPage'
    ],
    function(JourneyRunner, opaJourney, Tipos_solicitudList, Tipos_solicitudObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('servicedesk/admintipossolic') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTipos_solicitudList: Tipos_solicitudList,
					onTheTipos_solicitudObjectPage: Tipos_solicitudObjectPage
                }
            },
            opaJourney.run
        );
    }
);