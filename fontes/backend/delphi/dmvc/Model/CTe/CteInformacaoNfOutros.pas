{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_INFORMACAO_NF_OUTROS] 
                                                                                
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
*******************************************************************************}
unit CteInformacaoNfOutros;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TCteInformacaoNfOutros = class(TModelBase)
  private
    FId: Integer;
    FIdCteCabecalho: Integer;
    FNumeroRomaneio: string;
    FNumeroPedido: string;
    FChaveAcessoNfe: string;
    FCodigoModelo: string;
    FSerie: string;
    FNumero: string;
    FDataEmissao: TDateTime;
    FUfEmitente: Integer;
    FBaseCalculoIcms: Extended;
    FValorIcms: Extended;
    FBaseCalculoIcmsSt: Extended;
    FValorIcmsSt: Extended;
    FValorTotalProdutos: Extended;
    FValorTotal: Extended;
    FCfopPredominante: Integer;
    FPesoTotalKg: Extended;
    FPinSuframa: Integer;
    FDataPrevistaEntrega: TDateTime;
    FOutroTipoDocOrig: string;
    FOutroDescricao: string;
    FOutroValorDocumento: Extended;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_CTE_CABECALHO')]
		[MVCNameAsAttribute('idCteCabecalho')]
		property IdCteCabecalho: Integer read FIdCteCabecalho write FIdCteCabecalho;
    [MVCColumnAttribute('NUMERO_ROMANEIO')]
		[MVCNameAsAttribute('numeroRomaneio')]
		property NumeroRomaneio: string read FNumeroRomaneio write FNumeroRomaneio;
    [MVCColumnAttribute('NUMERO_PEDIDO')]
		[MVCNameAsAttribute('numeroPedido')]
		property NumeroPedido: string read FNumeroPedido write FNumeroPedido;
    [MVCColumnAttribute('CHAVE_ACESSO_NFE')]
		[MVCNameAsAttribute('chaveAcessoNfe')]
		property ChaveAcessoNfe: string read FChaveAcessoNfe write FChaveAcessoNfe;
    [MVCColumnAttribute('CODIGO_MODELO')]
		[MVCNameAsAttribute('codigoModelo')]
		property CodigoModelo: string read FCodigoModelo write FCodigoModelo;
    [MVCColumnAttribute('SERIE')]
		[MVCNameAsAttribute('serie')]
		property Serie: string read FSerie write FSerie;
    [MVCColumnAttribute('NUMERO')]
		[MVCNameAsAttribute('numero')]
		property Numero: string read FNumero write FNumero;
    [MVCColumnAttribute('DATA_EMISSAO')]
		[MVCNameAsAttribute('dataEmissao')]
		property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    [MVCColumnAttribute('UF_EMITENTE')]
		[MVCNameAsAttribute('ufEmitente')]
		property UfEmitente: Integer read FUfEmitente write FUfEmitente;
    [MVCColumnAttribute('BASE_CALCULO_ICMS')]
		[MVCNameAsAttribute('baseCalculoIcms')]
		property BaseCalculoIcms: Extended read FBaseCalculoIcms write FBaseCalculoIcms;
    [MVCColumnAttribute('VALOR_ICMS')]
		[MVCNameAsAttribute('valorIcms')]
		property ValorIcms: Extended read FValorIcms write FValorIcms;
    [MVCColumnAttribute('BASE_CALCULO_ICMS_ST')]
		[MVCNameAsAttribute('baseCalculoIcmsSt')]
		property BaseCalculoIcmsSt: Extended read FBaseCalculoIcmsSt write FBaseCalculoIcmsSt;
    [MVCColumnAttribute('VALOR_ICMS_ST')]
		[MVCNameAsAttribute('valorIcmsSt')]
		property ValorIcmsSt: Extended read FValorIcmsSt write FValorIcmsSt;
    [MVCColumnAttribute('VALOR_TOTAL_PRODUTOS')]
		[MVCNameAsAttribute('valorTotalProdutos')]
		property ValorTotalProdutos: Extended read FValorTotalProdutos write FValorTotalProdutos;
    [MVCColumnAttribute('VALOR_TOTAL')]
		[MVCNameAsAttribute('valorTotal')]
		property ValorTotal: Extended read FValorTotal write FValorTotal;
    [MVCColumnAttribute('CFOP_PREDOMINANTE')]
		[MVCNameAsAttribute('cfopPredominante')]
		property CfopPredominante: Integer read FCfopPredominante write FCfopPredominante;
    [MVCColumnAttribute('PESO_TOTAL_KG')]
		[MVCNameAsAttribute('pesoTotalKg')]
		property PesoTotalKg: Extended read FPesoTotalKg write FPesoTotalKg;
    [MVCColumnAttribute('PIN_SUFRAMA')]
		[MVCNameAsAttribute('pinSuframa')]
		property PinSuframa: Integer read FPinSuframa write FPinSuframa;
    [MVCColumnAttribute('DATA_PREVISTA_ENTREGA')]
		[MVCNameAsAttribute('dataPrevistaEntrega')]
		property DataPrevistaEntrega: TDateTime read FDataPrevistaEntrega write FDataPrevistaEntrega;
    [MVCColumnAttribute('OUTRO_TIPO_DOC_ORIG')]
		[MVCNameAsAttribute('outroTipoDocOrig')]
		property OutroTipoDocOrig: string read FOutroTipoDocOrig write FOutroTipoDocOrig;
    [MVCColumnAttribute('OUTRO_DESCRICAO')]
		[MVCNameAsAttribute('outroDescricao')]
		property OutroDescricao: string read FOutroDescricao write FOutroDescricao;
    [MVCColumnAttribute('OUTRO_VALOR_DOCUMENTO')]
		[MVCNameAsAttribute('outroValorDocumento')]
		property OutroValorDocumento: Extended read FOutroValorDocumento write FOutroValorDocumento;
      
  end;

implementation

{ TCteInformacaoNfOutros }



end.