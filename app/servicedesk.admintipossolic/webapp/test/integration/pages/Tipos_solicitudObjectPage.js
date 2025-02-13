sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'servicedesk.admintipossolic',
            componentId: 'Tipos_solicitudObjectPage',
            contextPath: '/Tipos_solicitud'
        },
        CustomPageDefinitions
    );
});