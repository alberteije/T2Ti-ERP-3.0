from src import db
from src.model.erp_tipo_plano_model import ErpTipoPlanoModel


class EmpresaPlanoModel(db.Model):
    __tablename__ = 'empresa_plano'

    id = db.Column(db.Integer, primary_key=True)
    data_inicio = db.Column(db.DateTime)
    data_fim = db.Column(db.DateTime)
    valor_pago = db.Column(db.Float)
    id_pagamento_plataforma = db.Column(db.String(30))
    status_pagamento_plataforma = db.Column(db.String(100))
    id_erp_tipo_plano = db.Column(db.Integer, db.ForeignKey('erp_tipo_plano.id'))
    id_empresa = db.Column(db.Integer, db.ForeignKey('empresa.id'))

    erp_tipo_plano_model = db.relationship('ErpTipoPlanoModel', foreign_keys=[id_erp_tipo_plano])

    def mapping(self, data):
        self.id = data.get('id')
        self.id_erp_tipo_plano = data.get('idErpTipoPlano')
        self.id_empresa = data.get('idEmpresa')
        self.data_inicio = data.get('dataInicio')
        self.data_fim = data.get('dataFim')
        self.valor_pago = data.get('valorPago')
        self.id_pagamento_plataforma = data.get('idPagamentoPlataforma')
        self.status_pagamento_plataforma = data.get('statusPagamentoPlataforma')

    def serialize(self):
        return {
            'id': self.id,
            'idErpTipoPlano': self.id_erp_tipo_plano,
            'idEmpresa': self.id_empresa,
            'dataInicio': self.data_inicio,
            'dataFim': self.data_fim,
            'valorPago': self.valor_pago,
            'idPagamentoPlataforma': self.id_pagamento_plataforma,
            'statusPagamentoPlataforma': self.status_pagamento_plataforma,
            'erpTipoPlanoModel': self.erp_tipo_plano_model.serialize() if self.erp_tipo_plano_model else None,
        }