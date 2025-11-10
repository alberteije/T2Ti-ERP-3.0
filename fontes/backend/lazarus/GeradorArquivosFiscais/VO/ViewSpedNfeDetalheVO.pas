{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_SPED_NFE_DETALHE] 
                                                                                
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
unit ViewSpedNfeDetalheVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TViewSpedNfeDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_PRODUTO: Integer;
    FID_NFE_CABECALHO: Integer;
    FNUMERO_ITEM: Integer;
    FCODIGO_PRODUTO: String;
    FGTIN: String;
    FNOME_PRODUTO: String;
    FNCM: String;
    FNVE: String;
    FEX_TIPI: Integer;
    FCFOP: Integer;
    FUNIDADE_COMERCIAL: String;
    FQUANTIDADE_COMERCIAL: Extended;
    FVALOR_UNITARIO_COMERCIAL: Extended;
    FVALOR_BRUTO_PRODUTO: Extended;
    FGTIN_UNIDADE_TRIBUTAVEL: String;
    FUNIDADE_TRIBUTAVEL: String;
    FQUANTIDADE_TRIBUTAVEL: Extended;
    FVALOR_UNITARIO_TRIBUTAVEL: Extended;
    FVALOR_FRETE: Extended;
    FVALOR_SEGURO: Extended;
    FVALOR_DESCONTO: Extended;
    FVALOR_OUTRAS_DESPESAS: Extended;
    FENTRA_TOTAL: Integer;
    FVALOR_SUBTOTAL: Extended;
    FVALOR_TOTAL: Extended;
    FNUMERO_PEDIDO_COMPRA: String;
    FITEM_PEDIDO_COMPRA: Integer;
    FINFORMACOES_ADICIONAIS: String;
    FNUMERO_FCI: String;
    FNUMERO_RECOPI: String;
    FVALOR_TOTAL_TRIBUTOS: Extended;
    FPERCENTUAL_DEVOLVIDO: Extended;
    FVALOR_IPI_DEVOLVIDO: Extended;
    FID_TRIBUT_OPERACAO_FISCAL: Integer;
    FID_UNIDADE_PRODUTO: Integer;
    FCST_COFINS: String;
    FQUANTIDADE_VENDIDA_COFINS: Extended;
    FBASE_CALCULO_COFINS: Extended;
    FALIQUOTA_COFINS_PERCENTUAL: Extended;
    FALIQUOTA_COFINS_REAIS: Extended;
    FVALOR_COFINS: Extended;
    FORIGEM_MERCADORIA: Integer;
    FCST_ICMS: String;
    FCSOSN: String;
    FMODALIDADE_BC_ICMS: Integer;
    FTAXA_REDUCAO_BC_ICMS: Extended;
    FBASE_CALCULO_ICMS: Extended;
    FALIQUOTA_ICMS: Extended;
    FVALOR_ICMS: Extended;
    FMOTIVO_DESONERACAO_ICMS: Integer;
    FMODALIDADE_BC_ICMS_ST: Integer;
    FPERCENTUAL_MVA_ICMS_ST: Extended;
    FPERCENTUAL_REDUCAO_BC_ICMS_ST: Extended;
    FVALOR_BASE_CALCULO_ICMS_ST: Extended;
    FALIQUOTA_ICMS_ST: Extended;
    FVALOR_ICMS_ST: Extended;
    FVALOR_BC_ICMS_ST_RETIDO: Extended;
    FVALOR_ICMS_ST_RETIDO: Extended;
    FVALOR_BC_ICMS_ST_DESTINO: Extended;
    FVALOR_ICMS_ST_DESTINO: Extended;
    FALIQUOTA_CREDITO_ICMS_SN: Extended;
    FVALOR_CREDITO_ICMS_SN: Extended;
    FPERCENTUAL_BC_OPERACAO_PROPRIA: Extended;
    FUF_ST: String;
    FVALOR_BC_II: Extended;
    FVALOR_DESPESAS_ADUANEIRAS: Extended;
    FVALOR_IMPOSTO_IMPORTACAO: Extended;
    FVALOR_IOF: Extended;
    FENQUADRAMENTO_IPI: String;
    FCNPJ_PRODUTOR: String;
    FCODIGO_SELO_IPI: String;
    FQUANTIDADE_SELO_IPI: Integer;
    FENQUADRAMENTO_LEGAL_IPI: String;
    FCST_IPI: String;
    FVALOR_BASE_CALCULO_IPI: Extended;
    FALIQUOTA_IPI: Extended;
    FQUANTIDADE_UNIDADE_TRIBUTAVEL: Extended;
    FVALOR_UNIDADE_TRIBUTAVEL: Extended;
    FVALOR_IPI: Extended;
    FBASE_CALCULO_ISSQN: Extended;
    FALIQUOTA_ISSQN: Extended;
    FVALOR_ISSQN: Extended;
    FMUNICIPIO_ISSQN: Integer;
    FITEM_LISTA_SERVICOS: Integer;
    FCST_PIS: String;
    FQUANTIDADE_VENDIDA_PIS: Extended;
    FVALOR_BASE_CALCULO_PIS: Extended;
    FALIQUOTA_PIS_PERCENTUAL: Extended;
    FALIQUOTA_PIS_REAIS: Extended;
    FVALOR_PIS: Extended;

  published 
    property Id: Integer  read FID write FID;
    property IdProduto: Integer  read FID_PRODUTO write FID_PRODUTO;
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    property NumeroItem: Integer  read FNUMERO_ITEM write FNUMERO_ITEM;
    property CodigoProduto: String  read FCODIGO_PRODUTO write FCODIGO_PRODUTO;
    property Gtin: String  read FGTIN write FGTIN;
    property NomeProduto: String  read FNOME_PRODUTO write FNOME_PRODUTO;
    property Ncm: String  read FNCM write FNCM;
    property Nve: String  read FNVE write FNVE;
    property ExTipi: Integer  read FEX_TIPI write FEX_TIPI;
    property Cfop: Integer  read FCFOP write FCFOP;
    property UnidadeComercial: String  read FUNIDADE_COMERCIAL write FUNIDADE_COMERCIAL;
    property QuantidadeComercial: Extended  read FQUANTIDADE_COMERCIAL write FQUANTIDADE_COMERCIAL;
    property ValorUnitarioComercial: Extended  read FVALOR_UNITARIO_COMERCIAL write FVALOR_UNITARIO_COMERCIAL;
    property ValorBrutoProduto: Extended  read FVALOR_BRUTO_PRODUTO write FVALOR_BRUTO_PRODUTO;
    property GtinUnidadeTributavel: String  read FGTIN_UNIDADE_TRIBUTAVEL write FGTIN_UNIDADE_TRIBUTAVEL;
    property UnidadeTributavel: String  read FUNIDADE_TRIBUTAVEL write FUNIDADE_TRIBUTAVEL;
    property QuantidadeTributavel: Extended  read FQUANTIDADE_TRIBUTAVEL write FQUANTIDADE_TRIBUTAVEL;
    property ValorUnitarioTributavel: Extended  read FVALOR_UNITARIO_TRIBUTAVEL write FVALOR_UNITARIO_TRIBUTAVEL;
    property ValorFrete: Extended  read FVALOR_FRETE write FVALOR_FRETE;
    property ValorSeguro: Extended  read FVALOR_SEGURO write FVALOR_SEGURO;
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    property ValorOutrasDespesas: Extended  read FVALOR_OUTRAS_DESPESAS write FVALOR_OUTRAS_DESPESAS;
    property EntraTotal: Integer  read FENTRA_TOTAL write FENTRA_TOTAL;
    property ValorSubtotal: Extended  read FVALOR_SUBTOTAL write FVALOR_SUBTOTAL;
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    property NumeroPedidoCompra: String  read FNUMERO_PEDIDO_COMPRA write FNUMERO_PEDIDO_COMPRA;
    property ItemPedidoCompra: Integer  read FITEM_PEDIDO_COMPRA write FITEM_PEDIDO_COMPRA;
    property InformacoesAdicionais: String  read FINFORMACOES_ADICIONAIS write FINFORMACOES_ADICIONAIS;
    property NumeroFci: String  read FNUMERO_FCI write FNUMERO_FCI;
    property NumeroRecopi: String  read FNUMERO_RECOPI write FNUMERO_RECOPI;
    property ValorTotalTributos: Extended  read FVALOR_TOTAL_TRIBUTOS write FVALOR_TOTAL_TRIBUTOS;
    property PercentualDevolvido: Extended  read FPERCENTUAL_DEVOLVIDO write FPERCENTUAL_DEVOLVIDO;
    property ValorIpiDevolvido: Extended  read FVALOR_IPI_DEVOLVIDO write FVALOR_IPI_DEVOLVIDO;
    property IdTributOperacaoFiscal: Integer  read FID_TRIBUT_OPERACAO_FISCAL write FID_TRIBUT_OPERACAO_FISCAL;
    property IdUnidadeProduto: Integer  read FID_UNIDADE_PRODUTO write FID_UNIDADE_PRODUTO;
    property CstCofins: String  read FCST_COFINS write FCST_COFINS;
    property QuantidadeVendidaCofins: Extended  read FQUANTIDADE_VENDIDA_COFINS write FQUANTIDADE_VENDIDA_COFINS;
    property BaseCalculoCofins: Extended  read FBASE_CALCULO_COFINS write FBASE_CALCULO_COFINS;
    property AliquotaCofinsPercentual: Extended  read FALIQUOTA_COFINS_PERCENTUAL write FALIQUOTA_COFINS_PERCENTUAL;
    property AliquotaCofinsReais: Extended  read FALIQUOTA_COFINS_REAIS write FALIQUOTA_COFINS_REAIS;
    property ValorCofins: Extended  read FVALOR_COFINS write FVALOR_COFINS;
    property OrigemMercadoria: Integer  read FORIGEM_MERCADORIA write FORIGEM_MERCADORIA;
    property CstIcms: String  read FCST_ICMS write FCST_ICMS;
    property Csosn: String  read FCSOSN write FCSOSN;
    property ModalidadeBcIcms: Integer  read FMODALIDADE_BC_ICMS write FMODALIDADE_BC_ICMS;
    property TaxaReducaoBcIcms: Extended  read FTAXA_REDUCAO_BC_ICMS write FTAXA_REDUCAO_BC_ICMS;
    property BaseCalculoIcms: Extended  read FBASE_CALCULO_ICMS write FBASE_CALCULO_ICMS;
    property AliquotaIcms: Extended  read FALIQUOTA_ICMS write FALIQUOTA_ICMS;
    property ValorIcms: Extended  read FVALOR_ICMS write FVALOR_ICMS;
    property MotivoDesoneracaoIcms: Integer  read FMOTIVO_DESONERACAO_ICMS write FMOTIVO_DESONERACAO_ICMS;
    property ModalidadeBcIcmsSt: Integer  read FMODALIDADE_BC_ICMS_ST write FMODALIDADE_BC_ICMS_ST;
    property PercentualMvaIcmsSt: Extended  read FPERCENTUAL_MVA_ICMS_ST write FPERCENTUAL_MVA_ICMS_ST;
    property PercentualReducaoBcIcmsSt: Extended  read FPERCENTUAL_REDUCAO_BC_ICMS_ST write FPERCENTUAL_REDUCAO_BC_ICMS_ST;
    property ValorBaseCalculoIcmsSt: Extended  read FVALOR_BASE_CALCULO_ICMS_ST write FVALOR_BASE_CALCULO_ICMS_ST;
    property AliquotaIcmsSt: Extended  read FALIQUOTA_ICMS_ST write FALIQUOTA_ICMS_ST;
    property ValorIcmsSt: Extended  read FVALOR_ICMS_ST write FVALOR_ICMS_ST;
    property ValorBcIcmsStRetido: Extended  read FVALOR_BC_ICMS_ST_RETIDO write FVALOR_BC_ICMS_ST_RETIDO;
    property ValorIcmsStRetido: Extended  read FVALOR_ICMS_ST_RETIDO write FVALOR_ICMS_ST_RETIDO;
    property ValorBcIcmsStDestino: Extended  read FVALOR_BC_ICMS_ST_DESTINO write FVALOR_BC_ICMS_ST_DESTINO;
    property ValorIcmsStDestino: Extended  read FVALOR_ICMS_ST_DESTINO write FVALOR_ICMS_ST_DESTINO;
    property AliquotaCreditoIcmsSn: Extended  read FALIQUOTA_CREDITO_ICMS_SN write FALIQUOTA_CREDITO_ICMS_SN;
    property ValorCreditoIcmsSn: Extended  read FVALOR_CREDITO_ICMS_SN write FVALOR_CREDITO_ICMS_SN;
    property PercentualBcOperacaoPropria: Extended  read FPERCENTUAL_BC_OPERACAO_PROPRIA write FPERCENTUAL_BC_OPERACAO_PROPRIA;
    property UfSt: String  read FUF_ST write FUF_ST;
    property ValorBcIi: Extended  read FVALOR_BC_II write FVALOR_BC_II;
    property ValorDespesasAduaneiras: Extended  read FVALOR_DESPESAS_ADUANEIRAS write FVALOR_DESPESAS_ADUANEIRAS;
    property ValorImpostoImportacao: Extended  read FVALOR_IMPOSTO_IMPORTACAO write FVALOR_IMPOSTO_IMPORTACAO;
    property ValorIof: Extended  read FVALOR_IOF write FVALOR_IOF;
    property EnquadramentoIpi: String  read FENQUADRAMENTO_IPI write FENQUADRAMENTO_IPI;
    property CnpjProdutor: String  read FCNPJ_PRODUTOR write FCNPJ_PRODUTOR;
    property CodigoSeloIpi: String  read FCODIGO_SELO_IPI write FCODIGO_SELO_IPI;
    property QuantidadeSeloIpi: Integer  read FQUANTIDADE_SELO_IPI write FQUANTIDADE_SELO_IPI;
    property EnquadramentoLegalIpi: String  read FENQUADRAMENTO_LEGAL_IPI write FENQUADRAMENTO_LEGAL_IPI;
    property CstIpi: String  read FCST_IPI write FCST_IPI;
    property ValorBaseCalculoIpi: Extended  read FVALOR_BASE_CALCULO_IPI write FVALOR_BASE_CALCULO_IPI;
    property AliquotaIpi: Extended  read FALIQUOTA_IPI write FALIQUOTA_IPI;
    property QuantidadeUnidadeTributavel: Extended  read FQUANTIDADE_UNIDADE_TRIBUTAVEL write FQUANTIDADE_UNIDADE_TRIBUTAVEL;
    property ValorUnidadeTributavel: Extended  read FVALOR_UNIDADE_TRIBUTAVEL write FVALOR_UNIDADE_TRIBUTAVEL;
    property ValorIpi: Extended  read FVALOR_IPI write FVALOR_IPI;
    property BaseCalculoIssqn: Extended  read FBASE_CALCULO_ISSQN write FBASE_CALCULO_ISSQN;
    property AliquotaIssqn: Extended  read FALIQUOTA_ISSQN write FALIQUOTA_ISSQN;
    property ValorIssqn: Extended  read FVALOR_ISSQN write FVALOR_ISSQN;
    property MunicipioIssqn: Integer  read FMUNICIPIO_ISSQN write FMUNICIPIO_ISSQN;
    property ItemListaServicos: Integer  read FITEM_LISTA_SERVICOS write FITEM_LISTA_SERVICOS;
    property CstPis: String  read FCST_PIS write FCST_PIS;
    property QuantidadeVendidaPis: Extended  read FQUANTIDADE_VENDIDA_PIS write FQUANTIDADE_VENDIDA_PIS;
    property ValorBaseCalculoPis: Extended  read FVALOR_BASE_CALCULO_PIS write FVALOR_BASE_CALCULO_PIS;
    property AliquotaPisPercentual: Extended  read FALIQUOTA_PIS_PERCENTUAL write FALIQUOTA_PIS_PERCENTUAL;
    property AliquotaPisReais: Extended  read FALIQUOTA_PIS_REAIS write FALIQUOTA_PIS_REAIS;
    property ValorPis: Extended  read FVALOR_PIS write FVALOR_PIS;

  end;

  TListaViewSpedNfeDetalheVO = specialize TFPGObjectList<TViewSpedNfeDetalheVO>;

implementation


initialization
  Classes.RegisterClass(TViewSpedNfeDetalheVO);

finalization
  Classes.UnRegisterClass(TViewSpedNfeDetalheVO);

end.
