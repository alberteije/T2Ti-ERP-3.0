{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PONTO_FECHAMENTO_JORNADA] 
                                                                                
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
unit PontoFechamentoJornada;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TPontoFechamentoJornada = class(TModelBase)
  private
    FId: Integer;
    FIdPontoClassificacaoJornada: Integer;
    FIdColaborador: Integer;
    FDataFechamento: TDateTime;
    FDiaSemana: string;
    FCodigoHorario: string;
    FCargaHorariaEsperada: string;
    FCargaHorariaDiurna: string;
    FCargaHorariaNoturna: string;
    FCargaHorariaTotal: string;
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
    FHoraInicioJornada: string;
    FHoraFimJornada: string;
    FHoraExtra01: string;
    FPercentualHoraExtra01: Extended;
    FModalidadeHoraExtra01: string;
    FHoraExtra02: string;
    FPercentualHoraExtra02: Extended;
    FModalidadeHoraExtra02: string;
    FHoraExtra03: string;
    FPercentualHoraExtra03: Extended;
    FModalidadeHoraExtra03: string;
    FHoraExtra04: string;
    FPercentualHoraExtra04: Extended;
    FModalidadeHoraExtra04: string;
    FFaltaAtraso: string;
    FCompensar: string;
    FBancoHoras: string;
    FObservacao: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_PONTO_CLASSIFICACAO_JORNADA')]
		[MVCNameAsAttribute('idPontoClassificacaoJornada')]
		property IdPontoClassificacaoJornada: Integer read FIdPontoClassificacaoJornada write FIdPontoClassificacaoJornada;
    [MVCColumnAttribute('ID_COLABORADOR')]
		[MVCNameAsAttribute('idColaborador')]
		property IdColaborador: Integer read FIdColaborador write FIdColaborador;
    [MVCColumnAttribute('DATA_FECHAMENTO')]
		[MVCNameAsAttribute('dataFechamento')]
		property DataFechamento: TDateTime read FDataFechamento write FDataFechamento;
    [MVCColumnAttribute('DIA_SEMANA')]
		[MVCNameAsAttribute('diaSemana')]
		property DiaSemana: string read FDiaSemana write FDiaSemana;
    [MVCColumnAttribute('CODIGO_HORARIO')]
		[MVCNameAsAttribute('codigoHorario')]
		property CodigoHorario: string read FCodigoHorario write FCodigoHorario;
    [MVCColumnAttribute('CARGA_HORARIA_ESPERADA')]
		[MVCNameAsAttribute('cargaHorariaEsperada')]
		property CargaHorariaEsperada: string read FCargaHorariaEsperada write FCargaHorariaEsperada;
    [MVCColumnAttribute('CARGA_HORARIA_DIURNA')]
		[MVCNameAsAttribute('cargaHorariaDiurna')]
		property CargaHorariaDiurna: string read FCargaHorariaDiurna write FCargaHorariaDiurna;
    [MVCColumnAttribute('CARGA_HORARIA_NOTURNA')]
		[MVCNameAsAttribute('cargaHorariaNoturna')]
		property CargaHorariaNoturna: string read FCargaHorariaNoturna write FCargaHorariaNoturna;
    [MVCColumnAttribute('CARGA_HORARIA_TOTAL')]
		[MVCNameAsAttribute('cargaHorariaTotal')]
		property CargaHorariaTotal: string read FCargaHorariaTotal write FCargaHorariaTotal;
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
    [MVCColumnAttribute('HORA_INICIO_JORNADA')]
		[MVCNameAsAttribute('horaInicioJornada')]
		property HoraInicioJornada: string read FHoraInicioJornada write FHoraInicioJornada;
    [MVCColumnAttribute('HORA_FIM_JORNADA')]
		[MVCNameAsAttribute('horaFimJornada')]
		property HoraFimJornada: string read FHoraFimJornada write FHoraFimJornada;
    [MVCColumnAttribute('HORA_EXTRA01')]
		[MVCNameAsAttribute('horaExtra01')]
		property HoraExtra01: string read FHoraExtra01 write FHoraExtra01;
    [MVCColumnAttribute('PERCENTUAL_HORA_EXTRA01')]
		[MVCNameAsAttribute('percentualHoraExtra01')]
		property PercentualHoraExtra01: Extended read FPercentualHoraExtra01 write FPercentualHoraExtra01;
    [MVCColumnAttribute('MODALIDADE_HORA_EXTRA01')]
		[MVCNameAsAttribute('modalidadeHoraExtra01')]
		property ModalidadeHoraExtra01: string read FModalidadeHoraExtra01 write FModalidadeHoraExtra01;
    [MVCColumnAttribute('HORA_EXTRA02')]
		[MVCNameAsAttribute('horaExtra02')]
		property HoraExtra02: string read FHoraExtra02 write FHoraExtra02;
    [MVCColumnAttribute('PERCENTUAL_HORA_EXTRA02')]
		[MVCNameAsAttribute('percentualHoraExtra02')]
		property PercentualHoraExtra02: Extended read FPercentualHoraExtra02 write FPercentualHoraExtra02;
    [MVCColumnAttribute('MODALIDADE_HORA_EXTRA02')]
		[MVCNameAsAttribute('modalidadeHoraExtra02')]
		property ModalidadeHoraExtra02: string read FModalidadeHoraExtra02 write FModalidadeHoraExtra02;
    [MVCColumnAttribute('HORA_EXTRA03')]
		[MVCNameAsAttribute('horaExtra03')]
		property HoraExtra03: string read FHoraExtra03 write FHoraExtra03;
    [MVCColumnAttribute('PERCENTUAL_HORA_EXTRA03')]
		[MVCNameAsAttribute('percentualHoraExtra03')]
		property PercentualHoraExtra03: Extended read FPercentualHoraExtra03 write FPercentualHoraExtra03;
    [MVCColumnAttribute('MODALIDADE_HORA_EXTRA03')]
		[MVCNameAsAttribute('modalidadeHoraExtra03')]
		property ModalidadeHoraExtra03: string read FModalidadeHoraExtra03 write FModalidadeHoraExtra03;
    [MVCColumnAttribute('HORA_EXTRA04')]
		[MVCNameAsAttribute('horaExtra04')]
		property HoraExtra04: string read FHoraExtra04 write FHoraExtra04;
    [MVCColumnAttribute('PERCENTUAL_HORA_EXTRA04')]
		[MVCNameAsAttribute('percentualHoraExtra04')]
		property PercentualHoraExtra04: Extended read FPercentualHoraExtra04 write FPercentualHoraExtra04;
    [MVCColumnAttribute('MODALIDADE_HORA_EXTRA04')]
		[MVCNameAsAttribute('modalidadeHoraExtra04')]
		property ModalidadeHoraExtra04: string read FModalidadeHoraExtra04 write FModalidadeHoraExtra04;
    [MVCColumnAttribute('FALTA_ATRASO')]
		[MVCNameAsAttribute('faltaAtraso')]
		property FaltaAtraso: string read FFaltaAtraso write FFaltaAtraso;
    [MVCColumnAttribute('COMPENSAR')]
		[MVCNameAsAttribute('compensar')]
		property Compensar: string read FCompensar write FCompensar;
    [MVCColumnAttribute('BANCO_HORAS')]
		[MVCNameAsAttribute('bancoHoras')]
		property BancoHoras: string read FBancoHoras write FBancoHoras;
    [MVCColumnAttribute('OBSERVACAO')]
		[MVCNameAsAttribute('observacao')]
		property Observacao: string read FObservacao write FObservacao;
      
  end;

implementation

{ TPontoFechamentoJornada }



end.