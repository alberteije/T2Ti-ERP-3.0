{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_INFORMACAO_PAGAMENTO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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
unit NfeInformacaoPagamento;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeInformacaoPagamento = class(TModelBase)
  private
    FId: Integer;
    FIdNfeCabecalho: Integer;
    FIndicadorPagamento: string;
    FMeioPagamento: string;
    FValor: Extended;
    FTipoIntegracao: string;
    FCnpjOperadoraCartao: string;
    FBandeira: string;
    FNumeroAutorizacao: string;
    FTroco: Extended;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_CABECALHO')]
		[MVCNameAsAttribute('idNfeCabecalho')]
		property IdNfeCabecalho: Integer read FIdNfeCabecalho write FIdNfeCabecalho;
    [MVCColumnAttribute('INDICADOR_PAGAMENTO')]
		[MVCNameAsAttribute('indicadorPagamento')]
		property IndicadorPagamento: string read FIndicadorPagamento write FIndicadorPagamento;
    [MVCColumnAttribute('MEIO_PAGAMENTO')]
		[MVCNameAsAttribute('meioPagamento')]
		property MeioPagamento: string read FMeioPagamento write FMeioPagamento;
    [MVCColumnAttribute('VALOR')]
		[MVCNameAsAttribute('valor')]
		property Valor: Extended read FValor write FValor;
    [MVCColumnAttribute('TIPO_INTEGRACAO')]
		[MVCNameAsAttribute('tipoIntegracao')]
		property TipoIntegracao: string read FTipoIntegracao write FTipoIntegracao;
    [MVCColumnAttribute('CNPJ_OPERADORA_CARTAO')]
		[MVCNameAsAttribute('cnpjOperadoraCartao')]
		property CnpjOperadoraCartao: string read FCnpjOperadoraCartao write FCnpjOperadoraCartao;
    [MVCColumnAttribute('BANDEIRA')]
		[MVCNameAsAttribute('bandeira')]
		property Bandeira: string read FBandeira write FBandeira;
    [MVCColumnAttribute('NUMERO_AUTORIZACAO')]
		[MVCNameAsAttribute('numeroAutorizacao')]
		property NumeroAutorizacao: string read FNumeroAutorizacao write FNumeroAutorizacao;
    [MVCColumnAttribute('TROCO')]
		[MVCNameAsAttribute('troco')]
		property Troco: Extended read FTroco write FTroco;
      
  end;

implementation

{ TNfeInformacaoPagamento }





end.