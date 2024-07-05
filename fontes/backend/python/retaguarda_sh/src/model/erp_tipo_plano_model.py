from src import db


class ErpTipoPlanoModel(db.Model):
    __tablename__ = 'erp_tipo_plano'

    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(100))
    valor = db.Column(db.Float)
    frequencia = db.Column(db.String(100))
    acesso_total = db.Column(db.Boolean)
    ativo = db.Column(db.Boolean)


    def mapping(self, data):
        self.id = data.get('id')
        self.nome = data.get('nome')
        self.valor = data.get('valor')
        self.frequencia = data.get('frequencia')
        self.acesso_total = data.get('acessoTotal')
        self.ativo = data.get('ativo')

    def serialize(self):
        return {
            'id': self.id,
            'nome': self.nome,
            'valor': self.valor,
            'frequencia': self.frequencia,
            'acessoTotal': self.acesso_total,
            'ativo': self.ativo,
        }