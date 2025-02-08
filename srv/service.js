const cds = require('@sap/cds')

class ServiceDeskService extends cds.ApplicationService {
  /** Registering custom event handlers */
  async init() {
    this.before("UPDATE", "Solicitudes", (req) => this.onUpdate(req));
    this.before("CREATE", "Solicitudes", (req) => this.changeTypeDueToSubject(req.data));

    return super.init();
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

  /** Custom Validation */
  async onUpdate (req) {
    const { Estado_code } = await SELECT.one(req.subject, i => i.Estado_code).where({ID: req.data.ID})
    if ( Estado_code === 'C')
      return req.reject(`No se puede modificar una solicitud cerrada`)
  }
}
module.exports = { ServiceDeskService }
