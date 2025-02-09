sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'servicedesk.solicitudes',
            componentId: 'Solicitudes_ComunicacionesObjectPage',
            contextPath: '/Solicitudes/Comunicaciones'
        },
        CustomPageDefinitions
    );
});