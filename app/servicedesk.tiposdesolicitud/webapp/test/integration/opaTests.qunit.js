sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'servicedesk/tiposdesolicitud/test/integration/FirstJourney',
		'servicedesk/tiposdesolicitud/test/integration/pages/Tipos_solicitudList',
		'servicedesk/tiposdesolicitud/test/integration/pages/Tipos_solicitudObjectPage'
    ],
    function(JourneyRunner, opaJourney, Tipos_solicitudList, Tipos_solicitudObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('servicedesk/tiposdesolicitud') + '/index.html'
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