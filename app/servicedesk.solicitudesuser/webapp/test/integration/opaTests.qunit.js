sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'servicedesk/solicitudesuser/test/integration/FirstJourney',
		'servicedesk/solicitudesuser/test/integration/pages/SolicitudesList',
		'servicedesk/solicitudesuser/test/integration/pages/SolicitudesObjectPage',
		'servicedesk/solicitudesuser/test/integration/pages/Solicitudes_ComunicacionesObjectPage'
    ],
    function(JourneyRunner, opaJourney, SolicitudesList, SolicitudesObjectPage, Solicitudes_ComunicacionesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('servicedesk/solicitudesuser') + '/index.html'
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