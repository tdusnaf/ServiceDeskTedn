sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'servicedesk/solicitudes/test/integration/FirstJourney',
		'servicedesk/solicitudes/test/integration/pages/SolicitudesList',
		'servicedesk/solicitudes/test/integration/pages/SolicitudesObjectPage',
		'servicedesk/solicitudes/test/integration/pages/Solicitudes_ComunicacionesObjectPage'
    ],
    function(JourneyRunner, opaJourney, SolicitudesList, SolicitudesObjectPage, Solicitudes_ComunicacionesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('servicedesk/solicitudes') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSolicitudesList: SolicitudesList,
					onTheSolicitudesObjectPage: SolicitudesObjectPage,
					onTheSolicitudes_ComunicacionesObjectPage: Solicitudes_ComunicacionesObjectPage
                }
            },
            opaJourney.run
        );
    }
);