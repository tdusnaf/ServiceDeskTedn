sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'servicedesk/solicitudesadmin/test/integration/FirstJourney',
		'servicedesk/solicitudesadmin/test/integration/pages/SolicitudesList',
		'servicedesk/solicitudesadmin/test/integration/pages/SolicitudesObjectPage',
		'servicedesk/solicitudesadmin/test/integration/pages/Solicitudes_ComunicacionesObjectPage'
    ],
    function(JourneyRunner, opaJourney, SolicitudesList, SolicitudesObjectPage, Solicitudes_ComunicacionesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('servicedesk/solicitudesadmin') + '/index.html'
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