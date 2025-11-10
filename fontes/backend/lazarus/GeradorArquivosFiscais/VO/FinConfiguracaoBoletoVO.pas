{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_CONFIGURACAO_BOLETO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2016 T2Ti.COM                                          
                                                                                
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
unit FinConfiguracaoBoletoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ContaCaixaVO;

type
  TFinConfiguracaoBoletoVO = class(TVO)
  private
    FID: Integer;
    FID_CONTA_CAIXA: Integer;
    FID_EMPRESA: Integer;
    FINSTRUCAO01: String;
    FINSTRUCAO02: String;
    FCAMINHO_ARQUIVO_REMESSA: String;
    FCAMINHO_ARQUIVO_RETORNO: String;
    FCAMINHO_ARQUIVO_LOGOTIPO: String;
    FCAMINHO_ARQUIVO_PDF: String;
    FMENSAGEM: String;
    FLOCAL_PAGAMENTO: String;
    FLAYOUT_REMESSA: String;
    FACEITE: String;
    FESPECIE: String;
    FCARTEIRA: String;
    FCODIGO_CONVENIO: String;
    FCODIGO_CEDENTE: String;
    FTAXA_MULTA: Extended;

    //Transientes
    FContaCaixaNome: String;

    FContaCaixaVO: TContaCaixaVO;


  published 
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    property ContaCaixaNome: String read FContaCaixaNome write FContaCaixaNome;

    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property Instrucao01: String  read FINSTRUCAO01 write FINSTRUCAO01;
    property Instrucao02: String  read FINSTRUCAO02 write FINSTRUCAO02;
    property CaminhoArquivoRemessa: String  read FCAMINHO_ARQUIVO_REMESSA write FCAMINHO_ARQUIVO_REMESSA;
    property CaminhoArquivoRetorno: String  read FCAMINHO_ARQUIVO_RETORNO write FCAMINHO_ARQUIVO_RETORNO;
    property CaminhoArquivoLogotipo: String  read FCAMINHO_ARQUIVO_LOGOTIPO write FCAMINHO_ARQUIVO_LOGOTIPO;
    property CaminhoArquivoPdf: String  read FCAMINHO_ARQUIVO_PDF write FCAMINHO_ARQUIVO_PDF;
    property Mensagem: String  read FMENSAGEM write FMENSAGEM;
    property LocalPagamento: String  read FLOCAL_PAGAMENTO write FLOCAL_PAGAMENTO;
    property LayoutRemessa: String  read FLAYOUT_REMESSA write FLAYOUT_REMESSA;
    property Aceite: String  read FACEITE write FACEITE;
    property Especie: String  read FESPECIE write FESPECIE;
    property Carteira: String  read FCARTEIRA write FCARTEIRA;
    property CodigoConvenio: String  read FCODIGO_CONVENIO write FCODIGO_CONVENIO;
    property CodigoCedente: String  read FCODIGO_CEDENTE write FCODIGO_CEDENTE;
    property TaxaMulta: Extended  read FTAXA_MULTA write FTAXA_MULTA;


    //Transientes
    property ContaCaixaVO: TContaCaixaVO read FContaCaixaVO write FContaCaixaVO;



  end;

  TListaFinConfiguracaoBoletoVO = specialize TFPGObjectList<TFinConfiguracaoBoletoVO>;

implementation

constructor TFinConfiguracaoBoletoVO.Create;
begin
  inherited;

  FContaCaixaVO := TContaCaixaVO.Create;
end;

destructor TFinConfiguracaoBoletoVO.Destroy;
begin
  FreeAndNil(FContaCaixaVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TFinConfiguracaoBoletoVO);

finalization
  Classes.UnRegisterClass(TFinConfiguracaoBoletoVO);

end.
