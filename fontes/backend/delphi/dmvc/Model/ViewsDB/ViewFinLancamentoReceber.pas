{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_FIN_LANCAMENTO_RECEBER] 
                                                                                
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
unit ViewFinLancamentoReceber;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TViewFinLancamentoReceber = class(TModelBase)
  private
    FId: Integer;
    FIdFinLancamentoReceber: Integer;
    FQuantidadeParcela: Integer;
    FValorLancamento: Extended;
    FDataLancamento: TDateTime;
    FNumeroDocumento: string;
    FIdFinParcelaReceber: Integer;
    FNumeroParcela: Integer;
    FDataVencimento: TDateTime;
    FDataRecebimento: TDateTime;
    FValorParcela: Extended;
    FTaxaJuro: Extended;
    FValorJuro: Extended;
    FTaxaMulta: Extended;
    FValorMulta: Extended;
    FTaxaDesconto: Extended;
    FValorDesconto: Extended;
    FSiglaDocumento: string;
    FNomeCliente: string;
    FIdFinStatusParcela: Integer;
    FSituacaoParcela: string;
    FDescricaoSituacaoParcela: string;
    FIdBancoContaCaixa: Integer;
    FNomeContaCaixa: string;
      
  public
    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_FIN_LANCAMENTO_RECEBER')]
		[MVCNameAsAttribute('idFinLancamentoReceber')]
		property IdFinLancamentoReceber: Integer read FIdFinLancamentoReceber write FIdFinLancamentoReceber;
    [MVCColumnAttribute('QUANTIDADE_PARCELA')]
		[MVCNameAsAttribute('quantidadeParcela')]
		property QuantidadeParcela: Integer read FQuantidadeParcela write FQuantidadeParcela;
    [MVCColumnAttribute('VALOR_LANCAMENTO')]
		[MVCNameAsAttribute('valorLancamento')]
		property ValorLancamento: Extended read FValorLancamento write FValorLancamento;
    [MVCColumnAttribute('DATA_LANCAMENTO')]
		[MVCNameAsAttribute('dataLancamento')]
		property DataLancamento: TDateTime read FDataLancamento write FDataLancamento;
    [MVCColumnAttribute('NUMERO_DOCUMENTO')]
		[MVCNameAsAttribute('numeroDocumento')]
		property NumeroDocumento: string read FNumeroDocumento write FNumeroDocumento;
    [MVCColumnAttribute('ID_FIN_PARCELA_RECEBER')]
		[MVCNameAsAttribute('idFinParcelaReceber')]
		property IdFinParcelaReceber: Integer read FIdFinParcelaReceber write FIdFinParcelaReceber;
    [MVCColumnAttribute('NUMERO_PARCELA')]
		[MVCNameAsAttribute('numeroParcela')]
		property NumeroParcela: Integer read FNumeroParcela write FNumeroParcela;
    [MVCColumnAttribute('DATA_VENCIMENTO')]
		[MVCNameAsAttribute('dataVencimento')]
		property DataVencimento: TDateTime read FDataVencimento write FDataVencimento;
    [MVCColumnAttribute('DATA_RECEBIMENTO')]
		[MVCNameAsAttribute('dataRecebimento')]
		property DataRecebimento: TDateTime read FDataRecebimento write FDataRecebimento;
    [MVCColumnAttribute('VALOR_PARCELA')]
		[MVCNameAsAttribute('valorParcela')]
		property ValorParcela: Extended read FValorParcela write FValorParcela;
    [MVCColumnAttribute('TAXA_JURO')]
		[MVCNameAsAttribute('taxaJuro')]
		property TaxaJuro: Extended read FTaxaJuro write FTaxaJuro;
    [MVCColumnAttribute('VALOR_JURO')]
		[MVCNameAsAttribute('valorJuro')]
		property ValorJuro: Extended read FValorJuro write FValorJuro;
    [MVCColumnAttribute('TAXA_MULTA')]
		[MVCNameAsAttribute('taxaMulta')]
		property TaxaMulta: Extended read FTaxaMulta write FTaxaMulta;
    [MVCColumnAttribute('VALOR_MULTA')]
		[MVCNameAsAttribute('valorMulta')]
		property ValorMulta: Extended read FValorMulta write FValorMulta;
    [MVCColumnAttribute('TAXA_DESCONTO')]
		[MVCNameAsAttribute('taxaDesconto')]
		property TaxaDesconto: Extended read FTaxaDesconto write FTaxaDesconto;
    [MVCColumnAttribute('VALOR_DESCONTO')]
		[MVCNameAsAttribute('valorDesconto')]
		property ValorDesconto: Extended read FValorDesconto write FValorDesconto;
    [MVCColumnAttribute('SIGLA_DOCUMENTO')]
		[MVCNameAsAttribute('siglaDocumento')]
		property SiglaDocumento: string read FSiglaDocumento write FSiglaDocumento;
    [MVCColumnAttribute('NOME_CLIENTE')]
		[MVCNameAsAttribute('nomeCliente')]
		property NomeCliente: string read FNomeCliente write FNomeCliente;
    [MVCColumnAttribute('ID_FIN_STATUS_PARCELA')]
		[MVCNameAsAttribute('idFinStatusParcela')]
		property IdFinStatusParcela: Integer read FIdFinStatusParcela write FIdFinStatusParcela;
    [MVCColumnAttribute('SITUACAO_PARCELA')]
		[MVCNameAsAttribute('situacaoParcela')]
		property SituacaoParcela: string read FSituacaoParcela write FSituacaoParcela;
    [MVCColumnAttribute('DESCRICAO_SITUACAO_PARCELA')]
		[MVCNameAsAttribute('descricaoSituacaoParcela')]
		property DescricaoSituacaoParcela: string read FDescricaoSituacaoParcela write FDescricaoSituacaoParcela;
    [MVCColumnAttribute('ID_BANCO_CONTA_CAIXA')]
		[MVCNameAsAttribute('idBancoContaCaixa')]
		property IdBancoContaCaixa: Integer read FIdBancoContaCaixa write FIdBancoContaCaixa;
    [MVCColumnAttribute('NOME_CONTA_CAIXA')]
		[MVCNameAsAttribute('nomeContaCaixa')]
		property NomeContaCaixa: string read FNomeContaCaixa write FNomeContaCaixa;
      
  end;

implementation

{ TViewFinLancamentoReceber }



end.