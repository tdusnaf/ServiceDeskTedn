const cds = require('@sap/cds')

class ServiceDeskUserService extends cds.ApplicationService {
  
  async init() {
    this.before("UPDATE", "Solicitudes", (req) => this.onUpdate(req));
    this.before("CREATE", "Solicitudes", (req) => this.onCreate(req));
    this.before("CREATE", "Solicitudes", (req) => this.changeTypeDueToSubject(req.data));

    return super.init();
  }

  async onCreate(req) {    
    const data = req.data;     
        if (data.Estado_code !== 'N') {
           await req.reject(`No se puede definir el estado de una solicitud nueva`);
           return
        }
        if (data.Urgencia_code !== 'M') {
            await req.reject(`No se puede definir la urgencia de una solicitud nueva`);
            return
        }    
  }

  changeTypeDueToSubject(data) {
    if (data) {
      const Solicitudes = Array.isArray(data) ? data : [data];
      Solicitudes.forEach((Solicitud) => {
        if (Solicitud.Motivo?.toLowerCase().includes("problema")) {
          Solicitud.TipoSolicitud = { code: "Sup", description: "Soporte" };
        }
      });
    }
  }

  async onUpdate(req) {    
    const data = await req.data
    const { Estado_code } = await SELECT.one(req.subject, i => i.Estado_code).where({ ID: req.data.ID })
    if (Estado_code === 'C') {
        const existingData = await SELECT.one(req.subject).where({ ID: req.data.ID });
        
        if (data.Motivo !== existingData.Motivo) {
            return req.reject(`No se puede modificar el motivo`);
        }
        if (data.TipoSolicitud_code !== existingData.TipoSolicitud_code) {
            return req.reject(`No se puede modificar el tipo de solicitud`);
        }
        if (data.Urgencia_code !== existingData.Urgencia_code) {
            return req.reject(`No se puede modificar la urgencia`);
        }
    }
  }

}

class ServiceDeskAdminService extends cds.ApplicationService {
  
  async init() {
    this.before("UPDATE", "Solicitudes", (req) => this.onUpdate(req));  

    return super.init();
  } 

  async onUpdate(req) {    
    const { Estado_code } = await SELECT.one(req.subject, i => i.Estado_code).where({ ID: req.data.ID })
    if (Estado_code === 'C') {
        return req.reject(`No se puede modificar una incidencia cerrada`)
    }
  }

}
module.exports = { ServiceDeskAdminService , ServiceDeskUserService}
