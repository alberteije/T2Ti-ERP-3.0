from src import db


class AcbrMonitorPortaModel(db.Model):
    __tablename__ = 'acbr_monitor_porta'

    id = db.Column(db.Integer, primary_key=True)
    id_empresa = db.Column(db.Integer, db.ForeignKey('empresa.id'))


    def mapping(self, data):
        self.id = data.get('id')
        self.id_empresa = data.get('idEmpresa')

    def serialize(self):
        return {
            'id': self.id,
            'idEmpresa': self.id_empresa,
        }