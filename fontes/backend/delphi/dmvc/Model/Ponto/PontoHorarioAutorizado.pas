{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PONTO_HORARIO_AUTORIZADO] 
                                                                                
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
unit PontoHorarioAutorizado;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TPontoHorarioAutorizado = class(TModelBase)
  private
    FId: Integer;
    FIdColaborador: Integer;
    FDataHorario: TDateTime;
    FTipo: string;
    FCargaHoraria: string;
    FEntrada01: string;
    FSaida01: string;
    FEntrada02: string;
    FSaida02: string;
    FEntrada03: string;
    FSaida03: string;
    FEntrada04: string;
    FSaida04: string;
    FEntrada05: string;
    FSaida05: string;
    FHoraFechamentoDia: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_COLABORADOR')]
		[MVCNameAsAttribute('idColaborador')]
		property IdColaborador: Integer read FIdColaborador write FIdColaborador;
    [MVCColumnAttribute('DATA_HORARIO')]
		[MVCNameAsAttribute('dataHorario')]
		property DataHorario: TDateTime read FDataHorario write FDataHorario;
    [MVCColumnAttribute('TIPO')]
		[MVCNameAsAttribute('tipo')]
		property Tipo: string read FTipo write FTipo;
    [MVCColumnAttribute('CARGA_HORARIA')]
		[MVCNameAsAttribute('cargaHoraria')]
		property CargaHoraria: string read FCargaHoraria write FCargaHoraria;
    [MVCColumnAttribute('ENTRADA01')]
		[MVCNameAsAttribute('entrada01')]
		property Entrada01: string read FEntrada01 write FEntrada01;
    [MVCColumnAttribute('SAIDA01')]
		[MVCNameAsAttribute('saida01')]
		property Saida01: string read FSaida01 write FSaida01;
    [MVCColumnAttribute('ENTRADA02')]
		[MVCNameAsAttribute('entrada02')]
		property Entrada02: string read FEntrada02 write FEntrada02;
    [MVCColumnAttribute('SAIDA02')]
		[MVCNameAsAttribute('saida02')]
		property Saida02: string read FSaida02 write FSaida02;
    [MVCColumnAttribute('ENTRADA03')]
		[MVCNameAsAttribute('entrada03')]
		property Entrada03: string read FEntrada03 write FEntrada03;
    [MVCColumnAttribute('SAIDA03')]
		[MVCNameAsAttribute('saida03')]
		property Saida03: string read FSaida03 write FSaida03;
    [MVCColumnAttribute('ENTRADA04')]
		[MVCNameAsAttribute('entrada04')]
		property Entrada04: string read FEntrada04 write FEntrada04;
    [MVCColumnAttribute('SAIDA04')]
		[MVCNameAsAttribute('saida04')]
		property Saida04: string read FSaida04 write FSaida04;
    [MVCColumnAttribute('ENTRADA05')]
		[MVCNameAsAttribute('entrada05')]
		property Entrada05: string read FEntrada05 write FEntrada05;
    [MVCColumnAttribute('SAIDA05')]
		[MVCNameAsAttribute('saida05')]
		property Saida05: string read FSaida05 write FSaida05;
    [MVCColumnAttribute('HORA_FECHAMENTO_DIA')]
		[MVCNameAsAttribute('horaFechamentoDia')]
		property HoraFechamentoDia: string read FHoraFechamentoDia write FHoraFechamentoDia;
      
  end;

implementation

{ TPontoHorarioAutorizado }



end.