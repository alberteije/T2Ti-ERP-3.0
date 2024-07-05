{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [OS_ABERTURA] 
                                                                                
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
unit OsAbertura;

interface

uses
  Generics.Collections, System.SysUtils,
  OsAberturaEquipamento, OsEvolucao, OsProdutoServico, OsStatus, Cliente, Colaborador, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TOsAbertura = class(TModelBase)
  private
    FId: Integer;
    FIdOsStatus: Integer;
    FIdCliente: Integer;
    FIdColaborador: Integer;
    FNumero: string;
    FDataInicio: TDateTime;
    FHoraInicio: string;
    FDataPrevisao: TDateTime;
    FHoraPrevisao: string;
    FDataFim: TDateTime;
    FHoraFim: string;
    FNomeContato: string;
    FFoneContato: string;
    FObservacaoCliente: string;
    FObservacaoAbertura: string;
      
    FOsStatus: TOsStatus;
    FCliente: TCliente;
    FColaborador: TColaborador;
    FListaOsAberturaEquipamento: TObjectList<TOsAberturaEquipamento>;
    FListaOsEvolucao: TObjectList<TOsEvolucao>;
    FListaOsProdutoServico: TObjectList<TOsProdutoServico>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_OS_STATUS')]
		[MVCNameAsAttribute('idOsStatus')]
		property IdOsStatus: Integer read FIdOsStatus write FIdOsStatus;
    [MVCColumnAttribute('ID_CLIENTE')]
		[MVCNameAsAttribute('idCliente')]
		property IdCliente: Integer read FIdCliente write FIdCliente;
    [MVCColumnAttribute('ID_COLABORADOR')]
		[MVCNameAsAttribute('idColaborador')]
		property IdColaborador: Integer read FIdColaborador write FIdColaborador;
    [MVCColumnAttribute('NUMERO')]
		[MVCNameAsAttribute('numero')]
		property Numero: string read FNumero write FNumero;
    [MVCColumnAttribute('DATA_INICIO')]
		[MVCNameAsAttribute('dataInicio')]
		property DataInicio: TDateTime read FDataInicio write FDataInicio;
    [MVCColumnAttribute('HORA_INICIO')]
		[MVCNameAsAttribute('horaInicio')]
		property HoraInicio: string read FHoraInicio write FHoraInicio;
    [MVCColumnAttribute('DATA_PREVISAO')]
		[MVCNameAsAttribute('dataPrevisao')]
		property DataPrevisao: TDateTime read FDataPrevisao write FDataPrevisao;
    [MVCColumnAttribute('HORA_PREVISAO')]
		[MVCNameAsAttribute('horaPrevisao')]
		property HoraPrevisao: string read FHoraPrevisao write FHoraPrevisao;
    [MVCColumnAttribute('DATA_FIM')]
		[MVCNameAsAttribute('dataFim')]
		property DataFim: TDateTime read FDataFim write FDataFim;
    [MVCColumnAttribute('HORA_FIM')]
		[MVCNameAsAttribute('horaFim')]
		property HoraFim: string read FHoraFim write FHoraFim;
    [MVCColumnAttribute('NOME_CONTATO')]
		[MVCNameAsAttribute('nomeContato')]
		property NomeContato: string read FNomeContato write FNomeContato;
    [MVCColumnAttribute('FONE_CONTATO')]
		[MVCNameAsAttribute('foneContato')]
		property FoneContato: string read FFoneContato write FFoneContato;
    [MVCColumnAttribute('OBSERVACAO_CLIENTE')]
		[MVCNameAsAttribute('observacaoCliente')]
		property ObservacaoCliente: string read FObservacaoCliente write FObservacaoCliente;
    [MVCColumnAttribute('OBSERVACAO_ABERTURA')]
		[MVCNameAsAttribute('observacaoAbertura')]
		property ObservacaoAbertura: string read FObservacaoAbertura write FObservacaoAbertura;
      
    [MVCNameAsAttribute('osStatus')]
		property OsStatus: TOsStatus read FOsStatus write FOsStatus;
    [MVCNameAsAttribute('cliente')]
		property Cliente: TCliente read FCliente write FCliente;
    [MVCNameAsAttribute('colaborador')]
		property Colaborador: TColaborador read FColaborador write FColaborador;
    [MapperListOf(TOsAberturaEquipamento)]
	[MVCNameAsAttribute('listaOsAberturaEquipamento')]
	property ListaOsAberturaEquipamento: TObjectList<TOsAberturaEquipamento> read FListaOsAberturaEquipamento write FListaOsAberturaEquipamento;
    [MapperListOf(TOsEvolucao)]
	[MVCNameAsAttribute('listaOsEvolucao')]
	property ListaOsEvolucao: TObjectList<TOsEvolucao> read FListaOsEvolucao write FListaOsEvolucao;
    [MapperListOf(TOsProdutoServico)]
	[MVCNameAsAttribute('listaOsProdutoServico')]
	property ListaOsProdutoServico: TObjectList<TOsProdutoServico> read FListaOsProdutoServico write FListaOsProdutoServico;
  end;

implementation

{ TOsAbertura }

constructor TOsAbertura.Create;
begin
  inherited;

  FListaOsAberturaEquipamento := TObjectList<TOsAberturaEquipamento>.Create;
  FListaOsEvolucao := TObjectList<TOsEvolucao>.Create;
  FListaOsProdutoServico := TObjectList<TOsProdutoServico>.Create;
  FOsStatus := TOsStatus.Create;
  FCliente := TCliente.Create;
  FColaborador := TColaborador.Create;
end;

destructor TOsAbertura.Destroy;
begin
  FreeAndNil(FListaOsAberturaEquipamento);
  FreeAndNil(FListaOsEvolucao);
  FreeAndNil(FListaOsProdutoServico);
  FreeAndNil(FOsStatus);
  FreeAndNil(FCliente);
  FreeAndNil(FColaborador);
  inherited;
end;



end.