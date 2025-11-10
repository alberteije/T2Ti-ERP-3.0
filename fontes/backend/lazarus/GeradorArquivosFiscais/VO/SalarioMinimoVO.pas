{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [SALARIO_MINIMO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2014 T2Ti.COM                                          
                                                                                
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
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                    
@version 2.0                                                                    
*******************************************************************************}
unit SalarioMinimoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TSalarioMinimoVO = class(TVO)
  private
    FID: Integer;
    FVIGENCIA: TDateTime;
    FVALOR_MENSAL: Extended;
    FVALOR_DIARIO: Extended;
    FVALOR_HORA: Extended;
    FNORMA_LEGAL: String;
    FDOU: TDateTime;

  published
    property Id: Integer  read FID write FID;
    property Vigencia: TDateTime  read FVIGENCIA write FVIGENCIA;
    property ValorMensal: Extended  read FVALOR_MENSAL write FVALOR_MENSAL;
    property ValorDiario: Extended  read FVALOR_DIARIO write FVALOR_DIARIO;
    property ValorHora: Extended  read FVALOR_HORA write FVALOR_HORA;
    property NormaLegal: String  read FNORMA_LEGAL write FNORMA_LEGAL;
    property Dou: TDateTime  read FDOU write FDOU;

  end;

  TListaSalarioMinimoVO = specialize TFPGObjectList<TSalarioMinimoVO>;

implementation


initialization
  Classes.RegisterClass(TSalarioMinimoVO);

finalization
  Classes.UnRegisterClass(TSalarioMinimoVO);

end.
