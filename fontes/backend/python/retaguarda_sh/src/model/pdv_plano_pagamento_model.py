from src import db


class PdvPlanoPagamentoModel(db.Model):
    __tablename__ = 'pdv_plano_pagamento'

    id = db.Column(db.Integer, primary_key=True)
    data_solicitacao = db.Column(db.DateTime)
    data_pagamento = db.Column(db.DateTime)
    plano = db.Column(db.String(1))
    valor = db.Column(db.Float)
    status_pagamento = db.Column(db.String(1))
    codigo_transacao = db.Column(db.String(100))
    metodo_pagamento = db.Column(db.String(1))
    codigo_tipo_pagamento = db.Column(db.String(3))
    data_plano_expira = db.Column(db.DateTime)
    email_pagamento = db.Column(db.String(250))
    id_pdv_tipo_plano = db.Column(db.Integer, db.ForeignKey('pdv_tipo_plano.id'))
    id_empresa = db.Column(db.Integer, db.ForeignKey('empresa.id'))


    def mapping(self, data):
        self.id = data.get('id')
        self.id_empresa = data.get('idEmpresa')
        self.id_pdv_tipo_plano = data.get('idPdvTipoPlano')
        self.data_solicitacao = data.get('dataSolicitacao')
        self.data_pagamento = data.get('dataPagamento')
        self.plano = data.get('plano')
        self.valor = data.get('valor')
        self.status_pagamento = data.get('statusPagamento')
        self.codigo_transacao = data.get('codigoTransacao')
        self.metodo_pagamento = data.get('metodoPagamento')
        self.codigo_tipo_pagamento = data.get('codigoTipoPagamento')
        self.data_plano_expira = data.get('dataPlanoExpira')
        self.email_pagamento = data.get('emailPagamento')

    def serialize(self):
        return {
            'id': self.id,
            'idEmpresa': self.id_empresa,
            'idPdvTipoPlano': self.id_pdv_tipo_plano,
            'dataSolicitacao': self.data_solicitacao,
            'dataPagamento': self.data_pagamento,
            'plano': self.plano,
            'valor': self.valor,
            'statusPagamento': self.status_pagamento,
            'codigoTransacao': self.codigo_transacao,
            'metodoPagamento': self.metodo_pagamento,
            'codigoTipoPagamento': self.codigo_tipo_pagamento,
            'dataPlanoExpira': self.data_plano_expira,
            'emailPagamento': self.email_pagamento,
        }