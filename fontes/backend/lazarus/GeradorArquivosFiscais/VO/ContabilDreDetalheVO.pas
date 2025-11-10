{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTABIL_DRE_DETALHE] 
                                                                                
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
unit ContabilDreDetalheVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TContabilDreDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_CONTABIL_DRE_CABECALHO: Integer;
    FCLASSIFICACAO: String;
    FDESCRICAO: String;
    FFORMA_CALCULO: String;
    FSINAL: String;
    FNATUREZA: String;
    FVALOR: Extended;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdContabilDreCabecalho: Integer  read FID_CONTABIL_DRE_CABECALHO write FID_CONTABIL_DRE_CABECALHO;
    property Classificacao: String  read FCLASSIFICACAO write FCLASSIFICACAO;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property FormaCalculo: String  read FFORMA_CALCULO write FFORMA_CALCULO;
    property Sinal: String  read FSINAL write FSINAL;
    property Natureza: String  read FNATUREZA write FNATUREZA;
    property Valor: Extended  read FVALOR write FVALOR;


    //Transientes



  end;

  TListaContabilDreDetalheVO = specialize TFPGObjectList<TContabilDreDetalheVO>;

implementation


initialization
  Classes.RegisterClass(TContabilDreDetalheVO);

finalization
  Classes.UnRegisterClass(TContabilDreDetalheVO);

end.
