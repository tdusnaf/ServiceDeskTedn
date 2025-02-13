sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'servicedesk.solicitudesuser',
            componentId: 'SolicitudesList',
            contextPath: '/Solicitudes'
        },
        CustomPageDefinitions
    );
});