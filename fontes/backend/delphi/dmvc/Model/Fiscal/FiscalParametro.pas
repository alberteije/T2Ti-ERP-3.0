{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FISCAL_PARAMETRO] 
                                                                                
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
unit FiscalParametro;

interface

uses
  Generics.Collections, System.SysUtils,
  FiscalEstadualPorte, FiscalEstadualRegime, FiscalMunicipalRegime, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TFiscalParametro = class(TModelBase)
  private
    FId: Integer;
    FIdFiscalEstadualPorte: Integer;
    FIdFiscalEstadualRegime: Integer;
    FIdFiscalMunicipalRegime: Integer;
    FVigencia: string;
    FDescricaoVigencia: string;
    FCriterioLancamento: string;
    FApuracao: string;
    FMicroempreeIndividual: string;
    FCalcPisCofinsEfd: string;
    FSimplesCodigoAcesso: string;
    FSimplesTabela: string;
    FSimplesAtividade: string;
    FPerfilSped: string;
    FApuracaoConsolidada: string;
    FSubstituicaoTributaria: string;
    FFormaCalculoIss: string;
      
    FFiscalEstadualPorte: TFiscalEstadualPorte;
    FFiscalEstadualRegime: TFiscalEstadualRegime;
    FFiscalMunicipalRegime: TFiscalMunicipalRegime;
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_FISCAL_ESTADUAL_PORTE')]
		[MVCNameAsAttribute('idFiscalEstadualPorte')]
		property IdFiscalEstadualPorte: Integer read FIdFiscalEstadualPorte write FIdFiscalEstadualPorte;
    [MVCColumnAttribute('ID_FISCAL_ESTADUAL_REGIME')]
		[MVCNameAsAttribute('idFiscalEstadualRegime')]
		property IdFiscalEstadualRegime: Integer read FIdFiscalEstadualRegime write FIdFiscalEstadualRegime;
    [MVCColumnAttribute('ID_FISCAL_MUNICIPAL_REGIME')]
		[MVCNameAsAttribute('idFiscalMunicipalRegime')]
		property IdFiscalMunicipalRegime: Integer read FIdFiscalMunicipalRegime write FIdFiscalMunicipalRegime;
    [MVCColumnAttribute('VIGENCIA')]
		[MVCNameAsAttribute('vigencia')]
		property Vigencia: string read FVigencia write FVigencia;
    [MVCColumnAttribute('DESCRICAO_VIGENCIA')]
		[MVCNameAsAttribute('descricaoVigencia')]
		property DescricaoVigencia: string read FDescricaoVigencia write FDescricaoVigencia;
    [MVCColumnAttribute('CRITERIO_LANCAMENTO')]
		[MVCNameAsAttribute('criterioLancamento')]
		property CriterioLancamento: string read FCriterioLancamento write FCriterioLancamento;
    [MVCColumnAttribute('APURACAO')]
		[MVCNameAsAttribute('apuracao')]
		property Apuracao: string read FApuracao write FApuracao;
    [MVCColumnAttribute('MICROEMPREE_INDIVIDUAL')]
		[MVCNameAsAttribute('microempreeIndividual')]
		property MicroempreeIndividual: string read FMicroempreeIndividual write FMicroempreeIndividual;
    [MVCColumnAttribute('CALC_PIS_COFINS_EFD')]
		[MVCNameAsAttribute('calcPisCofinsEfd')]
		property CalcPisCofinsEfd: string read FCalcPisCofinsEfd write FCalcPisCofinsEfd;
    [MVCColumnAttribute('SIMPLES_CODIGO_ACESSO')]
		[MVCNameAsAttribute('simplesCodigoAcesso')]
		property SimplesCodigoAcesso: string read FSimplesCodigoAcesso write FSimplesCodigoAcesso;
    [MVCColumnAttribute('SIMPLES_TABELA')]
		[MVCNameAsAttribute('simplesTabela')]
		property SimplesTabela: string read FSimplesTabela write FSimplesTabela;
    [MVCColumnAttribute('SIMPLES_ATIVIDADE')]
		[MVCNameAsAttribute('simplesAtividade')]
		property SimplesAtividade: string read FSimplesAtividade write FSimplesAtividade;
    [MVCColumnAttribute('PERFIL_SPED')]
		[MVCNameAsAttribute('perfilSped')]
		property PerfilSped: string read FPerfilSped write FPerfilSped;
    [MVCColumnAttribute('APURACAO_CONSOLIDADA')]
		[MVCNameAsAttribute('apuracaoConsolidada')]
		property ApuracaoConsolidada: string read FApuracaoConsolidada write FApuracaoConsolidada;
    [MVCColumnAttribute('SUBSTITUICAO_TRIBUTARIA')]
		[MVCNameAsAttribute('substituicaoTributaria')]
		property SubstituicaoTributaria: string read FSubstituicaoTributaria write FSubstituicaoTributaria;
    [MVCColumnAttribute('FORMA_CALCULO_ISS')]
		[MVCNameAsAttribute('formaCalculoIss')]
		property FormaCalculoIss: string read FFormaCalculoIss write FFormaCalculoIss;
      
    [MVCNameAsAttribute('fiscalEstadualPorte')]
		property FiscalEstadualPorte: TFiscalEstadualPorte read FFiscalEstadualPorte write FFiscalEstadualPorte;
    [MVCNameAsAttribute('fiscalEstadualRegime')]
		property FiscalEstadualRegime: TFiscalEstadualRegime read FFiscalEstadualRegime write FFiscalEstadualRegime;
    [MVCNameAsAttribute('fiscalMunicipalRegime')]
		property FiscalMunicipalRegime: TFiscalMunicipalRegime read FFiscalMunicipalRegime write FFiscalMunicipalRegime;
  end;

implementation

{ TFiscalParametro }

constructor TFiscalParametro.Create;
begin
  inherited;
  FFiscalEstadualPorte := TFiscalEstadualPorte.Create;
  FFiscalEstadualRegime := TFiscalEstadualRegime.Create;
  FFiscalMunicipalRegime := TFiscalMunicipalRegime.Create;
end;

destructor TFiscalParametro.Destroy;
begin
  FreeAndNil(FFiscalEstadualPorte);
  FreeAndNil(FFiscalEstadualRegime);
  FreeAndNil(FFiscalMunicipalRegime);
  inherited;
end;

end.