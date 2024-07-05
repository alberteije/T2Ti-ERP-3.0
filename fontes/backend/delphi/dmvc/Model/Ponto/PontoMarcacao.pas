{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PONTO_MARCACAO] 
                                                                                
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
unit PontoMarcacao;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TPontoMarcacao = class(TModelBase)
  private
    FId: Integer;
    FIdPontoRelogio: Integer;
    FIdColaborador: Integer;
    FNsr: Integer;
    FDataMarcacao: TDateTime;
    FHoraMarcacao: string;
    FTipoMarcacao: string;
    FTipoRegistro: string;
    FParEntradaSaida: string;
    FJustificativa: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_PONTO_RELOGIO')]
		[MVCNameAsAttribute('idPontoRelogio')]
		property IdPontoRelogio: Integer read FIdPontoRelogio write FIdPontoRelogio;
    [MVCColumnAttribute('ID_COLABORADOR')]
		[MVCNameAsAttribute('idColaborador')]
		property IdColaborador: Integer read FIdColaborador write FIdColaborador;
    [MVCColumnAttribute('NSR')]
		[MVCNameAsAttribute('nsr')]
		property Nsr: Integer read FNsr write FNsr;
    [MVCColumnAttribute('DATA_MARCACAO')]
		[MVCNameAsAttribute('dataMarcacao')]
		property DataMarcacao: TDateTime read FDataMarcacao write FDataMarcacao;
    [MVCColumnAttribute('HORA_MARCACAO')]
		[MVCNameAsAttribute('horaMarcacao')]
		property HoraMarcacao: string read FHoraMarcacao write FHoraMarcacao;
    [MVCColumnAttribute('TIPO_MARCACAO')]
		[MVCNameAsAttribute('tipoMarcacao')]
		property TipoMarcacao: string read FTipoMarcacao write FTipoMarcacao;
    [MVCColumnAttribute('TIPO_REGISTRO')]
		[MVCNameAsAttribute('tipoRegistro')]
		property TipoRegistro: string read FTipoRegistro write FTipoRegistro;
    [MVCColumnAttribute('PAR_ENTRADA_SAIDA')]
		[MVCNameAsAttribute('parEntradaSaida')]
		property ParEntradaSaida: string read FParEntradaSaida write FParEntradaSaida;
    [MVCColumnAttribute('JUSTIFICATIVA')]
		[MVCNameAsAttribute('justificativa')]
		property Justificativa: string read FJustificativa write FJustificativa;
      
  end;

implementation

{ TPontoMarcacao }



end.