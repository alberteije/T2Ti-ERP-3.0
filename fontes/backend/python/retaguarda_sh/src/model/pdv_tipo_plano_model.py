from src import db
from src.model.pdv_plano_pagamento_model import PdvPlanoPagamentoModel


class PdvTipoPlanoModel(db.Model):
    __tablename__ = 'pdv_tipo_plano'

    id = db.Column(db.Integer, primary_key=True)
    modulo = db.Column(db.String(1))
    plano = db.Column(db.String(1))
    modulo_fiscal = db.Column(db.String(3))
    valor = db.Column(db.Float)

    pdv_plano_pagamento_model_list = db.relationship('PdvPlanoPagamentoModel', lazy='dynamic')

    def mapping(self, data):
        self.id = data.get('id')
        self.modulo = data.get('modulo')
        self.plano = data.get('plano')
        self.modulo_fiscal = data.get('moduloFiscal')
        self.valor = data.get('valor')

    def serialize(self):
        return {
            'id': self.id,
            'modulo': self.modulo,
            'plano': self.plano,
            'moduloFiscal': self.modulo_fiscal,
            'valor': self.valor,
            'pdvPlanoPagamentoModelList': [pdv_plano_pagamento_model.serialize() for pdv_plano_pagamento_model in self.pdv_plano_pagamento_model_list],
        }