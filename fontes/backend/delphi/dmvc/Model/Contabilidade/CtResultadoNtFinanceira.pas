{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CT_RESULTADO_NT_FINANCEIRA] 
                                                                                
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
unit CtResultadoNtFinanceira;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TCtResultadoNtFinanceira = class(TModelBase)
  private
    FId: Integer;
    FIdCentroResultado: Integer;
    FIdFinNaturezaFinanceira: Integer;
    FPercentualRateio: Extended;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_CENTRO_RESULTADO')]
		[MVCNameAsAttribute('idCentroResultado')]
		property IdCentroResultado: Integer read FIdCentroResultado write FIdCentroResultado;
    [MVCColumnAttribute('ID_FIN_NATUREZA_FINANCEIRA')]
		[MVCNameAsAttribute('idFinNaturezaFinanceira')]
		property IdFinNaturezaFinanceira: Integer read FIdFinNaturezaFinanceira write FIdFinNaturezaFinanceira;
    [MVCColumnAttribute('PERCENTUAL_RATEIO')]
		[MVCNameAsAttribute('percentualRateio')]
		property PercentualRateio: Extended read FPercentualRateio write FPercentualRateio;
      
  end;

implementation

{ TCtResultadoNtFinanceira }



end.