{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_ISSQN] 
                                                                                
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
unit NfeDetalheImpostoIssqn;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeDetalheImpostoIssqn = class(TModelBase)
  private
    FId: Integer;
    FIdNfeDetalhe: Integer;
    FBaseCalculoIssqn: Extended;
    FAliquotaIssqn: Extended;
    FValorIssqn: Extended;
    FMunicipioIssqn: Integer;
    FItemListaServicos: Integer;
    FValorDeducao: Extended;
    FValorOutrasRetencoes: Extended;
    FValorDescontoIncondicionado: Extended;
    FValorDescontoCondicionado: Extended;
    FValorRetencaoIss: Extended;
    FIndicadorExigibilidadeIss: string;
    FCodigoServico: string;
    FMunicipioIncidencia: Integer;
    FPaisSevicoPrestado: Integer;
    FNumeroProcesso: string;
    FIndicadorIncentivoFiscal: string;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_DETALHE')]
		[MVCNameAsAttribute('idNfeDetalhe')]
		property IdNfeDetalhe: Integer read FIdNfeDetalhe write FIdNfeDetalhe;
    [MVCColumnAttribute('BASE_CALCULO_ISSQN')]
		[MVCNameAsAttribute('baseCalculoIssqn')]
		property BaseCalculoIssqn: Extended read FBaseCalculoIssqn write FBaseCalculoIssqn;
    [MVCColumnAttribute('ALIQUOTA_ISSQN')]
		[MVCNameAsAttribute('aliquotaIssqn')]
		property AliquotaIssqn: Extended read FAliquotaIssqn write FAliquotaIssqn;
    [MVCColumnAttribute('VALOR_ISSQN')]
		[MVCNameAsAttribute('valorIssqn')]
		property ValorIssqn: Extended read FValorIssqn write FValorIssqn;
    [MVCColumnAttribute('MUNICIPIO_ISSQN')]
		[MVCNameAsAttribute('municipioIssqn')]
		property MunicipioIssqn: Integer read FMunicipioIssqn write FMunicipioIssqn;
    [MVCColumnAttribute('ITEM_LISTA_SERVICOS')]
		[MVCNameAsAttribute('itemListaServicos')]
		property ItemListaServicos: Integer read FItemListaServicos write FItemListaServicos;
    [MVCColumnAttribute('VALOR_DEDUCAO')]
		[MVCNameAsAttribute('valorDeducao')]
		property ValorDeducao: Extended read FValorDeducao write FValorDeducao;
    [MVCColumnAttribute('VALOR_OUTRAS_RETENCOES')]
		[MVCNameAsAttribute('valorOutrasRetencoes')]
		property ValorOutrasRetencoes: Extended read FValorOutrasRetencoes write FValorOutrasRetencoes;
    [MVCColumnAttribute('VALOR_DESCONTO_INCONDICIONADO')]
		[MVCNameAsAttribute('valorDescontoIncondicionado')]
		property ValorDescontoIncondicionado: Extended read FValorDescontoIncondicionado write FValorDescontoIncondicionado;
    [MVCColumnAttribute('VALOR_DESCONTO_CONDICIONADO')]
		[MVCNameAsAttribute('valorDescontoCondicionado')]
		property ValorDescontoCondicionado: Extended read FValorDescontoCondicionado write FValorDescontoCondicionado;
    [MVCColumnAttribute('VALOR_RETENCAO_ISS')]
		[MVCNameAsAttribute('valorRetencaoIss')]
		property ValorRetencaoIss: Extended read FValorRetencaoIss write FValorRetencaoIss;
    [MVCColumnAttribute('INDICADOR_EXIGIBILIDADE_ISS')]
		[MVCNameAsAttribute('indicadorExigibilidadeIss')]
		property IndicadorExigibilidadeIss: string read FIndicadorExigibilidadeIss write FIndicadorExigibilidadeIss;
    [MVCColumnAttribute('CODIGO_SERVICO')]
		[MVCNameAsAttribute('codigoServico')]
		property CodigoServico: string read FCodigoServico write FCodigoServico;
    [MVCColumnAttribute('MUNICIPIO_INCIDENCIA')]
		[MVCNameAsAttribute('municipioIncidencia')]
		property MunicipioIncidencia: Integer read FMunicipioIncidencia write FMunicipioIncidencia;
    [MVCColumnAttribute('PAIS_SEVICO_PRESTADO')]
		[MVCNameAsAttribute('paisSevicoPrestado')]
		property PaisSevicoPrestado: Integer read FPaisSevicoPrestado write FPaisSevicoPrestado;
    [MVCColumnAttribute('NUMERO_PROCESSO')]
		[MVCNameAsAttribute('numeroProcesso')]
		property NumeroProcesso: string read FNumeroProcesso write FNumeroProcesso;
    [MVCColumnAttribute('INDICADOR_INCENTIVO_FISCAL')]
		[MVCNameAsAttribute('indicadorIncentivoFiscal')]
		property IndicadorIncentivoFiscal: string read FIndicadorIncentivoFiscal write FIndicadorIncentivoFiscal;
      
  end;

implementation

{ TNfeDetalheImpostoIssqn }





end.