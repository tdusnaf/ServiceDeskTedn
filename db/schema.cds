namespace ServiceDesk;

using
{
    cuid,
    managed,    
    sap.common.CodeList
}
from '@sap/cds/common';

entity Solicitudes : cuid, managed
{
    key ID : UUID;
    Motivo : String(100);
    Estado : Association to one Estado default 'N';
    TipoSolicitud : Association to one TiposSolicitud;
    Urgencia : Association to one Urgencia default 'M';
    PersonaSoporte : Association to one PersonaSoporte;
    Usuario : type of managed:createdBy;
    Comunicaciones  : Composition of many {
        key ID    : UUID;
        Autor    : type of managed:createdBy;
        Fecha : type of managed:createdAt;
        Mensaje   : String;
};
}

entity PersonaSoporte
{
    key ID : UUID;
    Nombre : String(100);
    Apellido1 : String(100);
    Apellido2 : String(100);
    Solicitudes : Association to many Solicitudes on Solicitudes.PersonaSoporte = $self;
}

entity TiposSolicitud {
    key code: String ;
    description: String; 
}

entity Estado : CodeList {
key code: String enum {
    Nuevo = 'N';
    Asignado = 'A'; 
    En_Proceso = 'I'; 
    En_Espera = 'H'; 
    Resuelto = 'R'; 
    Cerrado = 'C'; 
};
criticality : Integer;
}


entity Urgencia : CodeList {
key code: String enum {
    Alta = 'H';
    Media = 'M'; 
    Baja = 'L'; 
};
criticality : Integer;
}
