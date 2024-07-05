{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_FIN_MOVIMENTO_CAIXA_BANCO] 
                                                                                
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
unit ViewFinMovimentoCaixaBanco;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TViewFinMovimentoCaixaBanco = class(TModelBase)
  private
    FId: Integer;
    FIdContaCaixa: Integer;
    FNomeContaCaixa: string;
    FNomePessoa: string;
    FDataLancamento: TDateTime;
    FDataPagoRecebido: TDateTime;
    FMesAno: string;
    FHistorico: string;
    FValor: Extended;
    FDescricaoDocumentoOrigem: string;
    FOperacao: string;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_CONTA_CAIXA')]
		[MVCNameAsAttribute('idContaCaixa')]
		property IdContaCaixa: Integer read FIdContaCaixa write FIdContaCaixa;
    [MVCColumnAttribute('NOME_CONTA_CAIXA')]
		[MVCNameAsAttribute('nomeContaCaixa')]
		property NomeContaCaixa: string read FNomeContaCaixa write FNomeContaCaixa;
    [MVCColumnAttribute('NOME_PESSOA')]
		[MVCNameAsAttribute('nomePessoa')]
		property NomePessoa: string read FNomePessoa write FNomePessoa;
    [MVCColumnAttribute('DATA_LANCAMENTO')]
		[MVCNameAsAttribute('dataLancamento')]
		property DataLancamento: TDateTime read FDataLancamento write FDataLancamento;
    [MVCColumnAttribute('DATA_PAGO_RECEBIDO')]
		[MVCNameAsAttribute('dataPagoRecebido')]
		property DataPagoRecebido: TDateTime read FDataPagoRecebido write FDataPagoRecebido;
    [MVCColumnAttribute('MES_ANO')]
		[MVCNameAsAttribute('mesAno')]
		property MesAno: string read FMesAno write FMesAno;
    [MVCColumnAttribute('HISTORICO')]
		[MVCNameAsAttribute('historico')]
		property Historico: string read FHistorico write FHistorico;
    [MVCColumnAttribute('VALOR')]
		[MVCNameAsAttribute('valor')]
		property Valor: Extended read FValor write FValor;
    [MVCColumnAttribute('DESCRICAO_DOCUMENTO_ORIGEM')]
		[MVCNameAsAttribute('descricaoDocumentoOrigem')]
		property DescricaoDocumentoOrigem: string read FDescricaoDocumentoOrigem write FDescricaoDocumentoOrigem;
    [MVCColumnAttribute('OPERACAO')]
		[MVCNameAsAttribute('operacao')]
		property Operacao: string read FOperacao write FOperacao;
      
  end;

implementation

{ TViewFinMovimentoCaixaBanco }





end.