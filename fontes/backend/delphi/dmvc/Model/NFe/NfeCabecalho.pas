{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_CABECALHO] 
                                                                                
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
unit NfeCabecalho;

interface

uses
  Generics.Collections, System.SysUtils,
  NfeAcessoXml, NfeCana, NfeCteReferenciado, NfeCupomFiscalReferenciado, NfeDestinatario, NfeDetalhe, NfeEmitente, NfeFatura, NfeInformacaoPagamento, NfeLocalEntrega, NfeLocalRetirada, NfeNfReferenciada, NfeProcessoReferenciado, NfeProdRuralReferenciada, NfeReferenciada, NfeResponsavelTecnico, NfeTransporte, Vendedor, Fornecedor, Cliente, TributOperacaoFiscal, VendaCabecalho, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeCabecalho = class(TModelBase)
  private
    FId: Integer;
    FIdVendedor: Integer;
    FIdFornecedor: Integer;
    FIdCliente: Integer;
    FIdTributOperacaoFiscal: Integer;
    FIdVendaCabecalho: Integer;
    FUfEmitente: Integer;
    FCodigoNumerico: string;
    FNaturezaOperacao: string;
    FCodigoModelo: string;
    FSerie: string;
    FNumero: string;
    FDataHoraEmissao: TDateTime;
    FDataHoraEntradaSaida: TDateTime;
    FTipoOperacao: string;
    FLocalDestino: string;
    FCodigoMunicipio: Integer;
    FFormatoImpressaoDanfe: string;
    FTipoEmissao: string;
    FChaveAcesso: string;
    FDigitoChaveAcesso: string;
    FAmbiente: string;
    FFinalidadeEmissao: string;
    FConsumidorOperacao: string;
    FConsumidorPresenca: string;
    FProcessoEmissao: string;
    FVersaoProcessoEmissao: string;
    FDataEntradaContingencia: TDateTime;
    FJustificativaContingencia: string;
    FBaseCalculoIcms: Extended;
    FValorIcms: Extended;
    FValorIcmsDesonerado: Extended;
    FTotalIcmsFcpUfDestino: Extended;
    FTotalIcmsInterestadualUfDestino: Extended;
    FTotalIcmsInterestadualUfRemetente: Extended;
    FValorTotalFcp: Extended;
    FBaseCalculoIcmsSt: Extended;
    FValorIcmsSt: Extended;
    FValorTotalFcpSt: Extended;
    FValorTotalFcpStRetido: Extended;
    FValorTotalProdutos: Extended;
    FValorFrete: Extended;
    FValorSeguro: Extended;
    FValorDesconto: Extended;
    FValorImpostoImportacao: Extended;
    FValorIpi: Extended;
    FValorIpiDevolvido: Extended;
    FValorPis: Extended;
    FValorCofins: Extended;
    FValorDespesasAcessorias: Extended;
    FValorTotal: Extended;
    FValorTotalTributos: Extended;
    FValorServicos: Extended;
    FBaseCalculoIssqn: Extended;
    FValorIssqn: Extended;
    FValorPisIssqn: Extended;
    FValorCofinsIssqn: Extended;
    FDataPrestacaoServico: TDateTime;
    FValorDeducaoIssqn: Extended;
    FOutrasRetencoesIssqn: Extended;
    FDescontoIncondicionadoIssqn: Extended;
    FDescontoCondicionadoIssqn: Extended;
    FTotalRetencaoIssqn: Extended;
    FRegimeEspecialTributacao: string;
    FValorRetidoPis: Extended;
    FValorRetidoCofins: Extended;
    FValorRetidoCsll: Extended;
    FBaseCalculoIrrf: Extended;
    FValorRetidoIrrf: Extended;
    FBaseCalculoPrevidencia: Extended;
    FValorRetidoPrevidencia: Extended;
    FInformacoesAddFisco: string;
    FInformacoesAddContribuinte: string;
    FComexUfEmbarque: string;
    FComexLocalEmbarque: string;
    FComexLocalDespacho: string;
    FCompraNotaEmpenho: string;
    FCompraPedido: string;
    FCompraContrato: string;
    FQrcode: string;
    FUrlChave: string;
    FStatusNota: string;
      
    FNfeCana: TNfeCana;
    FNfeDestinatario: TNfeDestinatario;
    FNfeEmitente: TNfeEmitente;
    FNfeFatura: TNfeFatura;
    FNfeInformacaoPagamento: TNfeInformacaoPagamento;
    FNfeLocalEntrega: TNfeLocalEntrega;
    FNfeLocalRetirada: TNfeLocalRetirada;
    FNfeResponsavelTecnico: TNfeResponsavelTecnico;
    FNfeTransporte: TNfeTransporte;
    FVendedor: TVendedor;
    FFornecedor: TFornecedor;
    FCliente: TCliente;
    FTributOperacaoFiscal: TTributOperacaoFiscal;
    FVendaCabecalho: TVendaCabecalho;
    FListaNfeAcessoXml: TObjectList<TNfeAcessoXml>;
    FListaNfeCteReferenciado: TObjectList<TNfeCteReferenciado>;
    FListaNfeCupomFiscalReferenciado: TObjectList<TNfeCupomFiscalReferenciado>;
    FListaNfeDetalhe: TObjectList<TNfeDetalhe>;
    FListaNfeNfReferenciada: TObjectList<TNfeNfReferenciada>;
    FListaNfeProcessoReferenciado: TObjectList<TNfeProcessoReferenciado>;
    FListaNfeProdRuralReferenciada: TObjectList<TNfeProdRuralReferenciada>;
    FListaNfeReferenciada: TObjectList<TNfeReferenciada>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_VENDEDOR')]
		[MVCNameAsAttribute('idVendedor')]
		property IdVendedor: Integer read FIdVendedor write FIdVendedor;
    [MVCColumnAttribute('ID_FORNECEDOR')]
		[MVCNameAsAttribute('idFornecedor')]
		property IdFornecedor: Integer read FIdFornecedor write FIdFornecedor;
    [MVCColumnAttribute('ID_CLIENTE')]
		[MVCNameAsAttribute('idCliente')]
		property IdCliente: Integer read FIdCliente write FIdCliente;
    [MVCColumnAttribute('ID_TRIBUT_OPERACAO_FISCAL')]
		[MVCNameAsAttribute('idTributOperacaoFiscal')]
		property IdTributOperacaoFiscal: Integer read FIdTributOperacaoFiscal write FIdTributOperacaoFiscal;
    [MVCColumnAttribute('ID_VENDA_CABECALHO')]
		[MVCNameAsAttribute('idVendaCabecalho')]
		property IdVendaCabecalho: Integer read FIdVendaCabecalho write FIdVendaCabecalho;
    [MVCColumnAttribute('UF_EMITENTE')]
		[MVCNameAsAttribute('ufEmitente')]
		property UfEmitente: Integer read FUfEmitente write FUfEmitente;
    [MVCColumnAttribute('CODIGO_NUMERICO')]
		[MVCNameAsAttribute('codigoNumerico')]
		property CodigoNumerico: string read FCodigoNumerico write FCodigoNumerico;
    [MVCColumnAttribute('NATUREZA_OPERACAO')]
		[MVCNameAsAttribute('naturezaOperacao')]
		property NaturezaOperacao: string read FNaturezaOperacao write FNaturezaOperacao;
    [MVCColumnAttribute('CODIGO_MODELO')]
		[MVCNameAsAttribute('codigoModelo')]
		property CodigoModelo: string read FCodigoModelo write FCodigoModelo;
    [MVCColumnAttribute('SERIE')]
		[MVCNameAsAttribute('serie')]
		property Serie: string read FSerie write FSerie;
    [MVCColumnAttribute('NUMERO')]
		[MVCNameAsAttribute('numero')]
		property Numero: string read FNumero write FNumero;
    [MVCColumnAttribute('DATA_HORA_EMISSAO')]
		[MVCNameAsAttribute('dataHoraEmissao')]
		property DataHoraEmissao: TDateTime read FDataHoraEmissao write FDataHoraEmissao;
    [MVCColumnAttribute('DATA_HORA_ENTRADA_SAIDA')]
		[MVCNameAsAttribute('dataHoraEntradaSaida')]
		property DataHoraEntradaSaida: TDateTime read FDataHoraEntradaSaida write FDataHoraEntradaSaida;
    [MVCColumnAttribute('TIPO_OPERACAO')]
		[MVCNameAsAttribute('tipoOperacao')]
		property TipoOperacao: string read FTipoOperacao write FTipoOperacao;
    [MVCColumnAttribute('LOCAL_DESTINO')]
		[MVCNameAsAttribute('localDestino')]
		property LocalDestino: string read FLocalDestino write FLocalDestino;
    [MVCColumnAttribute('CODIGO_MUNICIPIO')]
		[MVCNameAsAttribute('codigoMunicipio')]
		property CodigoMunicipio: Integer read FCodigoMunicipio write FCodigoMunicipio;
    [MVCColumnAttribute('FORMATO_IMPRESSAO_DANFE')]
		[MVCNameAsAttribute('formatoImpressaoDanfe')]
		property FormatoImpressaoDanfe: string read FFormatoImpressaoDanfe write FFormatoImpressaoDanfe;
    [MVCColumnAttribute('TIPO_EMISSAO')]
		[MVCNameAsAttribute('tipoEmissao')]
		property TipoEmissao: string read FTipoEmissao write FTipoEmissao;
    [MVCColumnAttribute('CHAVE_ACESSO')]
		[MVCNameAsAttribute('chaveAcesso')]
		property ChaveAcesso: string read FChaveAcesso write FChaveAcesso;
    [MVCColumnAttribute('DIGITO_CHAVE_ACESSO')]
		[MVCNameAsAttribute('digitoChaveAcesso')]
		property DigitoChaveAcesso: string read FDigitoChaveAcesso write FDigitoChaveAcesso;
    [MVCColumnAttribute('AMBIENTE')]
		[MVCNameAsAttribute('ambiente')]
		property Ambiente: string read FAmbiente write FAmbiente;
    [MVCColumnAttribute('FINALIDADE_EMISSAO')]
		[MVCNameAsAttribute('finalidadeEmissao')]
		property FinalidadeEmissao: string read FFinalidadeEmissao write FFinalidadeEmissao;
    [MVCColumnAttribute('CONSUMIDOR_OPERACAO')]
		[MVCNameAsAttribute('consumidorOperacao')]
		property ConsumidorOperacao: string read FConsumidorOperacao write FConsumidorOperacao;
    [MVCColumnAttribute('CONSUMIDOR_PRESENCA')]
		[MVCNameAsAttribute('consumidorPresenca')]
		property ConsumidorPresenca: string read FConsumidorPresenca write FConsumidorPresenca;
    [MVCColumnAttribute('PROCESSO_EMISSAO')]
		[MVCNameAsAttribute('processoEmissao')]
		property ProcessoEmissao: string read FProcessoEmissao write FProcessoEmissao;
    [MVCColumnAttribute('VERSAO_PROCESSO_EMISSAO')]
		[MVCNameAsAttribute('versaoProcessoEmissao')]
		property VersaoProcessoEmissao: string read FVersaoProcessoEmissao write FVersaoProcessoEmissao;
    [MVCColumnAttribute('DATA_ENTRADA_CONTINGENCIA')]
		[MVCNameAsAttribute('dataEntradaContingencia')]
		property DataEntradaContingencia: TDateTime read FDataEntradaContingencia write FDataEntradaContingencia;
    [MVCColumnAttribute('JUSTIFICATIVA_CONTINGENCIA')]
		[MVCNameAsAttribute('justificativaContingencia')]
		property JustificativaContingencia: string read FJustificativaContingencia write FJustificativaContingencia;
    [MVCColumnAttribute('BASE_CALCULO_ICMS')]
		[MVCNameAsAttribute('baseCalculoIcms')]
		property BaseCalculoIcms: Extended read FBaseCalculoIcms write FBaseCalculoIcms;
    [MVCColumnAttribute('VALOR_ICMS')]
		[MVCNameAsAttribute('valorIcms')]
		property ValorIcms: Extended read FValorIcms write FValorIcms;
    [MVCColumnAttribute('VALOR_ICMS_DESONERADO')]
		[MVCNameAsAttribute('valorIcmsDesonerado')]
		property ValorIcmsDesonerado: Extended read FValorIcmsDesonerado write FValorIcmsDesonerado;
    [MVCColumnAttribute('TOTAL_ICMS_FCP_UF_DESTINO')]
		[MVCNameAsAttribute('totalIcmsFcpUfDestino')]
		property TotalIcmsFcpUfDestino: Extended read FTotalIcmsFcpUfDestino write FTotalIcmsFcpUfDestino;
    [MVCColumnAttribute('TOTAL_ICMS_INTERESTADUAL_UF_DESTINO')]
		[MVCNameAsAttribute('totalIcmsInterestadualUfDestino')]
		property TotalIcmsInterestadualUfDestino: Extended read FTotalIcmsInterestadualUfDestino write FTotalIcmsInterestadualUfDestino;
    [MVCColumnAttribute('TOTAL_ICMS_INTERESTADUAL_UF_REMETENTE')]
		[MVCNameAsAttribute('totalIcmsInterestadualUfRemetente')]
		property TotalIcmsInterestadualUfRemetente: Extended read FTotalIcmsInterestadualUfRemetente write FTotalIcmsInterestadualUfRemetente;
    [MVCColumnAttribute('VALOR_TOTAL_FCP')]
		[MVCNameAsAttribute('valorTotalFcp')]
		property ValorTotalFcp: Extended read FValorTotalFcp write FValorTotalFcp;
    [MVCColumnAttribute('BASE_CALCULO_ICMS_ST')]
		[MVCNameAsAttribute('baseCalculoIcmsSt')]
		property BaseCalculoIcmsSt: Extended read FBaseCalculoIcmsSt write FBaseCalculoIcmsSt;
    [MVCColumnAttribute('VALOR_ICMS_ST')]
		[MVCNameAsAttribute('valorIcmsSt')]
		property ValorIcmsSt: Extended read FValorIcmsSt write FValorIcmsSt;
    [MVCColumnAttribute('VALOR_TOTAL_FCP_ST')]
		[MVCNameAsAttribute('valorTotalFcpSt')]
		property ValorTotalFcpSt: Extended read FValorTotalFcpSt write FValorTotalFcpSt;
    [MVCColumnAttribute('VALOR_TOTAL_FCP_ST_RETIDO')]
		[MVCNameAsAttribute('valorTotalFcpStRetido')]
		property ValorTotalFcpStRetido: Extended read FValorTotalFcpStRetido write FValorTotalFcpStRetido;
    [MVCColumnAttribute('VALOR_TOTAL_PRODUTOS')]
		[MVCNameAsAttribute('valorTotalProdutos')]
		property ValorTotalProdutos: Extended read FValorTotalProdutos write FValorTotalProdutos;
    [MVCColumnAttribute('VALOR_FRETE')]
		[MVCNameAsAttribute('valorFrete')]
		property ValorFrete: Extended read FValorFrete write FValorFrete;
    [MVCColumnAttribute('VALOR_SEGURO')]
		[MVCNameAsAttribute('valorSeguro')]
		property ValorSeguro: Extended read FValorSeguro write FValorSeguro;
    [MVCColumnAttribute('VALOR_DESCONTO')]
		[MVCNameAsAttribute('valorDesconto')]
		property ValorDesconto: Extended read FValorDesconto write FValorDesconto;
    [MVCColumnAttribute('VALOR_IMPOSTO_IMPORTACAO')]
		[MVCNameAsAttribute('valorImpostoImportacao')]
		property ValorImpostoImportacao: Extended read FValorImpostoImportacao write FValorImpostoImportacao;
    [MVCColumnAttribute('VALOR_IPI')]
		[MVCNameAsAttribute('valorIpi')]
		property ValorIpi: Extended read FValorIpi write FValorIpi;
    [MVCColumnAttribute('VALOR_IPI_DEVOLVIDO')]
		[MVCNameAsAttribute('valorIpiDevolvido')]
		property ValorIpiDevolvido: Extended read FValorIpiDevolvido write FValorIpiDevolvido;
    [MVCColumnAttribute('VALOR_PIS')]
		[MVCNameAsAttribute('valorPis')]
		property ValorPis: Extended read FValorPis write FValorPis;
    [MVCColumnAttribute('VALOR_COFINS')]
		[MVCNameAsAttribute('valorCofins')]
		property ValorCofins: Extended read FValorCofins write FValorCofins;
    [MVCColumnAttribute('VALOR_DESPESAS_ACESSORIAS')]
		[MVCNameAsAttribute('valorDespesasAcessorias')]
		property ValorDespesasAcessorias: Extended read FValorDespesasAcessorias write FValorDespesasAcessorias;
    [MVCColumnAttribute('VALOR_TOTAL')]
		[MVCNameAsAttribute('valorTotal')]
		property ValorTotal: Extended read FValorTotal write FValorTotal;
    [MVCColumnAttribute('VALOR_TOTAL_TRIBUTOS')]
		[MVCNameAsAttribute('valorTotalTributos')]
		property ValorTotalTributos: Extended read FValorTotalTributos write FValorTotalTributos;
    [MVCColumnAttribute('VALOR_SERVICOS')]
		[MVCNameAsAttribute('valorServicos')]
		property ValorServicos: Extended read FValorServicos write FValorServicos;
    [MVCColumnAttribute('BASE_CALCULO_ISSQN')]
		[MVCNameAsAttribute('baseCalculoIssqn')]
		property BaseCalculoIssqn: Extended read FBaseCalculoIssqn write FBaseCalculoIssqn;
    [MVCColumnAttribute('VALOR_ISSQN')]
		[MVCNameAsAttribute('valorIssqn')]
		property ValorIssqn: Extended read FValorIssqn write FValorIssqn;
    [MVCColumnAttribute('VALOR_PIS_ISSQN')]
		[MVCNameAsAttribute('valorPisIssqn')]
		property ValorPisIssqn: Extended read FValorPisIssqn write FValorPisIssqn;
    [MVCColumnAttribute('VALOR_COFINS_ISSQN')]
		[MVCNameAsAttribute('valorCofinsIssqn')]
		property ValorCofinsIssqn: Extended read FValorCofinsIssqn write FValorCofinsIssqn;
    [MVCColumnAttribute('DATA_PRESTACAO_SERVICO')]
		[MVCNameAsAttribute('dataPrestacaoServico')]
		property DataPrestacaoServico: TDateTime read FDataPrestacaoServico write FDataPrestacaoServico;
    [MVCColumnAttribute('VALOR_DEDUCAO_ISSQN')]
		[MVCNameAsAttribute('valorDeducaoIssqn')]
		property ValorDeducaoIssqn: Extended read FValorDeducaoIssqn write FValorDeducaoIssqn;
    [MVCColumnAttribute('OUTRAS_RETENCOES_ISSQN')]
		[MVCNameAsAttribute('outrasRetencoesIssqn')]
		property OutrasRetencoesIssqn: Extended read FOutrasRetencoesIssqn write FOutrasRetencoesIssqn;
    [MVCColumnAttribute('DESCONTO_INCONDICIONADO_ISSQN')]
		[MVCNameAsAttribute('descontoIncondicionadoIssqn')]
		property DescontoIncondicionadoIssqn: Extended read FDescontoIncondicionadoIssqn write FDescontoIncondicionadoIssqn;
    [MVCColumnAttribute('DESCONTO_CONDICIONADO_ISSQN')]
		[MVCNameAsAttribute('descontoCondicionadoIssqn')]
		property DescontoCondicionadoIssqn: Extended read FDescontoCondicionadoIssqn write FDescontoCondicionadoIssqn;
    [MVCColumnAttribute('TOTAL_RETENCAO_ISSQN')]
		[MVCNameAsAttribute('totalRetencaoIssqn')]
		property TotalRetencaoIssqn: Extended read FTotalRetencaoIssqn write FTotalRetencaoIssqn;
    [MVCColumnAttribute('REGIME_ESPECIAL_TRIBUTACAO')]
		[MVCNameAsAttribute('regimeEspecialTributacao')]
		property RegimeEspecialTributacao: string read FRegimeEspecialTributacao write FRegimeEspecialTributacao;
    [MVCColumnAttribute('VALOR_RETIDO_PIS')]
		[MVCNameAsAttribute('valorRetidoPis')]
		property ValorRetidoPis: Extended read FValorRetidoPis write FValorRetidoPis;
    [MVCColumnAttribute('VALOR_RETIDO_COFINS')]
		[MVCNameAsAttribute('valorRetidoCofins')]
		property ValorRetidoCofins: Extended read FValorRetidoCofins write FValorRetidoCofins;
    [MVCColumnAttribute('VALOR_RETIDO_CSLL')]
		[MVCNameAsAttribute('valorRetidoCsll')]
		property ValorRetidoCsll: Extended read FValorRetidoCsll write FValorRetidoCsll;
    [MVCColumnAttribute('BASE_CALCULO_IRRF')]
		[MVCNameAsAttribute('baseCalculoIrrf')]
		property BaseCalculoIrrf: Extended read FBaseCalculoIrrf write FBaseCalculoIrrf;
    [MVCColumnAttribute('VALOR_RETIDO_IRRF')]
		[MVCNameAsAttribute('valorRetidoIrrf')]
		property ValorRetidoIrrf: Extended read FValorRetidoIrrf write FValorRetidoIrrf;
    [MVCColumnAttribute('BASE_CALCULO_PREVIDENCIA')]
		[MVCNameAsAttribute('baseCalculoPrevidencia')]
		property BaseCalculoPrevidencia: Extended read FBaseCalculoPrevidencia write FBaseCalculoPrevidencia;
    [MVCColumnAttribute('VALOR_RETIDO_PREVIDENCIA')]
		[MVCNameAsAttribute('valorRetidoPrevidencia')]
		property ValorRetidoPrevidencia: Extended read FValorRetidoPrevidencia write FValorRetidoPrevidencia;
    [MVCColumnAttribute('INFORMACOES_ADD_FISCO')]
		[MVCNameAsAttribute('informacoesAddFisco')]
		property InformacoesAddFisco: string read FInformacoesAddFisco write FInformacoesAddFisco;
    [MVCColumnAttribute('INFORMACOES_ADD_CONTRIBUINTE')]
		[MVCNameAsAttribute('informacoesAddContribuinte')]
		property InformacoesAddContribuinte: string read FInformacoesAddContribuinte write FInformacoesAddContribuinte;
    [MVCColumnAttribute('COMEX_UF_EMBARQUE')]
		[MVCNameAsAttribute('comexUfEmbarque')]
		property ComexUfEmbarque: string read FComexUfEmbarque write FComexUfEmbarque;
    [MVCColumnAttribute('COMEX_LOCAL_EMBARQUE')]
		[MVCNameAsAttribute('comexLocalEmbarque')]
		property ComexLocalEmbarque: string read FComexLocalEmbarque write FComexLocalEmbarque;
    [MVCColumnAttribute('COMEX_LOCAL_DESPACHO')]
		[MVCNameAsAttribute('comexLocalDespacho')]
		property ComexLocalDespacho: string read FComexLocalDespacho write FComexLocalDespacho;
    [MVCColumnAttribute('COMPRA_NOTA_EMPENHO')]
		[MVCNameAsAttribute('compraNotaEmpenho')]
		property CompraNotaEmpenho: string read FCompraNotaEmpenho write FCompraNotaEmpenho;
    [MVCColumnAttribute('COMPRA_PEDIDO')]
		[MVCNameAsAttribute('compraPedido')]
		property CompraPedido: string read FCompraPedido write FCompraPedido;
    [MVCColumnAttribute('COMPRA_CONTRATO')]
		[MVCNameAsAttribute('compraContrato')]
		property CompraContrato: string read FCompraContrato write FCompraContrato;
    [MVCColumnAttribute('QRCODE')]
		[MVCNameAsAttribute('qrcode')]
		property Qrcode: string read FQrcode write FQrcode;
    [MVCColumnAttribute('URL_CHAVE')]
		[MVCNameAsAttribute('urlChave')]
		property UrlChave: string read FUrlChave write FUrlChave;
    [MVCColumnAttribute('STATUS_NOTA')]
		[MVCNameAsAttribute('statusNota')]
		property StatusNota: string read FStatusNota write FStatusNota;
      
    [MVCNameAsAttribute('nfeCana')]
		property NfeCana: TNfeCana read FNfeCana write FNfeCana;
    [MVCNameAsAttribute('nfeDestinatario')]
		property NfeDestinatario: TNfeDestinatario read FNfeDestinatario write FNfeDestinatario;
    [MVCNameAsAttribute('nfeEmitente')]
		property NfeEmitente: TNfeEmitente read FNfeEmitente write FNfeEmitente;
    [MVCNameAsAttribute('nfeFatura')]
		property NfeFatura: TNfeFatura read FNfeFatura write FNfeFatura;
    [MVCNameAsAttribute('nfeInformacaoPagamento')]
		property NfeInformacaoPagamento: TNfeInformacaoPagamento read FNfeInformacaoPagamento write FNfeInformacaoPagamento;
    [MVCNameAsAttribute('nfeLocalEntrega')]
		property NfeLocalEntrega: TNfeLocalEntrega read FNfeLocalEntrega write FNfeLocalEntrega;
    [MVCNameAsAttribute('nfeLocalRetirada')]
		property NfeLocalRetirada: TNfeLocalRetirada read FNfeLocalRetirada write FNfeLocalRetirada;
    [MVCNameAsAttribute('nfeResponsavelTecnico')]
		property NfeResponsavelTecnico: TNfeResponsavelTecnico read FNfeResponsavelTecnico write FNfeResponsavelTecnico;
    [MVCNameAsAttribute('nfeTransporte')]
		property NfeTransporte: TNfeTransporte read FNfeTransporte write FNfeTransporte;
    [MVCNameAsAttribute('vendedor')]
		property Vendedor: TVendedor read FVendedor write FVendedor;
    [MVCNameAsAttribute('fornecedor')]
		property Fornecedor: TFornecedor read FFornecedor write FFornecedor;
    [MVCNameAsAttribute('cliente')]
		property Cliente: TCliente read FCliente write FCliente;
    [MVCNameAsAttribute('tributOperacaoFiscal')]
		property TributOperacaoFiscal: TTributOperacaoFiscal read FTributOperacaoFiscal write FTributOperacaoFiscal;
    [MVCNameAsAttribute('vendaCabecalho')]
		property VendaCabecalho: TVendaCabecalho read FVendaCabecalho write FVendaCabecalho;
    [MapperListOf(TNfeAcessoXml)]
	[MVCNameAsAttribute('listaNfeAcessoXml')]
	property ListaNfeAcessoXml: TObjectList<TNfeAcessoXml> read FListaNfeAcessoXml write FListaNfeAcessoXml;
    [MapperListOf(TNfeCteReferenciado)]
	[MVCNameAsAttribute('listaNfeCteReferenciado')]
	property ListaNfeCteReferenciado: TObjectList<TNfeCteReferenciado> read FListaNfeCteReferenciado write FListaNfeCteReferenciado;
    [MapperListOf(TNfeCupomFiscalReferenciado)]
	[MVCNameAsAttribute('listaNfeCupomFiscalReferenciado')]
	property ListaNfeCupomFiscalReferenciado: TObjectList<TNfeCupomFiscalReferenciado> read FListaNfeCupomFiscalReferenciado write FListaNfeCupomFiscalReferenciado;
    [MapperListOf(TNfeDetalhe)]
	[MVCNameAsAttribute('listaNfeDetalhe')]
	property ListaNfeDetalhe: TObjectList<TNfeDetalhe> read FListaNfeDetalhe write FListaNfeDetalhe;
    [MapperListOf(TNfeNfReferenciada)]
	[MVCNameAsAttribute('listaNfeNfReferenciada')]
	property ListaNfeNfReferenciada: TObjectList<TNfeNfReferenciada> read FListaNfeNfReferenciada write FListaNfeNfReferenciada;
    [MapperListOf(TNfeProcessoReferenciado)]
	[MVCNameAsAttribute('listaNfeProcessoReferenciado')]
	property ListaNfeProcessoReferenciado: TObjectList<TNfeProcessoReferenciado> read FListaNfeProcessoReferenciado write FListaNfeProcessoReferenciado;
    [MapperListOf(TNfeProdRuralReferenciada)]
	[MVCNameAsAttribute('listaNfeProdRuralReferenciada')]
	property ListaNfeProdRuralReferenciada: TObjectList<TNfeProdRuralReferenciada> read FListaNfeProdRuralReferenciada write FListaNfeProdRuralReferenciada;
    [MapperListOf(TNfeReferenciada)]
	[MVCNameAsAttribute('listaNfeReferenciada')]
	property ListaNfeReferenciada: TObjectList<TNfeReferenciada> read FListaNfeReferenciada write FListaNfeReferenciada;
  end;

implementation

{ TNfeCabecalho }

constructor TNfeCabecalho.Create;
begin
  inherited;

  FListaNfeAcessoXml := TObjectList<TNfeAcessoXml>.Create;
  FNfeCana := TNfeCana.Create;
  FListaNfeCteReferenciado := TObjectList<TNfeCteReferenciado>.Create;
  FListaNfeCupomFiscalReferenciado := TObjectList<TNfeCupomFiscalReferenciado>.Create;
  FNfeDestinatario := TNfeDestinatario.Create;
  FListaNfeDetalhe := TObjectList<TNfeDetalhe>.Create;
  FNfeEmitente := TNfeEmitente.Create;
  FNfeFatura := TNfeFatura.Create;
  FNfeInformacaoPagamento := TNfeInformacaoPagamento.Create;
  FNfeLocalEntrega := TNfeLocalEntrega.Create;
  FNfeLocalRetirada := TNfeLocalRetirada.Create;
  FListaNfeNfReferenciada := TObjectList<TNfeNfReferenciada>.Create;
  FListaNfeProcessoReferenciado := TObjectList<TNfeProcessoReferenciado>.Create;
  FListaNfeProdRuralReferenciada := TObjectList<TNfeProdRuralReferenciada>.Create;
  FListaNfeReferenciada := TObjectList<TNfeReferenciada>.Create;
  FNfeResponsavelTecnico := TNfeResponsavelTecnico.Create;
  FNfeTransporte := TNfeTransporte.Create;
  FVendedor := TVendedor.Create;
  FFornecedor := TFornecedor.Create;
  FCliente := TCliente.Create;
  FTributOperacaoFiscal := TTributOperacaoFiscal.Create;
  FVendaCabecalho := TVendaCabecalho.Create;
end;

destructor TNfeCabecalho.Destroy;
begin
  FreeAndNil(FListaNfeAcessoXml);
  FreeAndNil(FNfeCana);
  FreeAndNil(FListaNfeCteReferenciado);
  FreeAndNil(FListaNfeCupomFiscalReferenciado);
  FreeAndNil(FNfeDestinatario);
  FreeAndNil(FListaNfeDetalhe);
  FreeAndNil(FNfeEmitente);
  FreeAndNil(FNfeFatura);
  FreeAndNil(FNfeInformacaoPagamento);
  FreeAndNil(FNfeLocalEntrega);
  FreeAndNil(FNfeLocalRetirada);
  FreeAndNil(FListaNfeNfReferenciada);
  FreeAndNil(FListaNfeProcessoReferenciado);
  FreeAndNil(FListaNfeProdRuralReferenciada);
  FreeAndNil(FListaNfeReferenciada);
  FreeAndNil(FNfeResponsavelTecnico);
  FreeAndNil(FNfeTransporte);
  FreeAndNil(FVendedor);
  FreeAndNil(FFornecedor);
  FreeAndNil(FCliente);
  FreeAndNil(FTributOperacaoFiscal);
  FreeAndNil(FVendaCabecalho);
  inherited;
end;



end.