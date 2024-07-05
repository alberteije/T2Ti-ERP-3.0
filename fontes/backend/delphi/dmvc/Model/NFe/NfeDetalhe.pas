{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE] 
                                                                                
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
unit NfeDetalhe;

interface

uses
  Generics.Collections, System.SysUtils,
  NfeDeclaracaoImportacao, NfeDetEspecificoArmamento, NfeDetEspecificoCombustivel, NfeDetEspecificoMedicamento, NfeDetEspecificoVeiculo, NfeDetalheImpostoCofins, NfeDetalheImpostoCofinsSt, NfeDetalheImpostoIcms, NfeDetalheImpostoIcmsUfdest, NfeDetalheImpostoIi, NfeDetalheImpostoIpi, NfeDetalheImpostoIssqn, NfeDetalheImpostoPis, NfeDetalheImpostoPisSt, NfeExportacao, NfeItemRastreado, Produto, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeDetalhe = class(TModelBase)
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
      
    FNfeDetEspecificoCombustivel: TNfeDetEspecificoCombustivel;
    FNfeDetEspecificoMedicamento: TNfeDetEspecificoMedicamento;
    FNfeDetEspecificoVeiculo: TNfeDetEspecificoVeiculo;
    FNfeDetalheImpostoCofins: TNfeDetalheImpostoCofins;
    FNfeDetalheImpostoCofinsSt: TNfeDetalheImpostoCofinsSt;
    FNfeDetalheImpostoIcms: TNfeDetalheImpostoIcms;
    FNfeDetalheImpostoIcmsUfdest: TNfeDetalheImpostoIcmsUfdest;
    FNfeDetalheImpostoIi: TNfeDetalheImpostoIi;
    FNfeDetalheImpostoIpi: TNfeDetalheImpostoIpi;
    FNfeDetalheImpostoIssqn: TNfeDetalheImpostoIssqn;
    FNfeDetalheImpostoPis: TNfeDetalheImpostoPis;
    FNfeDetalheImpostoPisSt: TNfeDetalheImpostoPisSt;
    FProduto: TProduto;
    FListaNfeDeclaracaoImportacao: TObjectList<TNfeDeclaracaoImportacao>;
    FListaNfeDetEspecificoArmamento: TObjectList<TNfeDetEspecificoArmamento>;
    FListaNfeExportacao: TObjectList<TNfeExportacao>;
    FListaNfeItemRastreado: TObjectList<TNfeItemRastreado>;
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
      
    [MVCNameAsAttribute('nfeDetEspecificoCombustivel')]
		property NfeDetEspecificoCombustivel: TNfeDetEspecificoCombustivel read FNfeDetEspecificoCombustivel write FNfeDetEspecificoCombustivel;
    [MVCNameAsAttribute('nfeDetEspecificoMedicamento')]
		property NfeDetEspecificoMedicamento: TNfeDetEspecificoMedicamento read FNfeDetEspecificoMedicamento write FNfeDetEspecificoMedicamento;
    [MVCNameAsAttribute('nfeDetEspecificoVeiculo')]
		property NfeDetEspecificoVeiculo: TNfeDetEspecificoVeiculo read FNfeDetEspecificoVeiculo write FNfeDetEspecificoVeiculo;
    [MVCNameAsAttribute('nfeDetalheImpostoCofins')]
		property NfeDetalheImpostoCofins: TNfeDetalheImpostoCofins read FNfeDetalheImpostoCofins write FNfeDetalheImpostoCofins;
    [MVCNameAsAttribute('nfeDetalheImpostoCofinsSt')]
		property NfeDetalheImpostoCofinsSt: TNfeDetalheImpostoCofinsSt read FNfeDetalheImpostoCofinsSt write FNfeDetalheImpostoCofinsSt;
    [MVCNameAsAttribute('nfeDetalheImpostoIcms')]
		property NfeDetalheImpostoIcms: TNfeDetalheImpostoIcms read FNfeDetalheImpostoIcms write FNfeDetalheImpostoIcms;
    [MVCNameAsAttribute('nfeDetalheImpostoIcmsUfdest')]
		property NfeDetalheImpostoIcmsUfdest: TNfeDetalheImpostoIcmsUfdest read FNfeDetalheImpostoIcmsUfdest write FNfeDetalheImpostoIcmsUfdest;
    [MVCNameAsAttribute('nfeDetalheImpostoIi')]
		property NfeDetalheImpostoIi: TNfeDetalheImpostoIi read FNfeDetalheImpostoIi write FNfeDetalheImpostoIi;
    [MVCNameAsAttribute('nfeDetalheImpostoIpi')]
		property NfeDetalheImpostoIpi: TNfeDetalheImpostoIpi read FNfeDetalheImpostoIpi write FNfeDetalheImpostoIpi;
    [MVCNameAsAttribute('nfeDetalheImpostoIssqn')]
		property NfeDetalheImpostoIssqn: TNfeDetalheImpostoIssqn read FNfeDetalheImpostoIssqn write FNfeDetalheImpostoIssqn;
    [MVCNameAsAttribute('nfeDetalheImpostoPis')]
		property NfeDetalheImpostoPis: TNfeDetalheImpostoPis read FNfeDetalheImpostoPis write FNfeDetalheImpostoPis;
    [MVCNameAsAttribute('nfeDetalheImpostoPisSt')]
		property NfeDetalheImpostoPisSt: TNfeDetalheImpostoPisSt read FNfeDetalheImpostoPisSt write FNfeDetalheImpostoPisSt;
    [MVCNameAsAttribute('produto')]
		property Produto: TProduto read FProduto write FProduto;
    [MapperListOf(TNfeDeclaracaoImportacao)]
	[MVCNameAsAttribute('listaNfeDeclaracaoImportacao')]
	property ListaNfeDeclaracaoImportacao: TObjectList<TNfeDeclaracaoImportacao> read FListaNfeDeclaracaoImportacao write FListaNfeDeclaracaoImportacao;
    [MapperListOf(TNfeDetEspecificoArmamento)]
	[MVCNameAsAttribute('listaNfeDetEspecificoArmamento')]
	property ListaNfeDetEspecificoArmamento: TObjectList<TNfeDetEspecificoArmamento> read FListaNfeDetEspecificoArmamento write FListaNfeDetEspecificoArmamento;
    [MapperListOf(TNfeExportacao)]
	[MVCNameAsAttribute('listaNfeExportacao')]
	property ListaNfeExportacao: TObjectList<TNfeExportacao> read FListaNfeExportacao write FListaNfeExportacao;
    [MapperListOf(TNfeItemRastreado)]
	[MVCNameAsAttribute('listaNfeItemRastreado')]
	property ListaNfeItemRastreado: TObjectList<TNfeItemRastreado> read FListaNfeItemRastreado write FListaNfeItemRastreado;
  end;

implementation

{ TNfeDetalhe }

constructor TNfeDetalhe.Create;
begin
  inherited;

  FListaNfeDeclaracaoImportacao := TObjectList<TNfeDeclaracaoImportacao>.Create;
  FListaNfeDetEspecificoArmamento := TObjectList<TNfeDetEspecificoArmamento>.Create;
  FNfeDetEspecificoCombustivel := TNfeDetEspecificoCombustivel.Create;
  FNfeDetEspecificoMedicamento := TNfeDetEspecificoMedicamento.Create;
  FNfeDetEspecificoVeiculo := TNfeDetEspecificoVeiculo.Create;
  FNfeDetalheImpostoCofins := TNfeDetalheImpostoCofins.Create;
  FNfeDetalheImpostoCofinsSt := TNfeDetalheImpostoCofinsSt.Create;
  FNfeDetalheImpostoIcms := TNfeDetalheImpostoIcms.Create;
  FNfeDetalheImpostoIcmsUfdest := TNfeDetalheImpostoIcmsUfdest.Create;
  FNfeDetalheImpostoIi := TNfeDetalheImpostoIi.Create;
  FNfeDetalheImpostoIpi := TNfeDetalheImpostoIpi.Create;
  FNfeDetalheImpostoIssqn := TNfeDetalheImpostoIssqn.Create;
  FNfeDetalheImpostoPis := TNfeDetalheImpostoPis.Create;
  FNfeDetalheImpostoPisSt := TNfeDetalheImpostoPisSt.Create;
  FListaNfeExportacao := TObjectList<TNfeExportacao>.Create;
  FListaNfeItemRastreado := TObjectList<TNfeItemRastreado>.Create;
  FProduto := TProduto.Create;
end;

destructor TNfeDetalhe.Destroy;
begin
  FreeAndNil(FListaNfeDeclaracaoImportacao);
  FreeAndNil(FListaNfeDetEspecificoArmamento);
  FreeAndNil(FNfeDetEspecificoCombustivel);
  FreeAndNil(FNfeDetEspecificoMedicamento);
  FreeAndNil(FNfeDetEspecificoVeiculo);
  FreeAndNil(FNfeDetalheImpostoCofins);
  FreeAndNil(FNfeDetalheImpostoCofinsSt);
  FreeAndNil(FNfeDetalheImpostoIcms);
  FreeAndNil(FNfeDetalheImpostoIcmsUfdest);
  FreeAndNil(FNfeDetalheImpostoIi);
  FreeAndNil(FNfeDetalheImpostoIpi);
  FreeAndNil(FNfeDetalheImpostoIssqn);
  FreeAndNil(FNfeDetalheImpostoPis);
  FreeAndNil(FNfeDetalheImpostoPisSt);
  FreeAndNil(FListaNfeExportacao);
  FreeAndNil(FListaNfeItemRastreado);
  FreeAndNil(FProduto);
  inherited;
end;



end.