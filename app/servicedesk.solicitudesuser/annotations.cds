using ServiceDeskUserService as service from '../../srv/service';
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
                Label : '{i18n>Urgencia}',
                Value : Urgencia_code,
            },
            {
                $Type : 'UI.DataField',
                Value : Usuario,
                Label : '{i18n>Usuario}',
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
            Label : '{i18n>Id}',
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Tiposolicitud}',
            Value : TipoSolicitud_code,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Motivo}',
            Value : Motivo,
        },
        {
            $Type : 'UI.DataField',
            Value : Estado.descr,
            Label : '{i18n>Estado}',
            Criticality : Estado.criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : Urgencia.descr,
            Label : '{i18n>Urgencia}',
            Criticality : Urgencia.criticality,
            CriticalityRepresentation : #WithoutIcon,
        },
        {
            $Type : 'UI.DataField',
            Value : Comunicaciones.Mensaje,
            Label : '{i18n>Mensajes}',
        },
    ],
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
    UI.SelectionFields : [
        Urgencia_code,
    ],
    UI.SelectionPresentationVariant #table : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
            GroupBy : [
                Urgencia_code,
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
    },
    UI.SelectionPresentationVariant #table1 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
            GroupBy : [
                Urgencia_code,
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
    },
    UI.SelectionPresentationVariant #table2 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
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
        Common.Text : TipoSolicitud.description,
        Common.ValueListWithFixedValues : true,
    )
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
            Label : '{i18n>CreadoPor}',
        },
        {
            $Type : 'UI.DataField',
            Value : Mensaje,
            Label : 'Mensaje',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Mensaje',
            ID : 'Mensaje',
            Target : '@UI.FieldGroup#Mensaje',
        },
    ],
    UI.FieldGroup #Mensaje : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Mensaje,
                Label : 'Mensaje',
            },
        ],
    },
);

annotate service.Solicitudes with {
    Estado @(
        Common.Text : Estado.descr,
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Estado with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.Solicitudes with {
    Urgencia @(
        Common.ValueListWithFixedValues : true,
        Common.Label : '{i18n>Urgencia}',
        Common.Text : Urgencia.descr,
    )
};

annotate service.Urgencia with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

