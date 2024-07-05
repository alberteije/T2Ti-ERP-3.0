{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_PPP] 
                                                                                
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
unit FolhaPpp;

interface

uses
  Generics.Collections, System.SysUtils,
  FolhaPppAtividade, FolhaPppCat, FolhaPppExameMedico, FolhaPppFatorRisco, Colaborador, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TFolhaPpp = class(TModelBase)
  private
    FId: Integer;
    FIdColaborador: Integer;
    FObservacao: string;
      
    FColaborador: TColaborador;
    FListaFolhaPppAtividade: TObjectList<TFolhaPppAtividade>;
    FListaFolhaPppCat: TObjectList<TFolhaPppCat>;
    FListaFolhaPppExameMedico: TObjectList<TFolhaPppExameMedico>;
    FListaFolhaPppFatorRisco: TObjectList<TFolhaPppFatorRisco>;
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_COLABORADOR')]
		[MVCNameAsAttribute('idColaborador')]
		property IdColaborador: Integer read FIdColaborador write FIdColaborador;
    [MVCColumnAttribute('OBSERVACAO')]
		[MVCNameAsAttribute('observacao')]
		property Observacao: string read FObservacao write FObservacao;
      
    [MVCNameAsAttribute('colaborador')]
		property Colaborador: TColaborador read FColaborador write FColaborador;
    [MapperListOf(TFolhaPppAtividade)]
		[MVCNameAsAttribute('listaFolhaPppAtividade')]
		property ListaFolhaPppAtividade: TObjectList<TFolhaPppAtividade> read FListaFolhaPppAtividade write FListaFolhaPppAtividade;
    [MapperListOf(TFolhaPppCat)]
		[MVCNameAsAttribute('listaFolhaPppCat')]
		property ListaFolhaPppCat: TObjectList<TFolhaPppCat> read FListaFolhaPppCat write FListaFolhaPppCat;
    [MapperListOf(TFolhaPppExameMedico)]
		[MVCNameAsAttribute('listaFolhaPppExameMedico')]
		property ListaFolhaPppExameMedico: TObjectList<TFolhaPppExameMedico> read FListaFolhaPppExameMedico write FListaFolhaPppExameMedico;
    [MapperListOf(TFolhaPppFatorRisco)]
		[MVCNameAsAttribute('listaFolhaPppFatorRisco')]
		property ListaFolhaPppFatorRisco: TObjectList<TFolhaPppFatorRisco> read FListaFolhaPppFatorRisco write FListaFolhaPppFatorRisco;
  end;

implementation

{ TFolhaPpp }

constructor TFolhaPpp.Create;
begin
  inherited;
  FListaFolhaPppAtividade := TObjectList<TFolhaPppAtividade>.Create;
  FListaFolhaPppCat := TObjectList<TFolhaPppCat>.Create;
  FListaFolhaPppExameMedico := TObjectList<TFolhaPppExameMedico>.Create;
  FListaFolhaPppFatorRisco := TObjectList<TFolhaPppFatorRisco>.Create;
  FColaborador := TColaborador.Create;
end;

destructor TFolhaPpp.Destroy;
begin
  FreeAndNil(FListaFolhaPppAtividade);
  FreeAndNil(FListaFolhaPppCat);
  FreeAndNil(FListaFolhaPppExameMedico);
  FreeAndNil(FListaFolhaPppFatorRisco);
  FreeAndNil(FColaborador);
  inherited;
end;

end.