{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FERIADOS] 
                                                                                
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
unit FeriadosVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TFeriadosVO = class(TVO)
  private
    FID: Integer;
    FANO: String;
    FNOME: String;
    FABRANGENCIA: String;
    FUF: String;
    FMUNICIPIO_IBGE: Integer;
    FTIPO: String;
    FDATA_FERIADO: TDateTime;

  published 
    property Id: Integer  read FID write FID;
    property Ano: String  read FANO write FANO;
    property Nome: String  read FNOME write FNOME;
    property Abrangencia: String  read FABRANGENCIA write FABRANGENCIA;
    property Uf: String  read FUF write FUF;
    property MunicipioIbge: Integer  read FMUNICIPIO_IBGE write FMUNICIPIO_IBGE;
    property Tipo: String  read FTIPO write FTIPO;
    property DataFeriado: TDateTime  read FDATA_FERIADO write FDATA_FERIADO;

  end;

  TListaFeriadosVO = specialize TFPGObjectList<TFeriadosVO>;

implementation


initialization
  Classes.RegisterClass(TFeriadosVO);

finalization
  Classes.UnRegisterClass(TFeriadosVO);

end.
