{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTABIL_LOTE] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2016 T2Ti.COM                                          
                                                                                
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
unit ContabilLoteVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TContabilLoteVO = class(TVO)
  private
    FID: Integer;
    FDESCRICAO: String;
    FLIBERADO: String;
    FDATA_INCLUSAO: TDateTime;
    FDATA_LIBERACAO: TDateTime;
    FPROGRAMADO: String;
    FVALOR: Extended;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property Liberado: String  read FLIBERADO write FLIBERADO;
    property DataInclusao: TDateTime  read FDATA_INCLUSAO write FDATA_INCLUSAO;
    property DataLiberacao: TDateTime  read FDATA_LIBERACAO write FDATA_LIBERACAO;
    property Programado: String  read FPROGRAMADO write FPROGRAMADO;
    property Valor: Extended  read FVALOR write FVALOR;


    //Transientes



  end;

  TListaContabilLoteVO = specialize TFPGObjectList<TContabilLoteVO>;

implementation


initialization
  Classes.RegisterClass(TContabilLoteVO);

finalization
  Classes.UnRegisterClass(TContabilLoteVO);

end.
