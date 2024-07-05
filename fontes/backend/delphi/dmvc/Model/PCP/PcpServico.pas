{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PCP_SERVICO] 
                                                                                
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
unit PcpServico;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TPcpServico = class(TModelBase)
  private
    FId: Integer;
    FIdPcpOpDetalhe: Integer;
    FInicioRealizado: TDateTime;
    FTerminoRealizado: TDateTime;
    FHorasRealizado: Integer;
    FMinutosRealizado: Integer;
    FSegundosRealizado: Integer;
    FCustoRealizado: Extended;
    FInicioPrevisto: TDateTime;
    FTerminoPrevisto: TDateTime;
    FHorasPrevisto: Integer;
    FMinutosPrevisto: Integer;
    FSegundosPrevisto: Integer;
    FCustoPrevisto: Extended;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_PCP_OP_DETALHE')]
		[MVCNameAsAttribute('idPcpOpDetalhe')]
		property IdPcpOpDetalhe: Integer read FIdPcpOpDetalhe write FIdPcpOpDetalhe;
    [MVCColumnAttribute('INICIO_REALIZADO')]
		[MVCNameAsAttribute('inicioRealizado')]
		property InicioRealizado: TDateTime read FInicioRealizado write FInicioRealizado;
    [MVCColumnAttribute('TERMINO_REALIZADO')]
		[MVCNameAsAttribute('terminoRealizado')]
		property TerminoRealizado: TDateTime read FTerminoRealizado write FTerminoRealizado;
    [MVCColumnAttribute('HORAS_REALIZADO')]
		[MVCNameAsAttribute('horasRealizado')]
		property HorasRealizado: Integer read FHorasRealizado write FHorasRealizado;
    [MVCColumnAttribute('MINUTOS_REALIZADO')]
		[MVCNameAsAttribute('minutosRealizado')]
		property MinutosRealizado: Integer read FMinutosRealizado write FMinutosRealizado;
    [MVCColumnAttribute('SEGUNDOS_REALIZADO')]
		[MVCNameAsAttribute('segundosRealizado')]
		property SegundosRealizado: Integer read FSegundosRealizado write FSegundosRealizado;
    [MVCColumnAttribute('CUSTO_REALIZADO')]
		[MVCNameAsAttribute('custoRealizado')]
		property CustoRealizado: Extended read FCustoRealizado write FCustoRealizado;
    [MVCColumnAttribute('INICIO_PREVISTO')]
		[MVCNameAsAttribute('inicioPrevisto')]
		property InicioPrevisto: TDateTime read FInicioPrevisto write FInicioPrevisto;
    [MVCColumnAttribute('TERMINO_PREVISTO')]
		[MVCNameAsAttribute('terminoPrevisto')]
		property TerminoPrevisto: TDateTime read FTerminoPrevisto write FTerminoPrevisto;
    [MVCColumnAttribute('HORAS_PREVISTO')]
		[MVCNameAsAttribute('horasPrevisto')]
		property HorasPrevisto: Integer read FHorasPrevisto write FHorasPrevisto;
    [MVCColumnAttribute('MINUTOS_PREVISTO')]
		[MVCNameAsAttribute('minutosPrevisto')]
		property MinutosPrevisto: Integer read FMinutosPrevisto write FMinutosPrevisto;
    [MVCColumnAttribute('SEGUNDOS_PREVISTO')]
		[MVCNameAsAttribute('segundosPrevisto')]
		property SegundosPrevisto: Integer read FSegundosPrevisto write FSegundosPrevisto;
    [MVCColumnAttribute('CUSTO_PREVISTO')]
		[MVCNameAsAttribute('custoPrevisto')]
		property CustoPrevisto: Extended read FCustoPrevisto write FCustoPrevisto;
      
  end;

implementation

{ TPcpServico }



end.