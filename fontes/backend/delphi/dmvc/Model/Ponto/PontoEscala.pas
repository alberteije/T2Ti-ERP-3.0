{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PONTO_ESCALA] 
                                                                                
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
unit PontoEscala;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TPontoEscala = class(TModelBase)
  private
    FId: Integer;
    FNome: string;
    FDescontoHoraDia: string;
    FDescontoDsr: string;
    FCodigoHorarioDomingo: string;
    FCodigoHorarioSegunda: string;
    FCodigoHorarioTerca: string;
    FCodigoHorarioQuarta: string;
    FCodigoHorarioQuinta: string;
    FCodigoHorarioSexta: string;
    FCodigoHorarioSabado: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('NOME')]
		[MVCNameAsAttribute('nome')]
		property Nome: string read FNome write FNome;
    [MVCColumnAttribute('DESCONTO_HORA_DIA')]
		[MVCNameAsAttribute('descontoHoraDia')]
		property DescontoHoraDia: string read FDescontoHoraDia write FDescontoHoraDia;
    [MVCColumnAttribute('DESCONTO_DSR')]
		[MVCNameAsAttribute('descontoDsr')]
		property DescontoDsr: string read FDescontoDsr write FDescontoDsr;
    [MVCColumnAttribute('CODIGO_HORARIO_DOMINGO')]
		[MVCNameAsAttribute('codigoHorarioDomingo')]
		property CodigoHorarioDomingo: string read FCodigoHorarioDomingo write FCodigoHorarioDomingo;
    [MVCColumnAttribute('CODIGO_HORARIO_SEGUNDA')]
		[MVCNameAsAttribute('codigoHorarioSegunda')]
		property CodigoHorarioSegunda: string read FCodigoHorarioSegunda write FCodigoHorarioSegunda;
    [MVCColumnAttribute('CODIGO_HORARIO_TERCA')]
		[MVCNameAsAttribute('codigoHorarioTerca')]
		property CodigoHorarioTerca: string read FCodigoHorarioTerca write FCodigoHorarioTerca;
    [MVCColumnAttribute('CODIGO_HORARIO_QUARTA')]
		[MVCNameAsAttribute('codigoHorarioQuarta')]
		property CodigoHorarioQuarta: string read FCodigoHorarioQuarta write FCodigoHorarioQuarta;
    [MVCColumnAttribute('CODIGO_HORARIO_QUINTA')]
		[MVCNameAsAttribute('codigoHorarioQuinta')]
		property CodigoHorarioQuinta: string read FCodigoHorarioQuinta write FCodigoHorarioQuinta;
    [MVCColumnAttribute('CODIGO_HORARIO_SEXTA')]
		[MVCNameAsAttribute('codigoHorarioSexta')]
		property CodigoHorarioSexta: string read FCodigoHorarioSexta write FCodigoHorarioSexta;
    [MVCColumnAttribute('CODIGO_HORARIO_SABADO')]
		[MVCNameAsAttribute('codigoHorarioSabado')]
		property CodigoHorarioSabado: string read FCodigoHorarioSabado write FCodigoHorarioSabado;
      
  end;

implementation

{ TPontoEscala }



end.