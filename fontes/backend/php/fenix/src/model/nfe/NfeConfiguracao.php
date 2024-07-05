<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_CONFIGURACAO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************/
declare(strict_types=1);

class NfeConfiguracao extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_CONFIGURACAO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */

    /**
     * Gets e Sets
     */
    public function getIdAttribute() 
	{
		return $this->attributes['ID'];
	}

	public function setIdAttribute($id) 
	{
		$this->attributes['ID'] = $id;
	}

    public function getCertificadoDigitalSerieAttribute() 
	{
		return $this->attributes['CERTIFICADO_DIGITAL_SERIE'];
	}

	public function setCertificadoDigitalSerieAttribute($certificadoDigitalSerie) 
	{
		$this->attributes['CERTIFICADO_DIGITAL_SERIE'] = $certificadoDigitalSerie;
	}

    public function getCertificadoDigitalCaminhoAttribute() 
	{
		return $this->attributes['CERTIFICADO_DIGITAL_CAMINHO'];
	}

	public function setCertificadoDigitalCaminhoAttribute($certificadoDigitalCaminho) 
	{
		$this->attributes['CERTIFICADO_DIGITAL_CAMINHO'] = $certificadoDigitalCaminho;
	}

    public function getCertificadoDigitalSenhaAttribute() 
	{
		return $this->attributes['CERTIFICADO_DIGITAL_SENHA'];
	}

	public function setCertificadoDigitalSenhaAttribute($certificadoDigitalSenha) 
	{
		$this->attributes['CERTIFICADO_DIGITAL_SENHA'] = $certificadoDigitalSenha;
	}

    public function getTipoEmissaoAttribute() 
	{
		return $this->attributes['TIPO_EMISSAO'];
	}

	public function setTipoEmissaoAttribute($tipoEmissao) 
	{
		$this->attributes['TIPO_EMISSAO'] = $tipoEmissao;
	}

    public function getFormatoImpressaoDanfeAttribute() 
	{
		return $this->attributes['FORMATO_IMPRESSAO_DANFE'];
	}

	public function setFormatoImpressaoDanfeAttribute($formatoImpressaoDanfe) 
	{
		$this->attributes['FORMATO_IMPRESSAO_DANFE'] = $formatoImpressaoDanfe;
	}

    public function getProcessoEmissaoAttribute() 
	{
		return $this->attributes['PROCESSO_EMISSAO'];
	}

	public function setProcessoEmissaoAttribute($processoEmissao) 
	{
		$this->attributes['PROCESSO_EMISSAO'] = $processoEmissao;
	}

    public function getVersaoProcessoEmissaoAttribute() 
	{
		return $this->attributes['VERSAO_PROCESSO_EMISSAO'];
	}

	public function setVersaoProcessoEmissaoAttribute($versaoProcessoEmissao) 
	{
		$this->attributes['VERSAO_PROCESSO_EMISSAO'] = $versaoProcessoEmissao;
	}

    public function getCaminhoLogomarcaAttribute() 
	{
		return $this->attributes['CAMINHO_LOGOMARCA'];
	}

	public function setCaminhoLogomarcaAttribute($caminhoLogomarca) 
	{
		$this->attributes['CAMINHO_LOGOMARCA'] = $caminhoLogomarca;
	}

    public function getSalvarXmlAttribute() 
	{
		return $this->attributes['SALVAR_XML'];
	}

	public function setSalvarXmlAttribute($salvarXml) 
	{
		$this->attributes['SALVAR_XML'] = $salvarXml;
	}

    public function getCaminhoSalvarXmlAttribute() 
	{
		return $this->attributes['CAMINHO_SALVAR_XML'];
	}

	public function setCaminhoSalvarXmlAttribute($caminhoSalvarXml) 
	{
		$this->attributes['CAMINHO_SALVAR_XML'] = $caminhoSalvarXml;
	}

    public function getCaminhoSchemasAttribute() 
	{
		return $this->attributes['CAMINHO_SCHEMAS'];
	}

	public function setCaminhoSchemasAttribute($caminhoSchemas) 
	{
		$this->attributes['CAMINHO_SCHEMAS'] = $caminhoSchemas;
	}

    public function getCaminhoArquivoDanfeAttribute() 
	{
		return $this->attributes['CAMINHO_ARQUIVO_DANFE'];
	}

	public function setCaminhoArquivoDanfeAttribute($caminhoArquivoDanfe) 
	{
		$this->attributes['CAMINHO_ARQUIVO_DANFE'] = $caminhoArquivoDanfe;
	}

    public function getCaminhoSalvarPdfAttribute() 
	{
		return $this->attributes['CAMINHO_SALVAR_PDF'];
	}

	public function setCaminhoSalvarPdfAttribute($caminhoSalvarPdf) 
	{
		$this->attributes['CAMINHO_SALVAR_PDF'] = $caminhoSalvarPdf;
	}

    public function getWebserviceUfAttribute() 
	{
		return $this->attributes['WEBSERVICE_UF'];
	}

	public function setWebserviceUfAttribute($webserviceUf) 
	{
		$this->attributes['WEBSERVICE_UF'] = $webserviceUf;
	}

    public function getWebserviceAmbienteAttribute() 
	{
		return $this->attributes['WEBSERVICE_AMBIENTE'];
	}

	public function setWebserviceAmbienteAttribute($webserviceAmbiente) 
	{
		$this->attributes['WEBSERVICE_AMBIENTE'] = $webserviceAmbiente;
	}

    public function getWebserviceProxyHostAttribute() 
	{
		return $this->attributes['WEBSERVICE_PROXY_HOST'];
	}

	public function setWebserviceProxyHostAttribute($webserviceProxyHost) 
	{
		$this->attributes['WEBSERVICE_PROXY_HOST'] = $webserviceProxyHost;
	}

    public function getWebserviceProxyPortaAttribute() 
	{
		return $this->attributes['WEBSERVICE_PROXY_PORTA'];
	}

	public function setWebserviceProxyPortaAttribute($webserviceProxyPorta) 
	{
		$this->attributes['WEBSERVICE_PROXY_PORTA'] = $webserviceProxyPorta;
	}

    public function getWebserviceProxyUsuarioAttribute() 
	{
		return $this->attributes['WEBSERVICE_PROXY_USUARIO'];
	}

	public function setWebserviceProxyUsuarioAttribute($webserviceProxyUsuario) 
	{
		$this->attributes['WEBSERVICE_PROXY_USUARIO'] = $webserviceProxyUsuario;
	}

    public function getWebserviceProxySenhaAttribute() 
	{
		return $this->attributes['WEBSERVICE_PROXY_SENHA'];
	}

	public function setWebserviceProxySenhaAttribute($webserviceProxySenha) 
	{
		$this->attributes['WEBSERVICE_PROXY_SENHA'] = $webserviceProxySenha;
	}

    public function getWebserviceVisualizarAttribute() 
	{
		return $this->attributes['WEBSERVICE_VISUALIZAR'];
	}

	public function setWebserviceVisualizarAttribute($webserviceVisualizar) 
	{
		$this->attributes['WEBSERVICE_VISUALIZAR'] = $webserviceVisualizar;
	}

    public function getEmailServidorSmtpAttribute() 
	{
		return $this->attributes['EMAIL_SERVIDOR_SMTP'];
	}

	public function setEmailServidorSmtpAttribute($emailServidorSmtp) 
	{
		$this->attributes['EMAIL_SERVIDOR_SMTP'] = $emailServidorSmtp;
	}

    public function getEmailPortaAttribute() 
	{
		return $this->attributes['EMAIL_PORTA'];
	}

	public function setEmailPortaAttribute($emailPorta) 
	{
		$this->attributes['EMAIL_PORTA'] = $emailPorta;
	}

    public function getEmailUsuarioAttribute() 
	{
		return $this->attributes['EMAIL_USUARIO'];
	}

	public function setEmailUsuarioAttribute($emailUsuario) 
	{
		$this->attributes['EMAIL_USUARIO'] = $emailUsuario;
	}

    public function getEmailSenhaAttribute() 
	{
		return $this->attributes['EMAIL_SENHA'];
	}

	public function setEmailSenhaAttribute($emailSenha) 
	{
		$this->attributes['EMAIL_SENHA'] = $emailSenha;
	}

    public function getEmailAssuntoAttribute() 
	{
		return $this->attributes['EMAIL_ASSUNTO'];
	}

	public function setEmailAssuntoAttribute($emailAssunto) 
	{
		$this->attributes['EMAIL_ASSUNTO'] = $emailAssunto;
	}

    public function getEmailAutenticaSslAttribute() 
	{
		return $this->attributes['EMAIL_AUTENTICA_SSL'];
	}

	public function setEmailAutenticaSslAttribute($emailAutenticaSsl) 
	{
		$this->attributes['EMAIL_AUTENTICA_SSL'] = $emailAutenticaSsl;
	}

    public function getEmailTextoAttribute() 
	{
		return $this->attributes['EMAIL_TEXTO'];
	}

	public function setEmailTextoAttribute($emailTexto) 
	{
		$this->attributes['EMAIL_TEXTO'] = $emailTexto;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCertificadoDigitalSerieAttribute($objeto->certificadoDigitalSerie);
			$this->setCertificadoDigitalCaminhoAttribute($objeto->certificadoDigitalCaminho);
			$this->setCertificadoDigitalSenhaAttribute($objeto->certificadoDigitalSenha);
			$this->setTipoEmissaoAttribute($objeto->tipoEmissao);
			$this->setFormatoImpressaoDanfeAttribute($objeto->formatoImpressaoDanfe);
			$this->setProcessoEmissaoAttribute($objeto->processoEmissao);
			$this->setVersaoProcessoEmissaoAttribute($objeto->versaoProcessoEmissao);
			$this->setCaminhoLogomarcaAttribute($objeto->caminhoLogomarca);
			$this->setSalvarXmlAttribute($objeto->salvarXml);
			$this->setCaminhoSalvarXmlAttribute($objeto->caminhoSalvarXml);
			$this->setCaminhoSchemasAttribute($objeto->caminhoSchemas);
			$this->setCaminhoArquivoDanfeAttribute($objeto->caminhoArquivoDanfe);
			$this->setCaminhoSalvarPdfAttribute($objeto->caminhoSalvarPdf);
			$this->setWebserviceUfAttribute($objeto->webserviceUf);
			$this->setWebserviceAmbienteAttribute($objeto->webserviceAmbiente);
			$this->setWebserviceProxyHostAttribute($objeto->webserviceProxyHost);
			$this->setWebserviceProxyPortaAttribute($objeto->webserviceProxyPorta);
			$this->setWebserviceProxyUsuarioAttribute($objeto->webserviceProxyUsuario);
			$this->setWebserviceProxySenhaAttribute($objeto->webserviceProxySenha);
			$this->setWebserviceVisualizarAttribute($objeto->webserviceVisualizar);
			$this->setEmailServidorSmtpAttribute($objeto->emailServidorSmtp);
			$this->setEmailPortaAttribute($objeto->emailPorta);
			$this->setEmailUsuarioAttribute($objeto->emailUsuario);
			$this->setEmailSenhaAttribute($objeto->emailSenha);
			$this->setEmailAssuntoAttribute($objeto->emailAssunto);
			$this->setEmailAutenticaSslAttribute($objeto->emailAutenticaSsl);
			$this->setEmailTextoAttribute($objeto->emailTexto);

			// vincular objetos
        }
    }

    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getIdAttribute(),
			'certificadoDigitalSerie' => $this->getCertificadoDigitalSerieAttribute(),
			'certificadoDigitalCaminho' => $this->getCertificadoDigitalCaminhoAttribute(),
			'certificadoDigitalSenha' => $this->getCertificadoDigitalSenhaAttribute(),
			'tipoEmissao' => $this->getTipoEmissaoAttribute(),
			'formatoImpressaoDanfe' => $this->getFormatoImpressaoDanfeAttribute(),
			'processoEmissao' => $this->getProcessoEmissaoAttribute(),
			'versaoProcessoEmissao' => $this->getVersaoProcessoEmissaoAttribute(),
			'caminhoLogomarca' => $this->getCaminhoLogomarcaAttribute(),
			'salvarXml' => $this->getSalvarXmlAttribute(),
			'caminhoSalvarXml' => $this->getCaminhoSalvarXmlAttribute(),
			'caminhoSchemas' => $this->getCaminhoSchemasAttribute(),
			'caminhoArquivoDanfe' => $this->getCaminhoArquivoDanfeAttribute(),
			'caminhoSalvarPdf' => $this->getCaminhoSalvarPdfAttribute(),
			'webserviceUf' => $this->getWebserviceUfAttribute(),
			'webserviceAmbiente' => $this->getWebserviceAmbienteAttribute(),
			'webserviceProxyHost' => $this->getWebserviceProxyHostAttribute(),
			'webserviceProxyPorta' => $this->getWebserviceProxyPortaAttribute(),
			'webserviceProxyUsuario' => $this->getWebserviceProxyUsuarioAttribute(),
			'webserviceProxySenha' => $this->getWebserviceProxySenhaAttribute(),
			'webserviceVisualizar' => $this->getWebserviceVisualizarAttribute(),
			'emailServidorSmtp' => $this->getEmailServidorSmtpAttribute(),
			'emailPorta' => $this->getEmailPortaAttribute(),
			'emailUsuario' => $this->getEmailUsuarioAttribute(),
			'emailSenha' => $this->getEmailSenhaAttribute(),
			'emailAssunto' => $this->getEmailAssuntoAttribute(),
			'emailAutenticaSsl' => $this->getEmailAutenticaSslAttribute(),
			'emailTexto' => $this->getEmailTextoAttribute(),
        ];
    }
}