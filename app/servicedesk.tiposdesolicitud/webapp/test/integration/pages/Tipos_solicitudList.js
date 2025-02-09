sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'servicedesk.tiposdesolicitud',
            componentId: 'Tipos_solicitudList',
            contextPath: '/Tipos_solicitud'
        },
        CustomPageDefinitions
    );
});