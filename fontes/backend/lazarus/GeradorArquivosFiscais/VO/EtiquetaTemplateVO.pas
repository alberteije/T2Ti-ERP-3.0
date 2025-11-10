{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ETIQUETA_TEMPLATE] 
                                                                                
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
unit EtiquetaTemplateVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TEtiquetaTemplateVO = class(TVO)
  private
    FID: Integer;
    FID_ETIQUETA_LAYOUT: Integer;
    FTABELA: String;
    FCAMPO: String;
    FFORMATO: Integer;
    FQUANTIDADE_REPETICOES: Integer;
    FFILTRO: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdEtiquetaLayout: Integer  read FID_ETIQUETA_LAYOUT write FID_ETIQUETA_LAYOUT;
    property Tabela: String  read FTABELA write FTABELA;
    property Campo: String  read FCAMPO write FCAMPO;
    property Formato: Integer  read FFORMATO write FFORMATO;
    property QuantidadeRepeticoes: Integer  read FQUANTIDADE_REPETICOES write FQUANTIDADE_REPETICOES;
    property Filtro: String  read FFILTRO write FFILTRO;


    //Transientes



  end;

  TListaEtiquetaTemplateVO = specialize TFPGObjectList<TEtiquetaTemplateVO>;

implementation


initialization
  Classes.RegisterClass(TEtiquetaTemplateVO);

finalization
  Classes.UnRegisterClass(TEtiquetaTemplateVO);

end.
