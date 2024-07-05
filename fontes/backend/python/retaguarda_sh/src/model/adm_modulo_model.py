from src import db


class AdmModuloModel(db.Model):
    __tablename__ = 'adm_modulo'

    id = db.Column(db.Integer, primary_key=True)
    codigo = db.Column(db.String(3))
    bloco = db.Column(db.String(100))
    nome = db.Column(db.String(100))
    descricao = db.Column(db.String(250))
    link = db.Column(db.String(250))
    id_empresa = db.Column(db.Integer, db.ForeignKey('empresa.id'))


    def mapping(self, data):
        self.id = data.get('id')
        self.id_empresa = data.get('idEmpresa')
        self.codigo = data.get('codigo')
        self.bloco = data.get('bloco')
        self.nome = data.get('nome')
        self.descricao = data.get('descricao')
        self.link = data.get('link')

    def serialize(self):
        return {
            'id': self.id,
            'idEmpresa': self.id_empresa,
            'codigo': self.codigo,
            'bloco': self.bloco,
            'nome': self.nome,
            'descricao': self.descricao,
            'link': self.link,
        }