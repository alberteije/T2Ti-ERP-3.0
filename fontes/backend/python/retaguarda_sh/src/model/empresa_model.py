from src import db
from src.model.nfe_configuracao_model import NfeConfiguracaoModel
from src.model.pdv_plano_pagamento_model import PdvPlanoPagamentoModel
from src.model.acbr_monitor_porta_model import AcbrMonitorPortaModel
from src.model.empresa_plano_model import EmpresaPlanoModel
from src.model.adm_modulo_model import AdmModuloModel


class EmpresaModel(db.Model):
    __tablename__ = 'empresa'

    id = db.Column(db.Integer, primary_key=True)
    razao_social = db.Column(db.String(150))
    nome_fantasia = db.Column(db.String(150))
    cnpj = db.Column(db.String(14))
    inscricao_estadual = db.Column(db.String(30))
    inscricao_municipal = db.Column(db.String(30))
    tipo_regime = db.Column(db.String(1))
    crt = db.Column(db.String(1))
    data_constituicao = db.Column(db.DateTime)
    tipo = db.Column(db.String(1))
    email = db.Column(db.String(250))
    logradouro = db.Column(db.String(250))
    numero = db.Column(db.String(10))
    complemento = db.Column(db.String(100))
    cep = db.Column(db.String(8))
    bairro = db.Column(db.String(100))
    cidade = db.Column(db.String(100))
    uf = db.Column(db.String(2))
    fone = db.Column(db.String(15))
    contato = db.Column(db.String(30))
    codigo_ibge_cidade = db.Column(db.Integer)
    codigo_ibge_uf = db.Column(db.Integer)
    logotipo = db.Column(db.Text)
    registrado = db.Column(db.String(1))
    natureza_juridica = db.Column(db.String(200))
    simei = db.Column(db.String(1))
    email_pagamento = db.Column(db.String(250))
    data_registro = db.Column(db.DateTime)
    hora_registro = db.Column(db.String(8))
    id_plataforma_pagamento = db.Column(db.String(100))

    nfe_configuracao_model_list = db.relationship('NfeConfiguracaoModel', lazy='dynamic')
    pdv_plano_pagamento_model_list = db.relationship('PdvPlanoPagamentoModel', lazy='dynamic')
    acbr_monitor_porta_model_list = db.relationship('AcbrMonitorPortaModel', lazy='dynamic')
    empresa_plano_model_list = db.relationship('EmpresaPlanoModel', lazy='dynamic')
    adm_modulo_model_list = db.relationship('AdmModuloModel', lazy='dynamic')

    def mapping(self, data):
        self.id = data.get('id')
        self.razao_social = data.get('razaoSocial')
        self.nome_fantasia = data.get('nomeFantasia')
        self.cnpj = data.get('cnpj')
        self.inscricao_estadual = data.get('inscricaoEstadual')
        self.inscricao_municipal = data.get('inscricaoMunicipal')
        self.tipo_regime = data.get('tipoRegime')
        self.crt = data.get('crt')
        self.data_constituicao = data.get('dataConstituicao')
        self.tipo = data.get('tipo')
        self.email = data.get('email')
        self.logradouro = data.get('logradouro')
        self.numero = data.get('numero')
        self.complemento = data.get('complemento')
        self.cep = data.get('cep')
        self.bairro = data.get('bairro')
        self.cidade = data.get('cidade')
        self.uf = data.get('uf')
        self.fone = data.get('fone')
        self.contato = data.get('contato')
        self.codigo_ibge_cidade = data.get('codigoIbgeCidade')
        self.codigo_ibge_uf = data.get('codigoIbgeUf')
        self.logotipo = data.get('logotipo')
        self.registrado = data.get('registrado')
        self.natureza_juridica = data.get('naturezaJuridica')
        self.simei = data.get('simei')
        self.email_pagamento = data.get('emailPagamento')
        self.data_registro = data.get('dataRegistro')
        self.hora_registro = data.get('horaRegistro')
        self.id_plataforma_pagamento = data.get('idPlataformaPagamento')

    def serialize(self):
        return {
            'id': self.id,
            'razaoSocial': self.razao_social,
            'nomeFantasia': self.nome_fantasia,
            'cnpj': self.cnpj,
            'inscricaoEstadual': self.inscricao_estadual,
            'inscricaoMunicipal': self.inscricao_municipal,
            'tipoRegime': self.tipo_regime,
            'crt': self.crt,
            'dataConstituicao': self.data_constituicao,
            'tipo': self.tipo,
            'email': self.email,
            'logradouro': self.logradouro,
            'numero': self.numero,
            'complemento': self.complemento,
            'cep': self.cep,
            'bairro': self.bairro,
            'cidade': self.cidade,
            'uf': self.uf,
            'fone': self.fone,
            'contato': self.contato,
            'codigoIbgeCidade': self.codigo_ibge_cidade,
            'codigoIbgeUf': self.codigo_ibge_uf,
            'logotipo': self.logotipo,
            'registrado': self.registrado,
            'naturezaJuridica': self.natureza_juridica,
            'simei': self.simei,
            'emailPagamento': self.email_pagamento,
            'dataRegistro': self.data_registro,
            'horaRegistro': self.hora_registro,
            'idPlataformaPagamento': self.id_plataforma_pagamento,
            'nfeConfiguracaoModelList': [nfe_configuracao_model.serialize() for nfe_configuracao_model in self.nfe_configuracao_model_list],
            'pdvPlanoPagamentoModelList': [pdv_plano_pagamento_model.serialize() for pdv_plano_pagamento_model in self.pdv_plano_pagamento_model_list],
            'acbrMonitorPortaModelList': [acbr_monitor_porta_model.serialize() for acbr_monitor_porta_model in self.acbr_monitor_porta_model_list],
            'empresaPlanoModelList': [empresa_plano_model.serialize() for empresa_plano_model in self.empresa_plano_model_list],
            'admModuloModelList': [adm_modulo_model.serialize() for adm_modulo_model in self.adm_modulo_model_list],
        }