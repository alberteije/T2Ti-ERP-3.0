{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PATRIM_BEM] 
                                                                                
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
unit PatrimBem;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TPatrimBem = class(TModelBase)
  private
    FId: Integer;
    FIdCentroResultado: Integer;
    FIdPatrimTipoAquisicaoBem: Integer;
    FIdPatrimEstadoConservacao: Integer;
    FIdPatrimGrupoBem: Integer;
    FIdFornecedor: Integer;
    FIdColaborador: Integer;
    FIdSetor: Integer;
    FNumeroNb: string;
    FNome: string;
    FDescricao: string;
    FNumeroSerie: string;
    FDataAquisicao: TDateTime;
    FDataAceite: TDateTime;
    FDataCadastro: TDateTime;
    FDataContabilizado: TDateTime;
    FDataVistoria: TDateTime;
    FDataMarcacao: TDateTime;
    FDataBaixa: TDateTime;
    FVencimentoGarantia: TDateTime;
    FNumeroNotaFiscal: string;
    FChaveNfe: string;
    FValorOriginal: Extended;
    FValorCompra: Extended;
    FValorAtualizado: Extended;
    FValorBaixa: Extended;
    FDeprecia: string;
    FMetodoDepreciacao: string;
    FInicioDepreciacao: TDateTime;
    FUltimaDepreciacao: TDateTime;
    FTipoDepreciacao: string;
    FTaxaAnualDepreciacao: Extended;
    FTaxaMensalDepreciacao: Extended;
    FTaxaDepreciacaoAcelerada: Extended;
    FTaxaDepreciacaoIncentivada: Extended;
    FFuncao: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_CENTRO_RESULTADO')]
		[MVCNameAsAttribute('idCentroResultado')]
		property IdCentroResultado: Integer read FIdCentroResultado write FIdCentroResultado;
    [MVCColumnAttribute('ID_PATRIM_TIPO_AQUISICAO_BEM')]
		[MVCNameAsAttribute('idPatrimTipoAquisicaoBem')]
		property IdPatrimTipoAquisicaoBem: Integer read FIdPatrimTipoAquisicaoBem write FIdPatrimTipoAquisicaoBem;
    [MVCColumnAttribute('ID_PATRIM_ESTADO_CONSERVACAO')]
		[MVCNameAsAttribute('idPatrimEstadoConservacao')]
		property IdPatrimEstadoConservacao: Integer read FIdPatrimEstadoConservacao write FIdPatrimEstadoConservacao;
    [MVCColumnAttribute('ID_PATRIM_GRUPO_BEM')]
		[MVCNameAsAttribute('idPatrimGrupoBem')]
		property IdPatrimGrupoBem: Integer read FIdPatrimGrupoBem write FIdPatrimGrupoBem;
    [MVCColumnAttribute('ID_FORNECEDOR')]
		[MVCNameAsAttribute('idFornecedor')]
		property IdFornecedor: Integer read FIdFornecedor write FIdFornecedor;
    [MVCColumnAttribute('ID_COLABORADOR')]
		[MVCNameAsAttribute('idColaborador')]
		property IdColaborador: Integer read FIdColaborador write FIdColaborador;
    [MVCColumnAttribute('ID_SETOR')]
		[MVCNameAsAttribute('idSetor')]
		property IdSetor: Integer read FIdSetor write FIdSetor;
    [MVCColumnAttribute('NUMERO_NB')]
		[MVCNameAsAttribute('numeroNb')]
		property NumeroNb: string read FNumeroNb write FNumeroNb;
    [MVCColumnAttribute('NOME')]
		[MVCNameAsAttribute('nome')]
		property Nome: string read FNome write FNome;
    [MVCColumnAttribute('DESCRICAO')]
		[MVCNameAsAttribute('descricao')]
		property Descricao: string read FDescricao write FDescricao;
    [MVCColumnAttribute('NUMERO_SERIE')]
		[MVCNameAsAttribute('numeroSerie')]
		property NumeroSerie: string read FNumeroSerie write FNumeroSerie;
    [MVCColumnAttribute('DATA_AQUISICAO')]
		[MVCNameAsAttribute('dataAquisicao')]
		property DataAquisicao: TDateTime read FDataAquisicao write FDataAquisicao;
    [MVCColumnAttribute('DATA_ACEITE')]
		[MVCNameAsAttribute('dataAceite')]
		property DataAceite: TDateTime read FDataAceite write FDataAceite;
    [MVCColumnAttribute('DATA_CADASTRO')]
		[MVCNameAsAttribute('dataCadastro')]
		property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
    [MVCColumnAttribute('DATA_CONTABILIZADO')]
		[MVCNameAsAttribute('dataContabilizado')]
		property DataContabilizado: TDateTime read FDataContabilizado write FDataContabilizado;
    [MVCColumnAttribute('DATA_VISTORIA')]
		[MVCNameAsAttribute('dataVistoria')]
		property DataVistoria: TDateTime read FDataVistoria write FDataVistoria;
    [MVCColumnAttribute('DATA_MARCACAO')]
		[MVCNameAsAttribute('dataMarcacao')]
		property DataMarcacao: TDateTime read FDataMarcacao write FDataMarcacao;
    [MVCColumnAttribute('DATA_BAIXA')]
		[MVCNameAsAttribute('dataBaixa')]
		property DataBaixa: TDateTime read FDataBaixa write FDataBaixa;
    [MVCColumnAttribute('VENCIMENTO_GARANTIA')]
		[MVCNameAsAttribute('vencimentoGarantia')]
		property VencimentoGarantia: TDateTime read FVencimentoGarantia write FVencimentoGarantia;
    [MVCColumnAttribute('NUMERO_NOTA_FISCAL')]
		[MVCNameAsAttribute('numeroNotaFiscal')]
		property NumeroNotaFiscal: string read FNumeroNotaFiscal write FNumeroNotaFiscal;
    [MVCColumnAttribute('CHAVE_NFE')]
		[MVCNameAsAttribute('chaveNfe')]
		property ChaveNfe: string read FChaveNfe write FChaveNfe;
    [MVCColumnAttribute('VALOR_ORIGINAL')]
		[MVCNameAsAttribute('valorOriginal')]
		property ValorOriginal: Extended read FValorOriginal write FValorOriginal;
    [MVCColumnAttribute('VALOR_COMPRA')]
		[MVCNameAsAttribute('valorCompra')]
		property ValorCompra: Extended read FValorCompra write FValorCompra;
    [MVCColumnAttribute('VALOR_ATUALIZADO')]
		[MVCNameAsAttribute('valorAtualizado')]
		property ValorAtualizado: Extended read FValorAtualizado write FValorAtualizado;
    [MVCColumnAttribute('VALOR_BAIXA')]
		[MVCNameAsAttribute('valorBaixa')]
		property ValorBaixa: Extended read FValorBaixa write FValorBaixa;
    [MVCColumnAttribute('DEPRECIA')]
		[MVCNameAsAttribute('deprecia')]
		property Deprecia: string read FDeprecia write FDeprecia;
    [MVCColumnAttribute('METODO_DEPRECIACAO')]
		[MVCNameAsAttribute('metodoDepreciacao')]
		property MetodoDepreciacao: string read FMetodoDepreciacao write FMetodoDepreciacao;
    [MVCColumnAttribute('INICIO_DEPRECIACAO')]
		[MVCNameAsAttribute('inicioDepreciacao')]
		property InicioDepreciacao: TDateTime read FInicioDepreciacao write FInicioDepreciacao;
    [MVCColumnAttribute('ULTIMA_DEPRECIACAO')]
		[MVCNameAsAttribute('ultimaDepreciacao')]
		property UltimaDepreciacao: TDateTime read FUltimaDepreciacao write FUltimaDepreciacao;
    [MVCColumnAttribute('TIPO_DEPRECIACAO')]
		[MVCNameAsAttribute('tipoDepreciacao')]
		property TipoDepreciacao: string read FTipoDepreciacao write FTipoDepreciacao;
    [MVCColumnAttribute('TAXA_ANUAL_DEPRECIACAO')]
		[MVCNameAsAttribute('taxaAnualDepreciacao')]
		property TaxaAnualDepreciacao: Extended read FTaxaAnualDepreciacao write FTaxaAnualDepreciacao;
    [MVCColumnAttribute('TAXA_MENSAL_DEPRECIACAO')]
		[MVCNameAsAttribute('taxaMensalDepreciacao')]
		property TaxaMensalDepreciacao: Extended read FTaxaMensalDepreciacao write FTaxaMensalDepreciacao;
    [MVCColumnAttribute('TAXA_DEPRECIACAO_ACELERADA')]
		[MVCNameAsAttribute('taxaDepreciacaoAcelerada')]
		property TaxaDepreciacaoAcelerada: Extended read FTaxaDepreciacaoAcelerada write FTaxaDepreciacaoAcelerada;
    [MVCColumnAttribute('TAXA_DEPRECIACAO_INCENTIVADA')]
		[MVCNameAsAttribute('taxaDepreciacaoIncentivada')]
		property TaxaDepreciacaoIncentivada: Extended read FTaxaDepreciacaoIncentivada write FTaxaDepreciacaoIncentivada;
    [MVCColumnAttribute('FUNCAO')]
		[MVCNameAsAttribute('funcao')]
		property Funcao: string read FFuncao write FFuncao;
      
  end;

implementation

{ TPatrimBem }



end.