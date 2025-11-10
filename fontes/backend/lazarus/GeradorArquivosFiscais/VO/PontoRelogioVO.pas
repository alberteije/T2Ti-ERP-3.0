{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PONTO_RELOGIO] 
                                                                                
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
unit PontoRelogioVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TPontoRelogioVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FLOCALIZACAO: String;
    FMARCA: String;
    FFABRICANTE: String;
    FNUMERO_SERIE: String;
    FUTILIZACAO: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property Localizacao: String  read FLOCALIZACAO write FLOCALIZACAO;
    property Marca: String  read FMARCA write FMARCA;
    property Fabricante: String  read FFABRICANTE write FFABRICANTE;
    property NumeroSerie: String  read FNUMERO_SERIE write FNUMERO_SERIE;
    property Utilizacao: String  read FUTILIZACAO write FUTILIZACAO;


    //Transientes



  end;

  TListaPontoRelogioVO = specialize TFPGObjectList<TPontoRelogioVO>;

implementation


initialization
  Classes.RegisterClass(TPontoRelogioVO);

finalization
  Classes.UnRegisterClass(TPontoRelogioVO);

end.
