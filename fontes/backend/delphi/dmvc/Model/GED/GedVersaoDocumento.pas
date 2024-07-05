{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [GED_VERSAO_DOCUMENTO] 
                                                                                
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
unit GedVersaoDocumento;

interface

uses
  Generics.Collections, System.SysUtils,
  Colaborador, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TGedVersaoDocumento = class(TModelBase)
  private
    FId: Integer;
    FIdGedDocumentoDetalhe: Integer;
    FIdColaborador: Integer;
    FVersao: Integer;
    FDataVersao: TDateTime;
    FHoraVersao: string;
    FHashArquivo: string;
    FCaminho: string;
    FAcao: string;
      
    FColaborador: TColaborador;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_GED_DOCUMENTO_DETALHE')]
		[MVCNameAsAttribute('idGedDocumentoDetalhe')]
		property IdGedDocumentoDetalhe: Integer read FIdGedDocumentoDetalhe write FIdGedDocumentoDetalhe;
    [MVCColumnAttribute('ID_COLABORADOR')]
		[MVCNameAsAttribute('idColaborador')]
		property IdColaborador: Integer read FIdColaborador write FIdColaborador;
    [MVCColumnAttribute('VERSAO')]
		[MVCNameAsAttribute('versao')]
		property Versao: Integer read FVersao write FVersao;
    [MVCColumnAttribute('DATA_VERSAO')]
		[MVCNameAsAttribute('dataVersao')]
		property DataVersao: TDateTime read FDataVersao write FDataVersao;
    [MVCColumnAttribute('HORA_VERSAO')]
		[MVCNameAsAttribute('horaVersao')]
		property HoraVersao: string read FHoraVersao write FHoraVersao;
    [MVCColumnAttribute('HASH_ARQUIVO')]
		[MVCNameAsAttribute('hashArquivo')]
		property HashArquivo: string read FHashArquivo write FHashArquivo;
    [MVCColumnAttribute('CAMINHO')]
		[MVCNameAsAttribute('caminho')]
		property Caminho: string read FCaminho write FCaminho;
    [MVCColumnAttribute('ACAO')]
		[MVCNameAsAttribute('acao')]
		property Acao: string read FAcao write FAcao;
      
    [MVCNameAsAttribute('colaborador')]
		property Colaborador: TColaborador read FColaborador write FColaborador;
  end;

implementation

{ TGedVersaoDocumento }

constructor TGedVersaoDocumento.Create;
begin
  inherited;

  FColaborador := TColaborador.Create;
end;

destructor TGedVersaoDocumento.Destroy;
begin
  FreeAndNil(FColaborador);
  inherited;
end;



end.