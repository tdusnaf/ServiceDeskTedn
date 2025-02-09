using { ServiceDesk as my } from '../db/schema';

@path : '/service/ServiceDeskSvcs'
service ServiceDeskService
{
    annotate Solicitudes with @restrict :
    [
        { grant : [ 'CREATE', 'DELETE', 'READ', 'UPDATE' ], to : [ 'User' ], where : 'createdBy = $user' },
        { grant : [ '*' ], to : [ 'Admin' ] }
    ];

    annotate Tipos_solicitud with @restrict :
    [
        { grant : [ '*' ], to : [ 'Admin' ] },
        { grant : [ 'READ' ], to : [ 'User' ] }
    ];

    @odata.draft.enabled
    entity Solicitudes as
        projection on my.Solicitudes;

    @odata.draft.enabled
    entity Tipos_solicitud as
        projection on my.TiposSolicitud;

}

annotate ServiceDeskService with @requires :
[
    'User',
    'Admin'
];
