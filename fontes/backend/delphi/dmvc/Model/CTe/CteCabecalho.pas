{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_CABECALHO] 
                                                                                
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
unit CteCabecalho;

interface

uses
  Generics.Collections, System.SysUtils,
  CteCarga, CteDestinatario, CteLocalEntrega, CteRemetente, CteRodoviario, CteTomador, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TCteCabecalho = class(TModelBase)
  private
    FId: Integer;
    FUfEmitente: Integer;
    FCodigoNumerico: string;
    FCfop: Integer;
    FNaturezaOperacao: string;
    FFormaPagamento: string;
    FModelo: string;
    FSerie: string;
    FNumero: string;
    FDataHoraEmissao: TDateTime;
    FFormatoImpressaoDacte: string;
    FTipoEmissao: string;
    FChaveAcesso: string;
    FDigitoChaveAcesso: string;
    FAmbiente: string;
    FTipoCte: string;
    FProcessoEmissao: string;
    FVersaoProcessoEmissao: string;
    FChaveReferenciado: string;
    FCodigoMunicipioEnvio: Integer;
    FNomeMunicipioEnvio: string;
    FUfEnvio: string;
    FModal: string;
    FTipoServico: string;
    FCodigoMunicipioIniPrestacao: Integer;
    FNomeMunicipioIniPrestacao: string;
    FUfIniPrestacao: string;
    FCodigoMunicipioFimPrestacao: Integer;
    FNomeMunicipioFimPrestacao: string;
    FUfFimPrestacao: string;
    FRetira: string;
    FRetiraDetalhe: string;
    FTomador: string;
    FDataEntradaContingencia: TDateTime;
    FJustificativaContingencia: string;
    FCaracAdicionalTransporte: string;
    FCaracAdicionalServico: string;
    FFuncionarioEmissor: string;
    FFluxoOrigem: string;
    FEntregaTipoPeriodo: string;
    FEntregaDataProgramada: TDateTime;
    FEntregaDataInicial: TDateTime;
    FEntregaDataFinal: TDateTime;
    FEntregaTipoHora: string;
    FEntregaHoraProgramada: string;
    FEntregaHoraInicial: string;
    FEntregaHoraFinal: string;
    FMunicipioOrigemCalculo: string;
    FMunicipioDestinoCalculo: string;
    FObservacoesGerais: string;
    FValorTotalServico: Extended;
    FValorReceber: Extended;
    FCst: string;
    FBaseCalculoIcms: Extended;
    FAliquotaIcms: Extended;
    FValorIcms: Extended;
    FPercentualReducaoBcIcms: Extended;
    FValorBcIcmsStRetido: Extended;
    FValorIcmsStRetido: Extended;
    FAliquotaIcmsStRetido: Extended;
    FValorCreditoPresumidoIcms: Extended;
    FPercentualBcIcmsOutraUf: Extended;
    FValorBcIcmsOutraUf: Extended;
    FAliquotaIcmsOutraUf: Extended;
    FValorIcmsOutraUf: Extended;
    FSimplesNacionalIndicador: string;
    FSimplesNacionalTotal: Extended;
    FInformacoesAddFisco: string;
    FValorTotalCarga: Extended;
    FProdutoPredominante: string;
    FCargaOutrasCaracteristicas: string;
    FModalVersaoLayout: Integer;
    FChaveCteSubstituido: string;
      
    FCteDestinatario: TCteDestinatario;
    FCteLocalEntrega: TCteLocalEntrega;
    FCteRemetente: TCteRemetente;
    FCteRodoviario: TCteRodoviario;
    FCteTomador: TCteTomador;
    FListaCteCarga: TObjectList<TCteCarga>;
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('UF_EMITENTE')]
		[MVCNameAsAttribute('ufEmitente')]
		property UfEmitente: Integer read FUfEmitente write FUfEmitente;
    [MVCColumnAttribute('CODIGO_NUMERICO')]
		[MVCNameAsAttribute('codigoNumerico')]
		property CodigoNumerico: string read FCodigoNumerico write FCodigoNumerico;
    [MVCColumnAttribute('CFOP')]
		[MVCNameAsAttribute('cfop')]
		property Cfop: Integer read FCfop write FCfop;
    [MVCColumnAttribute('NATUREZA_OPERACAO')]
		[MVCNameAsAttribute('naturezaOperacao')]
		property NaturezaOperacao: string read FNaturezaOperacao write FNaturezaOperacao;
    [MVCColumnAttribute('FORMA_PAGAMENTO')]
		[MVCNameAsAttribute('formaPagamento')]
		property FormaPagamento: string read FFormaPagamento write FFormaPagamento;
    [MVCColumnAttribute('MODELO')]
		[MVCNameAsAttribute('modelo')]
		property Modelo: string read FModelo write FModelo;
    [MVCColumnAttribute('SERIE')]
		[MVCNameAsAttribute('serie')]
		property Serie: string read FSerie write FSerie;
    [MVCColumnAttribute('NUMERO')]
		[MVCNameAsAttribute('numero')]
		property Numero: string read FNumero write FNumero;
    [MVCColumnAttribute('DATA_HORA_EMISSAO')]
		[MVCNameAsAttribute('dataHoraEmissao')]
		property DataHoraEmissao: TDateTime read FDataHoraEmissao write FDataHoraEmissao;
    [MVCColumnAttribute('FORMATO_IMPRESSAO_DACTE')]
		[MVCNameAsAttribute('formatoImpressaoDacte')]
		property FormatoImpressaoDacte: string read FFormatoImpressaoDacte write FFormatoImpressaoDacte;
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
    [MVCColumnAttribute('TIPO_CTE')]
		[MVCNameAsAttribute('tipoCte')]
		property TipoCte: string read FTipoCte write FTipoCte;
    [MVCColumnAttribute('PROCESSO_EMISSAO')]
		[MVCNameAsAttribute('processoEmissao')]
		property ProcessoEmissao: string read FProcessoEmissao write FProcessoEmissao;
    [MVCColumnAttribute('VERSAO_PROCESSO_EMISSAO')]
		[MVCNameAsAttribute('versaoProcessoEmissao')]
		property VersaoProcessoEmissao: string read FVersaoProcessoEmissao write FVersaoProcessoEmissao;
    [MVCColumnAttribute('CHAVE_REFERENCIADO')]
		[MVCNameAsAttribute('chaveReferenciado')]
		property ChaveReferenciado: string read FChaveReferenciado write FChaveReferenciado;
    [MVCColumnAttribute('CODIGO_MUNICIPIO_ENVIO')]
		[MVCNameAsAttribute('codigoMunicipioEnvio')]
		property CodigoMunicipioEnvio: Integer read FCodigoMunicipioEnvio write FCodigoMunicipioEnvio;
    [MVCColumnAttribute('NOME_MUNICIPIO_ENVIO')]
		[MVCNameAsAttribute('nomeMunicipioEnvio')]
		property NomeMunicipioEnvio: string read FNomeMunicipioEnvio write FNomeMunicipioEnvio;
    [MVCColumnAttribute('UF_ENVIO')]
		[MVCNameAsAttribute('ufEnvio')]
		property UfEnvio: string read FUfEnvio write FUfEnvio;
    [MVCColumnAttribute('MODAL')]
		[MVCNameAsAttribute('modal')]
		property Modal: string read FModal write FModal;
    [MVCColumnAttribute('TIPO_SERVICO')]
		[MVCNameAsAttribute('tipoServico')]
		property TipoServico: string read FTipoServico write FTipoServico;
    [MVCColumnAttribute('CODIGO_MUNICIPIO_INI_PRESTACAO')]
		[MVCNameAsAttribute('codigoMunicipioIniPrestacao')]
		property CodigoMunicipioIniPrestacao: Integer read FCodigoMunicipioIniPrestacao write FCodigoMunicipioIniPrestacao;
    [MVCColumnAttribute('NOME_MUNICIPIO_INI_PRESTACAO')]
		[MVCNameAsAttribute('nomeMunicipioIniPrestacao')]
		property NomeMunicipioIniPrestacao: string read FNomeMunicipioIniPrestacao write FNomeMunicipioIniPrestacao;
    [MVCColumnAttribute('UF_INI_PRESTACAO')]
		[MVCNameAsAttribute('ufIniPrestacao')]
		property UfIniPrestacao: string read FUfIniPrestacao write FUfIniPrestacao;
    [MVCColumnAttribute('CODIGO_MUNICIPIO_FIM_PRESTACAO')]
		[MVCNameAsAttribute('codigoMunicipioFimPrestacao')]
		property CodigoMunicipioFimPrestacao: Integer read FCodigoMunicipioFimPrestacao write FCodigoMunicipioFimPrestacao;
    [MVCColumnAttribute('NOME_MUNICIPIO_FIM_PRESTACAO')]
		[MVCNameAsAttribute('nomeMunicipioFimPrestacao')]
		property NomeMunicipioFimPrestacao: string read FNomeMunicipioFimPrestacao write FNomeMunicipioFimPrestacao;
    [MVCColumnAttribute('UF_FIM_PRESTACAO')]
		[MVCNameAsAttribute('ufFimPrestacao')]
		property UfFimPrestacao: string read FUfFimPrestacao write FUfFimPrestacao;
    [MVCColumnAttribute('RETIRA')]
		[MVCNameAsAttribute('retira')]
		property Retira: string read FRetira write FRetira;
    [MVCColumnAttribute('RETIRA_DETALHE')]
		[MVCNameAsAttribute('retiraDetalhe')]
		property RetiraDetalhe: string read FRetiraDetalhe write FRetiraDetalhe;
    [MVCColumnAttribute('TOMADOR')]
		[MVCNameAsAttribute('tomador')]
		property Tomador: string read FTomador write FTomador;
    [MVCColumnAttribute('DATA_ENTRADA_CONTINGENCIA')]
		[MVCNameAsAttribute('dataEntradaContingencia')]
		property DataEntradaContingencia: TDateTime read FDataEntradaContingencia write FDataEntradaContingencia;
    [MVCColumnAttribute('JUSTIFICATIVA_CONTINGENCIA')]
		[MVCNameAsAttribute('justificativaContingencia')]
		property JustificativaContingencia: string read FJustificativaContingencia write FJustificativaContingencia;
    [MVCColumnAttribute('CARAC_ADICIONAL_TRANSPORTE')]
		[MVCNameAsAttribute('caracAdicionalTransporte')]
		property CaracAdicionalTransporte: string read FCaracAdicionalTransporte write FCaracAdicionalTransporte;
    [MVCColumnAttribute('CARAC_ADICIONAL_SERVICO')]
		[MVCNameAsAttribute('caracAdicionalServico')]
		property CaracAdicionalServico: string read FCaracAdicionalServico write FCaracAdicionalServico;
    [MVCColumnAttribute('FUNCIONARIO_EMISSOR')]
		[MVCNameAsAttribute('funcionarioEmissor')]
		property FuncionarioEmissor: string read FFuncionarioEmissor write FFuncionarioEmissor;
    [MVCColumnAttribute('FLUXO_ORIGEM')]
		[MVCNameAsAttribute('fluxoOrigem')]
		property FluxoOrigem: string read FFluxoOrigem write FFluxoOrigem;
    [MVCColumnAttribute('ENTREGA_TIPO_PERIODO')]
		[MVCNameAsAttribute('entregaTipoPeriodo')]
		property EntregaTipoPeriodo: string read FEntregaTipoPeriodo write FEntregaTipoPeriodo;
    [MVCColumnAttribute('ENTREGA_DATA_PROGRAMADA')]
		[MVCNameAsAttribute('entregaDataProgramada')]
		property EntregaDataProgramada: TDateTime read FEntregaDataProgramada write FEntregaDataProgramada;
    [MVCColumnAttribute('ENTREGA_DATA_INICIAL')]
		[MVCNameAsAttribute('entregaDataInicial')]
		property EntregaDataInicial: TDateTime read FEntregaDataInicial write FEntregaDataInicial;
    [MVCColumnAttribute('ENTREGA_DATA_FINAL')]
		[MVCNameAsAttribute('entregaDataFinal')]
		property EntregaDataFinal: TDateTime read FEntregaDataFinal write FEntregaDataFinal;
    [MVCColumnAttribute('ENTREGA_TIPO_HORA')]
		[MVCNameAsAttribute('entregaTipoHora')]
		property EntregaTipoHora: string read FEntregaTipoHora write FEntregaTipoHora;
    [MVCColumnAttribute('ENTREGA_HORA_PROGRAMADA')]
		[MVCNameAsAttribute('entregaHoraProgramada')]
		property EntregaHoraProgramada: string read FEntregaHoraProgramada write FEntregaHoraProgramada;
    [MVCColumnAttribute('ENTREGA_HORA_INICIAL')]
		[MVCNameAsAttribute('entregaHoraInicial')]
		property EntregaHoraInicial: string read FEntregaHoraInicial write FEntregaHoraInicial;
    [MVCColumnAttribute('ENTREGA_HORA_FINAL')]
		[MVCNameAsAttribute('entregaHoraFinal')]
		property EntregaHoraFinal: string read FEntregaHoraFinal write FEntregaHoraFinal;
    [MVCColumnAttribute('MUNICIPIO_ORIGEM_CALCULO')]
		[MVCNameAsAttribute('municipioOrigemCalculo')]
		property MunicipioOrigemCalculo: string read FMunicipioOrigemCalculo write FMunicipioOrigemCalculo;
    [MVCColumnAttribute('MUNICIPIO_DESTINO_CALCULO')]
		[MVCNameAsAttribute('municipioDestinoCalculo')]
		property MunicipioDestinoCalculo: string read FMunicipioDestinoCalculo write FMunicipioDestinoCalculo;
    [MVCColumnAttribute('OBSERVACOES_GERAIS')]
		[MVCNameAsAttribute('observacoesGerais')]
		property ObservacoesGerais: string read FObservacoesGerais write FObservacoesGerais;
    [MVCColumnAttribute('VALOR_TOTAL_SERVICO')]
		[MVCNameAsAttribute('valorTotalServico')]
		property ValorTotalServico: Extended read FValorTotalServico write FValorTotalServico;
    [MVCColumnAttribute('VALOR_RECEBER')]
		[MVCNameAsAttribute('valorReceber')]
		property ValorReceber: Extended read FValorReceber write FValorReceber;
    [MVCColumnAttribute('CST')]
		[MVCNameAsAttribute('cst')]
		property Cst: string read FCst write FCst;
    [MVCColumnAttribute('BASE_CALCULO_ICMS')]
		[MVCNameAsAttribute('baseCalculoIcms')]
		property BaseCalculoIcms: Extended read FBaseCalculoIcms write FBaseCalculoIcms;
    [MVCColumnAttribute('ALIQUOTA_ICMS')]
		[MVCNameAsAttribute('aliquotaIcms')]
		property AliquotaIcms: Extended read FAliquotaIcms write FAliquotaIcms;
    [MVCColumnAttribute('VALOR_ICMS')]
		[MVCNameAsAttribute('valorIcms')]
		property ValorIcms: Extended read FValorIcms write FValorIcms;
    [MVCColumnAttribute('PERCENTUAL_REDUCAO_BC_ICMS')]
		[MVCNameAsAttribute('percentualReducaoBcIcms')]
		property PercentualReducaoBcIcms: Extended read FPercentualReducaoBcIcms write FPercentualReducaoBcIcms;
    [MVCColumnAttribute('VALOR_BC_ICMS_ST_RETIDO')]
		[MVCNameAsAttribute('valorBcIcmsStRetido')]
		property ValorBcIcmsStRetido: Extended read FValorBcIcmsStRetido write FValorBcIcmsStRetido;
    [MVCColumnAttribute('VALOR_ICMS_ST_RETIDO')]
		[MVCNameAsAttribute('valorIcmsStRetido')]
		property ValorIcmsStRetido: Extended read FValorIcmsStRetido write FValorIcmsStRetido;
    [MVCColumnAttribute('ALIQUOTA_ICMS_ST_RETIDO')]
		[MVCNameAsAttribute('aliquotaIcmsStRetido')]
		property AliquotaIcmsStRetido: Extended read FAliquotaIcmsStRetido write FAliquotaIcmsStRetido;
    [MVCColumnAttribute('VALOR_CREDITO_PRESUMIDO_ICMS')]
		[MVCNameAsAttribute('valorCreditoPresumidoIcms')]
		property ValorCreditoPresumidoIcms: Extended read FValorCreditoPresumidoIcms write FValorCreditoPresumidoIcms;
    [MVCColumnAttribute('PERCENTUAL_BC_ICMS_OUTRA_UF')]
		[MVCNameAsAttribute('percentualBcIcmsOutraUf')]
		property PercentualBcIcmsOutraUf: Extended read FPercentualBcIcmsOutraUf write FPercentualBcIcmsOutraUf;
    [MVCColumnAttribute('VALOR_BC_ICMS_OUTRA_UF')]
		[MVCNameAsAttribute('valorBcIcmsOutraUf')]
		property ValorBcIcmsOutraUf: Extended read FValorBcIcmsOutraUf write FValorBcIcmsOutraUf;
    [MVCColumnAttribute('ALIQUOTA_ICMS_OUTRA_UF')]
		[MVCNameAsAttribute('aliquotaIcmsOutraUf')]
		property AliquotaIcmsOutraUf: Extended read FAliquotaIcmsOutraUf write FAliquotaIcmsOutraUf;
    [MVCColumnAttribute('VALOR_ICMS_OUTRA_UF')]
		[MVCNameAsAttribute('valorIcmsOutraUf')]
		property ValorIcmsOutraUf: Extended read FValorIcmsOutraUf write FValorIcmsOutraUf;
    [MVCColumnAttribute('SIMPLES_NACIONAL_INDICADOR')]
		[MVCNameAsAttribute('simplesNacionalIndicador')]
		property SimplesNacionalIndicador: string read FSimplesNacionalIndicador write FSimplesNacionalIndicador;
    [MVCColumnAttribute('SIMPLES_NACIONAL_TOTAL')]
		[MVCNameAsAttribute('simplesNacionalTotal')]
		property SimplesNacionalTotal: Extended read FSimplesNacionalTotal write FSimplesNacionalTotal;
    [MVCColumnAttribute('INFORMACOES_ADD_FISCO')]
		[MVCNameAsAttribute('informacoesAddFisco')]
		property InformacoesAddFisco: string read FInformacoesAddFisco write FInformacoesAddFisco;
    [MVCColumnAttribute('VALOR_TOTAL_CARGA')]
		[MVCNameAsAttribute('valorTotalCarga')]
		property ValorTotalCarga: Extended read FValorTotalCarga write FValorTotalCarga;
    [MVCColumnAttribute('PRODUTO_PREDOMINANTE')]
		[MVCNameAsAttribute('produtoPredominante')]
		property ProdutoPredominante: string read FProdutoPredominante write FProdutoPredominante;
    [MVCColumnAttribute('CARGA_OUTRAS_CARACTERISTICAS')]
		[MVCNameAsAttribute('cargaOutrasCaracteristicas')]
		property CargaOutrasCaracteristicas: string read FCargaOutrasCaracteristicas write FCargaOutrasCaracteristicas;
    [MVCColumnAttribute('MODAL_VERSAO_LAYOUT')]
		[MVCNameAsAttribute('modalVersaoLayout')]
		property ModalVersaoLayout: Integer read FModalVersaoLayout write FModalVersaoLayout;
    [MVCColumnAttribute('CHAVE_CTE_SUBSTITUIDO')]
		[MVCNameAsAttribute('chaveCteSubstituido')]
		property ChaveCteSubstituido: string read FChaveCteSubstituido write FChaveCteSubstituido;
      
    [MVCNameAsAttribute('cteDestinatario')]
		property CteDestinatario: TCteDestinatario read FCteDestinatario write FCteDestinatario;
    [MVCNameAsAttribute('cteLocalEntrega')]
		property CteLocalEntrega: TCteLocalEntrega read FCteLocalEntrega write FCteLocalEntrega;
    [MVCNameAsAttribute('cteRemetente')]
		property CteRemetente: TCteRemetente read FCteRemetente write FCteRemetente;
    [MVCNameAsAttribute('cteRodoviario')]
		property CteRodoviario: TCteRodoviario read FCteRodoviario write FCteRodoviario;
    [MVCNameAsAttribute('cteTomador')]
		property CteTomador: TCteTomador read FCteTomador write FCteTomador;
    [MapperListOf(TCteCarga)]
		[MVCNameAsAttribute('listaCteCarga')]
		property ListaCteCarga: TObjectList<TCteCarga> read FListaCteCarga write FListaCteCarga;
  end;

implementation

{ TCteCabecalho }

constructor TCteCabecalho.Create;
begin
  inherited;
  FListaCteCarga := TObjectList<TCteCarga>.Create;
  FCteDestinatario := TCteDestinatario.Create;
  FCteLocalEntrega := TCteLocalEntrega.Create;
  FCteRemetente := TCteRemetente.Create;
  FCteRodoviario := TCteRodoviario.Create;
  FCteTomador := TCteTomador.Create;
end;

destructor TCteCabecalho.Destroy;
begin
  FreeAndNil(FListaCteCarga);
  FreeAndNil(FCteDestinatario);
  FreeAndNil(FCteLocalEntrega);
  FreeAndNil(FCteRemetente);
  FreeAndNil(FCteRodoviario);
  FreeAndNil(FCteTomador);
  inherited;
end;

end.