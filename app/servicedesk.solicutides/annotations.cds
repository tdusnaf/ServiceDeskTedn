using ServiceDeskService as service from '../../srv/service';
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
                Label : 'Estado_code',
                Value : Estado_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TipoSolicitud_code',
                Value : TipoSolicitud_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Urgencia_code',
                Value : Urgencia_code,
            },
            {
                $Type : 'UI.DataField',
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
            Label : '{i18n>Comunicaciones}',
            ID : 'i18nComunicaciones',
            Target : 'Comunicaciones/@UI.LineItem#i18nComunicaciones',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Motivo',
            Value : Motivo,
        },
        {
            $Type : 'UI.DataField',
            Value : Estado.descr,
            Criticality : Estado.criticality,
            Label : '{i18n>Estado}',
        },
        {
            $Type : 'UI.DataField',
            Value : TipoSolicitud.description,
            Label : '{i18n>TipoDeSolicitud}',
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
            Value : Usuario,
        },
    ],
    UI.SelectionFields : [
        Urgencia_code,
        TipoSolicitud_code,
        Estado_code,
    ],
);

annotate service.Solicitudes with {
    TipoSolicitud @(
        Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Tipo_solicitud',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : TipoSolicitud_code,
                ValueListProperty : 'code',
            },
        ],
    },
        Common.ValueListWithFixedValues : true,
        Common.Label : '{i18n>Tiposolicitud}',
    )
};

annotate service.Solicitudes with {
    Urgencia @(
        Common.ValueListWithFixedValues : true,
        Common.Label : '{i18n>Urgencia}',
    )
};

annotate service.Urgencia with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly
    }
};

annotate service.Solicitudes with {
    Estado @(
        Common.ValueListWithFixedValues : true,
        Common.Label : '{i18n>Estado}',
        )
};

annotate service.Estado with {
    code @(
        Common.Text : {
            $value : descr,
            ![@UI.TextArrangement] : #TextFirst
        },
        Common.Label : 'Estado/code',
    )
};

annotate service.Tipo_solicitud with {
    code @Common.Text : {
        $value : description,
        ![@UI.TextArrangement] : #TextOnly
    }
};

annotate service.Solicitudes.Comunicaciones with @(
    UI.LineItem #i18nComunicaciones : [
        {
            $Type : 'UI.DataField',
            Value : Fecha,
        },
        {
            $Type : 'UI.DataField',
            Value : Autor,
            Label : '{i18n>Creadopor}',
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

annotate service.Estado with {
    descr @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Estado',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : descr,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};

