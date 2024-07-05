from src import db


class NfeConfiguracaoModel(db.Model):
    __tablename__ = 'nfe_configuracao'

    id = db.Column(db.Integer, primary_key=True)
    certificado_digital_serie = db.Column(db.String(100))
    certificado_digital_caminho = db.Column(db.Text)
    certificado_digital_senha = db.Column(db.String(100))
    tipo_emissao = db.Column(db.Integer)
    formato_impressao_danfe = db.Column(db.Integer)
    processo_emissao = db.Column(db.Integer)
    versao_processo_emissao = db.Column(db.String(20))
    caminho_logomarca = db.Column(db.Text)
    salvar_xml = db.Column(db.String(1))
    caminho_salvar_xml = db.Column(db.Text)
    caminho_schemas = db.Column(db.Text)
    caminho_arquivo_danfe = db.Column(db.Text)
    caminho_salvar_pdf = db.Column(db.Text)
    webservice_uf = db.Column(db.String(2))
    webservice_ambiente = db.Column(db.Integer)
    webservice_proxy_host = db.Column(db.String(100))
    webservice_proxy_porta = db.Column(db.Integer)
    webservice_proxy_usuario = db.Column(db.String(100))
    webservice_proxy_senha = db.Column(db.String(100))
    webservice_visualizar = db.Column(db.String(1))
    email_servidor_smtp = db.Column(db.String(100))
    email_porta = db.Column(db.Integer)
    email_usuario = db.Column(db.String(100))
    email_senha = db.Column(db.String(100))
    email_assunto = db.Column(db.String(100))
    email_autentica_ssl = db.Column(db.String(1))
    email_texto = db.Column(db.Text)
    nfce_id_csc = db.Column(db.String(6))
    nfce_csc = db.Column(db.String(250))
    nfce_modelo_impressao = db.Column(db.String(2))
    nfce_imprimir_itens_uma_linha = db.Column(db.String(1))
    nfce_imprimir_desconto_por_item = db.Column(db.String(1))
    nfce_imprimir_qrcode_lateral = db.Column(db.String(1))
    nfce_imprimir_gtin = db.Column(db.String(1))
    nfce_imprimir_nome_fantasia = db.Column(db.String(1))
    nfce_impressao_tributos = db.Column(db.String(1))
    nfce_margem_superior = db.Column(db.Float)
    nfce_margem_inferior = db.Column(db.Float)
    nfce_margem_direita = db.Column(db.Float)
    nfce_margem_esquerda = db.Column(db.Float)
    nfce_resolucao_impressao = db.Column(db.Integer)
    nfce_tamanho_fonte_item = db.Column(db.Integer)
    resp_tec_cnpj = db.Column(db.String(14))
    resp_tec_contato = db.Column(db.String(60))
    resp_tec_email = db.Column(db.String(60))
    resp_tec_fone = db.Column(db.String(15))
    resp_tec_id_csrt = db.Column(db.String(2))
    resp_tec_hash_csrt = db.Column(db.String(28))
    id_empresa = db.Column(db.Integer, db.ForeignKey('empresa.id'))


    def mapping(self, data):
        self.id = data.get('id')
        self.id_empresa = data.get('idEmpresa')
        self.certificado_digital_serie = data.get('certificadoDigitalSerie')
        self.certificado_digital_caminho = data.get('certificadoDigitalCaminho')
        self.certificado_digital_senha = data.get('certificadoDigitalSenha')
        self.tipo_emissao = data.get('tipoEmissao')
        self.formato_impressao_danfe = data.get('formatoImpressaoDanfe')
        self.processo_emissao = data.get('processoEmissao')
        self.versao_processo_emissao = data.get('versaoProcessoEmissao')
        self.caminho_logomarca = data.get('caminhoLogomarca')
        self.salvar_xml = data.get('salvarXml')
        self.caminho_salvar_xml = data.get('caminhoSalvarXml')
        self.caminho_schemas = data.get('caminhoSchemas')
        self.caminho_arquivo_danfe = data.get('caminhoArquivoDanfe')
        self.caminho_salvar_pdf = data.get('caminhoSalvarPdf')
        self.webservice_uf = data.get('webserviceUf')
        self.webservice_ambiente = data.get('webserviceAmbiente')
        self.webservice_proxy_host = data.get('webserviceProxyHost')
        self.webservice_proxy_porta = data.get('webserviceProxyPorta')
        self.webservice_proxy_usuario = data.get('webserviceProxyUsuario')
        self.webservice_proxy_senha = data.get('webserviceProxySenha')
        self.webservice_visualizar = data.get('webserviceVisualizar')
        self.email_servidor_smtp = data.get('emailServidorSmtp')
        self.email_porta = data.get('emailPorta')
        self.email_usuario = data.get('emailUsuario')
        self.email_senha = data.get('emailSenha')
        self.email_assunto = data.get('emailAssunto')
        self.email_autentica_ssl = data.get('emailAutenticaSsl')
        self.email_texto = data.get('emailTexto')
        self.nfce_id_csc = data.get('nfceIdCsc')
        self.nfce_csc = data.get('nfceCsc')
        self.nfce_modelo_impressao = data.get('nfceModeloImpressao')
        self.nfce_imprimir_itens_uma_linha = data.get('nfceImprimirItensUmaLinha')
        self.nfce_imprimir_desconto_por_item = data.get('nfceImprimirDescontoPorItem')
        self.nfce_imprimir_qrcode_lateral = data.get('nfceImprimirQrcodeLateral')
        self.nfce_imprimir_gtin = data.get('nfceImprimirGtin')
        self.nfce_imprimir_nome_fantasia = data.get('nfceImprimirNomeFantasia')
        self.nfce_impressao_tributos = data.get('nfceImpressaoTributos')
        self.nfce_margem_superior = data.get('nfceMargemSuperior')
        self.nfce_margem_inferior = data.get('nfceMargemInferior')
        self.nfce_margem_direita = data.get('nfceMargemDireita')
        self.nfce_margem_esquerda = data.get('nfceMargemEsquerda')
        self.nfce_resolucao_impressao = data.get('nfceResolucaoImpressao')
        self.nfce_tamanho_fonte_item = data.get('nfceTamanhoFonteItem')
        self.resp_tec_cnpj = data.get('respTecCnpj')
        self.resp_tec_contato = data.get('respTecContato')
        self.resp_tec_email = data.get('respTecEmail')
        self.resp_tec_fone = data.get('respTecFone')
        self.resp_tec_id_csrt = data.get('respTecIdCsrt')
        self.resp_tec_hash_csrt = data.get('respTecHashCsrt')

    def serialize(self):
        return {
            'id': self.id,
            'idEmpresa': self.id_empresa,
            'certificadoDigitalSerie': self.certificado_digital_serie,
            'certificadoDigitalCaminho': self.certificado_digital_caminho,
            'certificadoDigitalSenha': self.certificado_digital_senha,
            'tipoEmissao': self.tipo_emissao,
            'formatoImpressaoDanfe': self.formato_impressao_danfe,
            'processoEmissao': self.processo_emissao,
            'versaoProcessoEmissao': self.versao_processo_emissao,
            'caminhoLogomarca': self.caminho_logomarca,
            'salvarXml': self.salvar_xml,
            'caminhoSalvarXml': self.caminho_salvar_xml,
            'caminhoSchemas': self.caminho_schemas,
            'caminhoArquivoDanfe': self.caminho_arquivo_danfe,
            'caminhoSalvarPdf': self.caminho_salvar_pdf,
            'webserviceUf': self.webservice_uf,
            'webserviceAmbiente': self.webservice_ambiente,
            'webserviceProxyHost': self.webservice_proxy_host,
            'webserviceProxyPorta': self.webservice_proxy_porta,
            'webserviceProxyUsuario': self.webservice_proxy_usuario,
            'webserviceProxySenha': self.webservice_proxy_senha,
            'webserviceVisualizar': self.webservice_visualizar,
            'emailServidorSmtp': self.email_servidor_smtp,
            'emailPorta': self.email_porta,
            'emailUsuario': self.email_usuario,
            'emailSenha': self.email_senha,
            'emailAssunto': self.email_assunto,
            'emailAutenticaSsl': self.email_autentica_ssl,
            'emailTexto': self.email_texto,
            'nfceIdCsc': self.nfce_id_csc,
            'nfceCsc': self.nfce_csc,
            'nfceModeloImpressao': self.nfce_modelo_impressao,
            'nfceImprimirItensUmaLinha': self.nfce_imprimir_itens_uma_linha,
            'nfceImprimirDescontoPorItem': self.nfce_imprimir_desconto_por_item,
            'nfceImprimirQrcodeLateral': self.nfce_imprimir_qrcode_lateral,
            'nfceImprimirGtin': self.nfce_imprimir_gtin,
            'nfceImprimirNomeFantasia': self.nfce_imprimir_nome_fantasia,
            'nfceImpressaoTributos': self.nfce_impressao_tributos,
            'nfceMargemSuperior': self.nfce_margem_superior,
            'nfceMargemInferior': self.nfce_margem_inferior,
            'nfceMargemDireita': self.nfce_margem_direita,
            'nfceMargemEsquerda': self.nfce_margem_esquerda,
            'nfceResolucaoImpressao': self.nfce_resolucao_impressao,
            'nfceTamanhoFonteItem': self.nfce_tamanho_fonte_item,
            'respTecCnpj': self.resp_tec_cnpj,
            'respTecContato': self.resp_tec_contato,
            'respTecEmail': self.resp_tec_email,
            'respTecFone': self.resp_tec_fone,
            'respTecIdCsrt': self.resp_tec_id_csrt,
            'respTecHashCsrt': self.resp_tec_hash_csrt,
        }