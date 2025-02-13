using { ServiceDesk as my } from '../db/schema';

service ServiceDeskAdminService
{
    @odata.draft.enabled
    entity Solicitudes as
        projection on my.Solicitudes;

    @odata.draft.enabled
    entity Tipos_solicitud as
        projection on my.TiposSolicitud;

}

annotate ServiceDeskAdminService with @requires :
[
    'Admin'
];

service ServiceDeskUserService
{
    annotate Solicitudes with @restrict :
    [
        { grant : [ 'CREATE', 'DELETE', 'READ', 'UPDATE' ], to : [ 'User' ], where : 'createdBy = $user' }
    ];

    @odata.draft.enabled
    entity Solicitudes as
        projection on my.Solicitudes;

    @readonly
    entity Tipos_solicitud as
        projection on my.TiposSolicitud;

}

annotate ServiceDeskUserService with @requires :
[
    'User'
];
