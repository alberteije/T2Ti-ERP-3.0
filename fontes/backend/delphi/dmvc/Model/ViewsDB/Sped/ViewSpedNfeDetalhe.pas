{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_SPED_NFE_DETALHE] 
                                                                                
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
unit ViewSpedNfeDetalhe;

interface

uses
  Generics.Collections, System.SysUtils,
  Produto, TributOperacaoFiscal, ProdutoUnidade, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TViewSpedNfeDetalhe = class(TModelBase)
  private
    FId: Integer;
    FIdNfeCabecalho: Integer;
    FIdProduto: Integer;
    FNumeroItem: Integer;
    FCodigoProduto: string;
    FGtin: string;
    FNomeProduto: string;
    FNcm: string;
    FNve: string;
    FCest: string;
    FIndicadorEscalaRelevante: string;
    FCnpjFabricante: string;
    FCodigoBeneficioFiscal: string;
    FExTipi: Integer;
    FCfop: Integer;
    FUnidadeComercial: string;
    FQuantidadeComercial: Extended;
    FNumeroPedidoCompra: string;
    FItemPedidoCompra: Integer;
    FNumeroFci: string;
    FNumeroRecopi: string;
    FValorUnitarioComercial: Extended;
    FValorBrutoProduto: Extended;
    FGtinUnidadeTributavel: string;
    FUnidadeTributavel: string;
    FQuantidadeTributavel: Extended;
    FValorUnitarioTributavel: Extended;
    FValorFrete: Extended;
    FValorSeguro: Extended;
    FValorDesconto: Extended;
    FValorOutrasDespesas: Extended;
    FEntraTotal: string;
    FValorTotalTributos: Extended;
    FPercentualDevolvido: Extended;
    FValorIpiDevolvido: Extended;
    FInformacoesAdicionais: string;
    FValorSubtotal: Extended;
    FValorTotal: Extended;
    FIdTributOperacaoFiscal: Integer;
    FIdProdutoUnidade: Integer;
    FCstCofins: string;
    FQuantidadeVendidaCofins: Extended;
    FBaseCalculoCofins: Extended;
    FAliquotaCofinsPercentual: Extended;
    FAliquotaCofinsReais: Extended;
    FValorCofins: Extended;
    FOrigemMercadoria: string;
    FCstIcms: string;
    FCsosn: string;
    FModalidadeBcIcms: string;
    FPercentualReducaoBcIcms: Extended;
    FValorBcIcms: Extended;
    FAliquotaIcms: Extended;
    FValorIcms: Extended;
    FMotivoDesoneracaoIcms: string;
    FModalidadeBcIcmsSt: string;
    FPercentualMvaIcmsSt: Extended;
    FPercentualReducaoBcIcmsSt: Extended;
    FValorBaseCalculoIcmsSt: Extended;
    FAliquotaIcmsSt: Extended;
    FValorIcmsSt: Extended;
    FValorBcIcmsStRetido: Extended;
    FValorIcmsStRetido: Extended;
    FValorBcIcmsStDestino: Extended;
    FValorIcmsStDestino: Extended;
    FAliquotaCreditoIcmsSn: Extended;
    FValorCreditoIcmsSn: Extended;
    FPercentualBcOperacaoPropria: Extended;
    FUfSt: string;
    FValorBcIi: Extended;
    FValorDespesasAduaneiras: Extended;
    FValorImpostoImportacao: Extended;
    FValorIof: Extended;
    FCnpjProdutor: string;
    FCodigoSeloIpi: string;
    FQuantidadeSeloIpi: Integer;
    FEnquadramentoLegalIpi: string;
    FCstIpi: string;
    FValorBaseCalculoIpi: Extended;
    FAliquotaIpi: Extended;
    FQuantidadeUnidadeTributavel: Extended;
    FValorUnidadeTributavel: Extended;
    FValorIpi: Extended;
    FBaseCalculoIssqn: Extended;
    FAliquotaIssqn: Extended;
    FValorIssqn: Extended;
    FMunicipioIssqn: Integer;
    FItemListaServicos: Integer;
    FCstPis: string;
    FQuantidadeVendidaPis: Extended;
    FValorBaseCalculoPis: Extended;
    FAliquotaPisPercentual: Extended;
    FAliquotaPisReais: Extended;
    FValorPis: Extended;
      
    FProduto: TProduto;
    FTributOperacaoFiscal: TTributOperacaoFiscal;
    FProdutoUnidade: TProdutoUnidade;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_CABECALHO')]
		[MVCNameAsAttribute('idNfeCabecalho')]
		property IdNfeCabecalho: Integer read FIdNfeCabecalho write FIdNfeCabecalho;
    [MVCColumnAttribute('ID_PRODUTO')]
		[MVCNameAsAttribute('idProduto')]
		property IdProduto: Integer read FIdProduto write FIdProduto;
    [MVCColumnAttribute('NUMERO_ITEM')]
		[MVCNameAsAttribute('numeroItem')]
		property NumeroItem: Integer read FNumeroItem write FNumeroItem;
    [MVCColumnAttribute('CODIGO_PRODUTO')]
		[MVCNameAsAttribute('codigoProduto')]
		property CodigoProduto: string read FCodigoProduto write FCodigoProduto;
    [MVCColumnAttribute('GTIN')]
		[MVCNameAsAttribute('gtin')]
		property Gtin: string read FGtin write FGtin;
    [MVCColumnAttribute('NOME_PRODUTO')]
		[MVCNameAsAttribute('nomeProduto')]
		property NomeProduto: string read FNomeProduto write FNomeProduto;
    [MVCColumnAttribute('NCM')]
		[MVCNameAsAttribute('ncm')]
		property Ncm: string read FNcm write FNcm;
    [MVCColumnAttribute('NVE')]
		[MVCNameAsAttribute('nve')]
		property Nve: string read FNve write FNve;
    [MVCColumnAttribute('CEST')]
		[MVCNameAsAttribute('cest')]
		property Cest: string read FCest write FCest;
    [MVCColumnAttribute('INDICADOR_ESCALA_RELEVANTE')]
		[MVCNameAsAttribute('indicadorEscalaRelevante')]
		property IndicadorEscalaRelevante: string read FIndicadorEscalaRelevante write FIndicadorEscalaRelevante;
    [MVCColumnAttribute('CNPJ_FABRICANTE')]
		[MVCNameAsAttribute('cnpjFabricante')]
		property CnpjFabricante: string read FCnpjFabricante write FCnpjFabricante;
    [MVCColumnAttribute('CODIGO_BENEFICIO_FISCAL')]
		[MVCNameAsAttribute('codigoBeneficioFiscal')]
		property CodigoBeneficioFiscal: string read FCodigoBeneficioFiscal write FCodigoBeneficioFiscal;
    [MVCColumnAttribute('EX_TIPI')]
		[MVCNameAsAttribute('exTipi')]
		property ExTipi: Integer read FExTipi write FExTipi;
    [MVCColumnAttribute('CFOP')]
		[MVCNameAsAttribute('cfop')]
		property Cfop: Integer read FCfop write FCfop;
    [MVCColumnAttribute('UNIDADE_COMERCIAL')]
		[MVCNameAsAttribute('unidadeComercial')]
		property UnidadeComercial: string read FUnidadeComercial write FUnidadeComercial;
    [MVCColumnAttribute('QUANTIDADE_COMERCIAL')]
		[MVCNameAsAttribute('quantidadeComercial')]
		property QuantidadeComercial: Extended read FQuantidadeComercial write FQuantidadeComercial;
    [MVCColumnAttribute('NUMERO_PEDIDO_COMPRA')]
		[MVCNameAsAttribute('numeroPedidoCompra')]
		property NumeroPedidoCompra: string read FNumeroPedidoCompra write FNumeroPedidoCompra;
    [MVCColumnAttribute('ITEM_PEDIDO_COMPRA')]
		[MVCNameAsAttribute('itemPedidoCompra')]
		property ItemPedidoCompra: Integer read FItemPedidoCompra write FItemPedidoCompra;
    [MVCColumnAttribute('NUMERO_FCI')]
		[MVCNameAsAttribute('numeroFci')]
		property NumeroFci: string read FNumeroFci write FNumeroFci;
    [MVCColumnAttribute('NUMERO_RECOPI')]
		[MVCNameAsAttribute('numeroRecopi')]
		property NumeroRecopi: string read FNumeroRecopi write FNumeroRecopi;
    [MVCColumnAttribute('VALOR_UNITARIO_COMERCIAL')]
		[MVCNameAsAttribute('valorUnitarioComercial')]
		property ValorUnitarioComercial: Extended read FValorUnitarioComercial write FValorUnitarioComercial;
    [MVCColumnAttribute('VALOR_BRUTO_PRODUTO')]
		[MVCNameAsAttribute('valorBrutoProduto')]
		property ValorBrutoProduto: Extended read FValorBrutoProduto write FValorBrutoProduto;
    [MVCColumnAttribute('GTIN_UNIDADE_TRIBUTAVEL')]
		[MVCNameAsAttribute('gtinUnidadeTributavel')]
		property GtinUnidadeTributavel: string read FGtinUnidadeTributavel write FGtinUnidadeTributavel;
    [MVCColumnAttribute('UNIDADE_TRIBUTAVEL')]
		[MVCNameAsAttribute('unidadeTributavel')]
		property UnidadeTributavel: string read FUnidadeTributavel write FUnidadeTributavel;
    [MVCColumnAttribute('QUANTIDADE_TRIBUTAVEL')]
		[MVCNameAsAttribute('quantidadeTributavel')]
		property QuantidadeTributavel: Extended read FQuantidadeTributavel write FQuantidadeTributavel;
    [MVCColumnAttribute('VALOR_UNITARIO_TRIBUTAVEL')]
		[MVCNameAsAttribute('valorUnitarioTributavel')]
		property ValorUnitarioTributavel: Extended read FValorUnitarioTributavel write FValorUnitarioTributavel;
    [MVCColumnAttribute('VALOR_FRETE')]
		[MVCNameAsAttribute('valorFrete')]
		property ValorFrete: Extended read FValorFrete write FValorFrete;
    [MVCColumnAttribute('VALOR_SEGURO')]
		[MVCNameAsAttribute('valorSeguro')]
		property ValorSeguro: Extended read FValorSeguro write FValorSeguro;
    [MVCColumnAttribute('VALOR_DESCONTO')]
		[MVCNameAsAttribute('valorDesconto')]
		property ValorDesconto: Extended read FValorDesconto write FValorDesconto;
    [MVCColumnAttribute('VALOR_OUTRAS_DESPESAS')]
		[MVCNameAsAttribute('valorOutrasDespesas')]
		property ValorOutrasDespesas: Extended read FValorOutrasDespesas write FValorOutrasDespesas;
    [MVCColumnAttribute('ENTRA_TOTAL')]
		[MVCNameAsAttribute('entraTotal')]
		property EntraTotal: string read FEntraTotal write FEntraTotal;
    [MVCColumnAttribute('VALOR_TOTAL_TRIBUTOS')]
		[MVCNameAsAttribute('valorTotalTributos')]
		property ValorTotalTributos: Extended read FValorTotalTributos write FValorTotalTributos;
    [MVCColumnAttribute('PERCENTUAL_DEVOLVIDO')]
		[MVCNameAsAttribute('percentualDevolvido')]
		property PercentualDevolvido: Extended read FPercentualDevolvido write FPercentualDevolvido;
    [MVCColumnAttribute('VALOR_IPI_DEVOLVIDO')]
		[MVCNameAsAttribute('valorIpiDevolvido')]
		property ValorIpiDevolvido: Extended read FValorIpiDevolvido write FValorIpiDevolvido;
    [MVCColumnAttribute('INFORMACOES_ADICIONAIS')]
		[MVCNameAsAttribute('informacoesAdicionais')]
		property InformacoesAdicionais: string read FInformacoesAdicionais write FInformacoesAdicionais;
    [MVCColumnAttribute('VALOR_SUBTOTAL')]
		[MVCNameAsAttribute('valorSubtotal')]
		property ValorSubtotal: Extended read FValorSubtotal write FValorSubtotal;
    [MVCColumnAttribute('VALOR_TOTAL')]
		[MVCNameAsAttribute('valorTotal')]
		property ValorTotal: Extended read FValorTotal write FValorTotal;
    [MVCColumnAttribute('ID_TRIBUT_OPERACAO_FISCAL')]
		[MVCNameAsAttribute('idTributOperacaoFiscal')]
		property IdTributOperacaoFiscal: Integer read FIdTributOperacaoFiscal write FIdTributOperacaoFiscal;
    [MVCColumnAttribute('ID_PRODUTO_UNIDADE')]
		[MVCNameAsAttribute('idProdutoUnidade')]
		property IdProdutoUnidade: Integer read FIdProdutoUnidade write FIdProdutoUnidade;
    [MVCColumnAttribute('CST_COFINS')]
		[MVCNameAsAttribute('cstCofins')]
		property CstCofins: string read FCstCofins write FCstCofins;
    [MVCColumnAttribute('QUANTIDADE_VENDIDA_COFINS')]
		[MVCNameAsAttribute('quantidadeVendidaCofins')]
		property QuantidadeVendidaCofins: Extended read FQuantidadeVendidaCofins write FQuantidadeVendidaCofins;
    [MVCColumnAttribute('BASE_CALCULO_COFINS')]
		[MVCNameAsAttribute('baseCalculoCofins')]
		property BaseCalculoCofins: Extended read FBaseCalculoCofins write FBaseCalculoCofins;
    [MVCColumnAttribute('ALIQUOTA_COFINS_PERCENTUAL')]
		[MVCNameAsAttribute('aliquotaCofinsPercentual')]
		property AliquotaCofinsPercentual: Extended read FAliquotaCofinsPercentual write FAliquotaCofinsPercentual;
    [MVCColumnAttribute('ALIQUOTA_COFINS_REAIS')]
		[MVCNameAsAttribute('aliquotaCofinsReais')]
		property AliquotaCofinsReais: Extended read FAliquotaCofinsReais write FAliquotaCofinsReais;
    [MVCColumnAttribute('VALOR_COFINS')]
		[MVCNameAsAttribute('valorCofins')]
		property ValorCofins: Extended read FValorCofins write FValorCofins;
    [MVCColumnAttribute('ORIGEM_MERCADORIA')]
		[MVCNameAsAttribute('origemMercadoria')]
		property OrigemMercadoria: string read FOrigemMercadoria write FOrigemMercadoria;
    [MVCColumnAttribute('CST_ICMS')]
		[MVCNameAsAttribute('cstIcms')]
		property CstIcms: string read FCstIcms write FCstIcms;
    [MVCColumnAttribute('CSOSN')]
		[MVCNameAsAttribute('csosn')]
		property Csosn: string read FCsosn write FCsosn;
    [MVCColumnAttribute('MODALIDADE_BC_ICMS')]
		[MVCNameAsAttribute('modalidadeBcIcms')]
		property ModalidadeBcIcms: string read FModalidadeBcIcms write FModalidadeBcIcms;
    [MVCColumnAttribute('PERCENTUAL_REDUCAO_BC_ICMS')]
		[MVCNameAsAttribute('percentualReducaoBcIcms')]
		property PercentualReducaoBcIcms: Extended read FPercentualReducaoBcIcms write FPercentualReducaoBcIcms;
    [MVCColumnAttribute('VALOR_BC_ICMS')]
		[MVCNameAsAttribute('valorBcIcms')]
		property ValorBcIcms: Extended read FValorBcIcms write FValorBcIcms;
    [MVCColumnAttribute('ALIQUOTA_ICMS')]
		[MVCNameAsAttribute('aliquotaIcms')]
		property AliquotaIcms: Extended read FAliquotaIcms write FAliquotaIcms;
    [MVCColumnAttribute('VALOR_ICMS')]
		[MVCNameAsAttribute('valorIcms')]
		property ValorIcms: Extended read FValorIcms write FValorIcms;
    [MVCColumnAttribute('MOTIVO_DESONERACAO_ICMS')]
		[MVCNameAsAttribute('motivoDesoneracaoIcms')]
		property MotivoDesoneracaoIcms: string read FMotivoDesoneracaoIcms write FMotivoDesoneracaoIcms;
    [MVCColumnAttribute('MODALIDADE_BC_ICMS_ST')]
		[MVCNameAsAttribute('modalidadeBcIcmsSt')]
		property ModalidadeBcIcmsSt: string read FModalidadeBcIcmsSt write FModalidadeBcIcmsSt;
    [MVCColumnAttribute('PERCENTUAL_MVA_ICMS_ST')]
		[MVCNameAsAttribute('percentualMvaIcmsSt')]
		property PercentualMvaIcmsSt: Extended read FPercentualMvaIcmsSt write FPercentualMvaIcmsSt;
    [MVCColumnAttribute('PERCENTUAL_REDUCAO_BC_ICMS_ST')]
		[MVCNameAsAttribute('percentualReducaoBcIcmsSt')]
		property PercentualReducaoBcIcmsSt: Extended read FPercentualReducaoBcIcmsSt write FPercentualReducaoBcIcmsSt;
    [MVCColumnAttribute('VALOR_BASE_CALCULO_ICMS_ST')]
		[MVCNameAsAttribute('valorBaseCalculoIcmsSt')]
		property ValorBaseCalculoIcmsSt: Extended read FValorBaseCalculoIcmsSt write FValorBaseCalculoIcmsSt;
    [MVCColumnAttribute('ALIQUOTA_ICMS_ST')]
		[MVCNameAsAttribute('aliquotaIcmsSt')]
		property AliquotaIcmsSt: Extended read FAliquotaIcmsSt write FAliquotaIcmsSt;
    [MVCColumnAttribute('VALOR_ICMS_ST')]
		[MVCNameAsAttribute('valorIcmsSt')]
		property ValorIcmsSt: Extended read FValorIcmsSt write FValorIcmsSt;
    [MVCColumnAttribute('VALOR_BC_ICMS_ST_RETIDO')]
		[MVCNameAsAttribute('valorBcIcmsStRetido')]
		property ValorBcIcmsStRetido: Extended read FValorBcIcmsStRetido write FValorBcIcmsStRetido;
    [MVCColumnAttribute('VALOR_ICMS_ST_RETIDO')]
		[MVCNameAsAttribute('valorIcmsStRetido')]
		property ValorIcmsStRetido: Extended read FValorIcmsStRetido write FValorIcmsStRetido;
    [MVCColumnAttribute('VALOR_BC_ICMS_ST_DESTINO')]
		[MVCNameAsAttribute('valorBcIcmsStDestino')]
		property ValorBcIcmsStDestino: Extended read FValorBcIcmsStDestino write FValorBcIcmsStDestino;
    [MVCColumnAttribute('VALOR_ICMS_ST_DESTINO')]
		[MVCNameAsAttribute('valorIcmsStDestino')]
		property ValorIcmsStDestino: Extended read FValorIcmsStDestino write FValorIcmsStDestino;
    [MVCColumnAttribute('ALIQUOTA_CREDITO_ICMS_SN')]
		[MVCNameAsAttribute('aliquotaCreditoIcmsSn')]
		property AliquotaCreditoIcmsSn: Extended read FAliquotaCreditoIcmsSn write FAliquotaCreditoIcmsSn;
    [MVCColumnAttribute('VALOR_CREDITO_ICMS_SN')]
		[MVCNameAsAttribute('valorCreditoIcmsSn')]
		property ValorCreditoIcmsSn: Extended read FValorCreditoIcmsSn write FValorCreditoIcmsSn;
    [MVCColumnAttribute('PERCENTUAL_BC_OPERACAO_PROPRIA')]
		[MVCNameAsAttribute('percentualBcOperacaoPropria')]
		property PercentualBcOperacaoPropria: Extended read FPercentualBcOperacaoPropria write FPercentualBcOperacaoPropria;
    [MVCColumnAttribute('UF_ST')]
		[MVCNameAsAttribute('ufSt')]
		property UfSt: string read FUfSt write FUfSt;
    [MVCColumnAttribute('VALOR_BC_II')]
		[MVCNameAsAttribute('valorBcIi')]
		property ValorBcIi: Extended read FValorBcIi write FValorBcIi;
    [MVCColumnAttribute('VALOR_DESPESAS_ADUANEIRAS')]
		[MVCNameAsAttribute('valorDespesasAduaneiras')]
		property ValorDespesasAduaneiras: Extended read FValorDespesasAduaneiras write FValorDespesasAduaneiras;
    [MVCColumnAttribute('VALOR_IMPOSTO_IMPORTACAO')]
		[MVCNameAsAttribute('valorImpostoImportacao')]
		property ValorImpostoImportacao: Extended read FValorImpostoImportacao write FValorImpostoImportacao;
    [MVCColumnAttribute('VALOR_IOF')]
		[MVCNameAsAttribute('valorIof')]
		property ValorIof: Extended read FValorIof write FValorIof;
    [MVCColumnAttribute('CNPJ_PRODUTOR')]
		[MVCNameAsAttribute('cnpjProdutor')]
		property CnpjProdutor: string read FCnpjProdutor write FCnpjProdutor;
    [MVCColumnAttribute('CODIGO_SELO_IPI')]
		[MVCNameAsAttribute('codigoSeloIpi')]
		property CodigoSeloIpi: string read FCodigoSeloIpi write FCodigoSeloIpi;
    [MVCColumnAttribute('QUANTIDADE_SELO_IPI')]
		[MVCNameAsAttribute('quantidadeSeloIpi')]
		property QuantidadeSeloIpi: Integer read FQuantidadeSeloIpi write FQuantidadeSeloIpi;
    [MVCColumnAttribute('ENQUADRAMENTO_LEGAL_IPI')]
		[MVCNameAsAttribute('enquadramentoLegalIpi')]
		property EnquadramentoLegalIpi: string read FEnquadramentoLegalIpi write FEnquadramentoLegalIpi;
    [MVCColumnAttribute('CST_IPI')]
		[MVCNameAsAttribute('cstIpi')]
		property CstIpi: string read FCstIpi write FCstIpi;
    [MVCColumnAttribute('VALOR_BASE_CALCULO_IPI')]
		[MVCNameAsAttribute('valorBaseCalculoIpi')]
		property ValorBaseCalculoIpi: Extended read FValorBaseCalculoIpi write FValorBaseCalculoIpi;
    [MVCColumnAttribute('ALIQUOTA_IPI')]
		[MVCNameAsAttribute('aliquotaIpi')]
		property AliquotaIpi: Extended read FAliquotaIpi write FAliquotaIpi;
    [MVCColumnAttribute('QUANTIDADE_UNIDADE_TRIBUTAVEL')]
		[MVCNameAsAttribute('quantidadeUnidadeTributavel')]
		property QuantidadeUnidadeTributavel: Extended read FQuantidadeUnidadeTributavel write FQuantidadeUnidadeTributavel;
    [MVCColumnAttribute('VALOR_UNIDADE_TRIBUTAVEL')]
		[MVCNameAsAttribute('valorUnidadeTributavel')]
		property ValorUnidadeTributavel: Extended read FValorUnidadeTributavel write FValorUnidadeTributavel;
    [MVCColumnAttribute('VALOR_IPI')]
		[MVCNameAsAttribute('valorIpi')]
		property ValorIpi: Extended read FValorIpi write FValorIpi;
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
    [MVCColumnAttribute('CST_PIS')]
		[MVCNameAsAttribute('cstPis')]
		property CstPis: string read FCstPis write FCstPis;
    [MVCColumnAttribute('QUANTIDADE_VENDIDA_PIS')]
		[MVCNameAsAttribute('quantidadeVendidaPis')]
		property QuantidadeVendidaPis: Extended read FQuantidadeVendidaPis write FQuantidadeVendidaPis;
    [MVCColumnAttribute('VALOR_BASE_CALCULO_PIS')]
		[MVCNameAsAttribute('valorBaseCalculoPis')]
		property ValorBaseCalculoPis: Extended read FValorBaseCalculoPis write FValorBaseCalculoPis;
    [MVCColumnAttribute('ALIQUOTA_PIS_PERCENTUAL')]
		[MVCNameAsAttribute('aliquotaPisPercentual')]
		property AliquotaPisPercentual: Extended read FAliquotaPisPercentual write FAliquotaPisPercentual;
    [MVCColumnAttribute('ALIQUOTA_PIS_REAIS')]
		[MVCNameAsAttribute('aliquotaPisReais')]
		property AliquotaPisReais: Extended read FAliquotaPisReais write FAliquotaPisReais;
    [MVCColumnAttribute('VALOR_PIS')]
		[MVCNameAsAttribute('valorPis')]
		property ValorPis: Extended read FValorPis write FValorPis;
      
    [MVCNameAsAttribute('produto')]
		property Produto: TProduto read FProduto write FProduto;
    [MVCNameAsAttribute('tributOperacaoFiscal')]
		property TributOperacaoFiscal: TTributOperacaoFiscal read FTributOperacaoFiscal write FTributOperacaoFiscal;
    [MVCNameAsAttribute('produtoUnidade')]
		property ProdutoUnidade: TProdutoUnidade read FProdutoUnidade write FProdutoUnidade;
  end;

implementation

{ TViewSpedNfeDetalhe }

constructor TViewSpedNfeDetalhe.Create;
begin
  inherited;

  FProduto := TProduto.Create;
  FTributOperacaoFiscal := TTributOperacaoFiscal.Create;
  FProdutoUnidade := TProdutoUnidade.Create;
end;

destructor TViewSpedNfeDetalhe.Destroy;
begin
  FreeAndNil(FProduto);
  FreeAndNil(FTributOperacaoFiscal);
  FreeAndNil(FProdutoUnidade);
  inherited;
end;



end.