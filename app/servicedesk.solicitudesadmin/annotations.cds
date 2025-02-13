using ServiceDeskAdminService as service from '../../srv/service';
annotate service.Solicitudes with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Motivo',
                Value : Motivo,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Estado}',
                Value : Estado_code,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Tiposolicitud}',
                Value : TipoSolicitud_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Urgencia',
                Value : Urgencia_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Usuario',
                Value : Usuario,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Comunicaciones',
            ID : 'Comunicaciones',
            Target : 'Comunicaciones/@UI.LineItem#Comunicaciones',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Value : Usuario,
        },
        {
            $Type : 'UI.DataField',
            Value : Motivo,
            Label : 'Motivo',
        },
        {
            $Type : 'UI.DataField',
            Value : Estado.descr,
            Label : '{i18n>Estado}',
            Criticality : Estado.criticality,
            CriticalityRepresentation : #WithIcon,
        },
        {
            $Type : 'UI.DataField',
            Value : TipoSolicitud.description,
            Label : '{i18n>TipoDeSolicitud}',
            CriticalityRepresentation : #WithoutIcon,
        },
        {
            $Type : 'UI.DataField',
            Value : Urgencia.descr,
            Label : '{i18n>Urgencia}',
            Criticality : Urgencia.criticality,
            CriticalityRepresentation : #WithoutIcon,
        },
    ],
    UI.SelectionFields : [
        Usuario,
        TipoSolicitud_code,
        Estado_code,
    ],
    UI.FieldGroup #Comunicaciones : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : Motivo,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : ID,
        },
        TypeImageUrl : 'sap-icon://message-warning',
    },
);

annotate service.Solicitudes with {
    TipoSolicitud @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Tipos_solicitud',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : TipoSolicitud_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
        },
        Common.Label : '{i18n>Tiposolicitud}',
        Common.ValueListWithFixedValues : true,
        Common.Text : TipoSolicitud.description,
    )
};

annotate service.Solicitudes with {
    Usuario @(
        Common.Label : '{i18n>Usuario}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Solicitudes',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Usuario,
                    ValueListProperty : 'Usuario',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Solicitudes with {
    Urgencia @(
        Common.Label : 'Urgencia_code',
        Common.Text : Urgencia.descr,
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Solicitudes with {
    Estado @(
        Common.Label : '{i18n>Estado}',
        Common.ValueListWithFixedValues : true,
        Common.Text : Estado.descr,
    )
};

annotate service.Estado with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.Solicitudes.Comunicaciones with @(
    UI.LineItem #Comunicaciones : [
        {
            $Type : 'UI.DataField',
            Value : Fecha,
        },
        {
            $Type : 'UI.DataField',
            Value : Autor,
        },
        {
            $Type : 'UI.DataField',
            Value : Mensaje,
            Label : 'Mensaje',
        },
    ]
);

annotate service.Urgencia with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.Solicitudes with {
    Motivo @Common.FieldControl : #ReadOnly
};

