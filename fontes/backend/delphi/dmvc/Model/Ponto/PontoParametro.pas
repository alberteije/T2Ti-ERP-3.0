{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PONTO_PARAMETRO] 
                                                                                
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
unit PontoParametro;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TPontoParametro = class(TModelBase)
  private
    FId: Integer;
    FMesAno: string;
    FDiaInicialApuracao: Integer;
    FHoraNoturnaInicio: string;
    FHoraNoturnaFim: string;
    FPeriodoMinimoInterjornada: string;
    FPercentualHeDiurna: Extended;
    FPercentualHeNoturna: Extended;
    FDuracaoHoraNoturna: string;
    FTratamentoHoraMais: string;
    FTratamentoHoraMenos: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('MES_ANO')]
		[MVCNameAsAttribute('mesAno')]
		property MesAno: string read FMesAno write FMesAno;
    [MVCColumnAttribute('DIA_INICIAL_APURACAO')]
		[MVCNameAsAttribute('diaInicialApuracao')]
		property DiaInicialApuracao: Integer read FDiaInicialApuracao write FDiaInicialApuracao;
    [MVCColumnAttribute('HORA_NOTURNA_INICIO')]
		[MVCNameAsAttribute('horaNoturnaInicio')]
		property HoraNoturnaInicio: string read FHoraNoturnaInicio write FHoraNoturnaInicio;
    [MVCColumnAttribute('HORA_NOTURNA_FIM')]
		[MVCNameAsAttribute('horaNoturnaFim')]
		property HoraNoturnaFim: string read FHoraNoturnaFim write FHoraNoturnaFim;
    [MVCColumnAttribute('PERIODO_MINIMO_INTERJORNADA')]
		[MVCNameAsAttribute('periodoMinimoInterjornada')]
		property PeriodoMinimoInterjornada: string read FPeriodoMinimoInterjornada write FPeriodoMinimoInterjornada;
    [MVCColumnAttribute('PERCENTUAL_HE_DIURNA')]
		[MVCNameAsAttribute('percentualHeDiurna')]
		property PercentualHeDiurna: Extended read FPercentualHeDiurna write FPercentualHeDiurna;
    [MVCColumnAttribute('PERCENTUAL_HE_NOTURNA')]
		[MVCNameAsAttribute('percentualHeNoturna')]
		property PercentualHeNoturna: Extended read FPercentualHeNoturna write FPercentualHeNoturna;
    [MVCColumnAttribute('DURACAO_HORA_NOTURNA')]
		[MVCNameAsAttribute('duracaoHoraNoturna')]
		property DuracaoHoraNoturna: string read FDuracaoHoraNoturna write FDuracaoHoraNoturna;
    [MVCColumnAttribute('TRATAMENTO_HORA_MAIS')]
		[MVCNameAsAttribute('tratamentoHoraMais')]
		property TratamentoHoraMais: string read FTratamentoHoraMais write FTratamentoHoraMais;
    [MVCColumnAttribute('TRATAMENTO_HORA_MENOS')]
		[MVCNameAsAttribute('tratamentoHoraMenos')]
		property TratamentoHoraMenos: string read FTratamentoHoraMenos write FTratamentoHoraMenos;
      
  end;

implementation

{ TPontoParametro }



end.