{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_CONFIGURACAO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2014 T2Ti.COM                                          
                                                                                
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
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                    
@version 2.0                                                                    
*******************************************************************************}
unit NfeConfiguracaoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TNfeConfiguracaoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FCERTIFICADO_DIGITAL_SERIE: String;
    FCERTIFICADO_DIGITAL_CAMINHO: String;
    FCERTIFICADO_DIGITAL_SENHA: String;
    FTIPO_EMISSAO: Integer;
    FFORMATO_IMPRESSAO_DANFE: Integer;
    FPROCESSO_EMISSAO: Integer;
    FVERSAO_PROCESSO_EMISSAO: String;
    FCAMINHO_LOGOMARCA: String;
    FSALVAR_XML: String;
    FCAMINHO_SALVAR_XML: String;
    FCAMINHO_SCHEMAS: String;
    FCAMINHO_ARQUIVO_DANFE: String;
    FCAMINHO_SALVAR_PDF: String;
    FWEBSERVICE_UF: String;
    FWEBSERVICE_AMBIENTE: Integer;
    FWEBSERVICE_PROXY_HOST: String;
    FWEBSERVICE_PROXY_PORTA: Integer;
    FWEBSERVICE_PROXY_USUARIO: String;
    FWEBSERVICE_PROXY_SENHA: String;
    FWEBSERVICE_VISUALIZAR: String;
    FEMAIL_SERVIDOR_SMTP: String;
    FEMAIL_PORTA: Integer;
    FEMAIL_USUARIO: String;
    FEMAIL_SENHA: String;
    FEMAIL_ASSUNTO: String;
    FEMAIL_AUTENTICA_SSL: String;
    FEMAIL_TEXTO: String;

  published 
    property Id: Integer  read FID write FID;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property CertificadoDigitalSerie: String  read FCERTIFICADO_DIGITAL_SERIE write FCERTIFICADO_DIGITAL_SERIE;
    property CertificadoDigitalCaminho: String  read FCERTIFICADO_DIGITAL_CAMINHO write FCERTIFICADO_DIGITAL_CAMINHO;
    property CertificadoDigitalSenha: String  read FCERTIFICADO_DIGITAL_SENHA write FCERTIFICADO_DIGITAL_SENHA;
    property TipoEmissao: Integer  read FTIPO_EMISSAO write FTIPO_EMISSAO;
    property FormatoImpressaoDanfe: Integer  read FFORMATO_IMPRESSAO_DANFE write FFORMATO_IMPRESSAO_DANFE;
    property ProcessoEmissao: Integer  read FPROCESSO_EMISSAO write FPROCESSO_EMISSAO;
    property VersaoProcessoEmissao: String  read FVERSAO_PROCESSO_EMISSAO write FVERSAO_PROCESSO_EMISSAO;
    property CaminhoLogomarca: String  read FCAMINHO_LOGOMARCA write FCAMINHO_LOGOMARCA;
    property SalvarXml: String  read FSALVAR_XML write FSALVAR_XML;
    property CaminhoSalvarXml: String  read FCAMINHO_SALVAR_XML write FCAMINHO_SALVAR_XML;
    property CaminhoSchemas: String  read FCAMINHO_SCHEMAS write FCAMINHO_SCHEMAS;
    property CaminhoArquivoDanfe: String  read FCAMINHO_ARQUIVO_DANFE write FCAMINHO_ARQUIVO_DANFE;
    property CaminhoSalvarPdf: String  read FCAMINHO_SALVAR_PDF write FCAMINHO_SALVAR_PDF;
    property WebserviceUf: String  read FWEBSERVICE_UF write FWEBSERVICE_UF;
    property WebserviceAmbiente: Integer  read FWEBSERVICE_AMBIENTE write FWEBSERVICE_AMBIENTE;
    property WebserviceProxyHost: String  read FWEBSERVICE_PROXY_HOST write FWEBSERVICE_PROXY_HOST;
    property WebserviceProxyPorta: Integer  read FWEBSERVICE_PROXY_PORTA write FWEBSERVICE_PROXY_PORTA;
    property WebserviceProxyUsuario: String  read FWEBSERVICE_PROXY_USUARIO write FWEBSERVICE_PROXY_USUARIO;
    property WebserviceProxySenha: String  read FWEBSERVICE_PROXY_SENHA write FWEBSERVICE_PROXY_SENHA;
    property WebserviceVisualizar: String  read FWEBSERVICE_VISUALIZAR write FWEBSERVICE_VISUALIZAR;
    property EmailServidorSmtp: String  read FEMAIL_SERVIDOR_SMTP write FEMAIL_SERVIDOR_SMTP;
    property EmailPorta: Integer  read FEMAIL_PORTA write FEMAIL_PORTA;
    property EmailUsuario: String  read FEMAIL_USUARIO write FEMAIL_USUARIO;
    property EmailSenha: String  read FEMAIL_SENHA write FEMAIL_SENHA;
    property EmailAssunto: String  read FEMAIL_ASSUNTO write FEMAIL_ASSUNTO;
    property EmailAutenticaSsl: String  read FEMAIL_AUTENTICA_SSL write FEMAIL_AUTENTICA_SSL;
    property EmailTexto: String  read FEMAIL_TEXTO write FEMAIL_TEXTO;

  end;

  TListaNfeConfiguracaoVO = specialize TFPGObjectList<TNfeConfiguracaoVO>;

implementation


initialization
  Classes.RegisterClass(TNfeConfiguracaoVO);

finalization
  Classes.UnRegisterClass(TNfeConfiguracaoVO);

end.
