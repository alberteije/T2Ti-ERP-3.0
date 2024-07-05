{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [REQUISICAO_INTERNA_CABECALHO] 
                                                                                
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
unit RequisicaoInternaCabecalho;

interface

uses
  Generics.Collections, System.SysUtils,
  RequisicaoInternaDetalhe, Colaborador, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TRequisicaoInternaCabecalho = class(TModelBase)
  private
    FId: Integer;
    FIdColaborador: Integer;
    FDataRequisicao: TDateTime;
    FSituacao: string;
      
    FColaborador: TColaborador;
    FListaRequisicaoInternaDetalhe: TObjectList<TRequisicaoInternaDetalhe>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_COLABORADOR')]
		[MVCNameAsAttribute('idColaborador')]
		property IdColaborador: Integer read FIdColaborador write FIdColaborador;
    [MVCColumnAttribute('DATA_REQUISICAO')]
		[MVCNameAsAttribute('dataRequisicao')]
		property DataRequisicao: TDateTime read FDataRequisicao write FDataRequisicao;
    [MVCColumnAttribute('SITUACAO')]
		[MVCNameAsAttribute('situacao')]
		property Situacao: string read FSituacao write FSituacao;
      
    [MVCNameAsAttribute('colaborador')]
		property Colaborador: TColaborador read FColaborador write FColaborador;
    [MapperListOf(TRequisicaoInternaDetalhe)]
	[MVCNameAsAttribute('listaRequisicaoInternaDetalhe')]
	property ListaRequisicaoInternaDetalhe: TObjectList<TRequisicaoInternaDetalhe> read FListaRequisicaoInternaDetalhe write FListaRequisicaoInternaDetalhe;
  end;

implementation

{ TRequisicaoInternaCabecalho }

constructor TRequisicaoInternaCabecalho.Create;
begin
  inherited;

  FListaRequisicaoInternaDetalhe := TObjectList<TRequisicaoInternaDetalhe>.Create;
  FColaborador := TColaborador.Create;
end;

destructor TRequisicaoInternaCabecalho.Destroy;
begin
  FreeAndNil(FListaRequisicaoInternaDetalhe);
  FreeAndNil(FColaborador);
  inherited;
end;



end.