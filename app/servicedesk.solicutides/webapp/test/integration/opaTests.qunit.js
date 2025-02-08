sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'servicedesk/solicutides/test/integration/FirstJourney',
		'servicedesk/solicutides/test/integration/pages/SolicitudesList',
		'servicedesk/solicutides/test/integration/pages/SolicitudesObjectPage',
		'servicedesk/solicutides/test/integration/pages/Solicitudes_ComunicacionesObjectPage'
    ],
    function(JourneyRunner, opaJourney, SolicitudesList, SolicitudesObjectPage, Solicitudes_ComunicacionesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('servicedesk/solicutides') + '/index.html'
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