{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CTE_AQUAVIARIO_BALSA] 
                                                                                
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
unit CteAquaviarioBalsaVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TCteAquaviarioBalsaVO = class(TVO)
  private
    FID: Integer;
    FID_CTE_AQUAVIARIO: Integer;
    FID_BALSA: String;
    FNUMERO_VIAGEM: Integer;
    FDIRECAO: String;
    FPORTO_EMBARQUE: String;
    FPORTO_TRANSBORDO: String;
    FPORTO_DESTINO: String;
    FTIPO_NAVEGACAO: Integer;
    FIRIN: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdCteAquaviario: Integer  read FID_CTE_AQUAVIARIO write FID_CTE_AQUAVIARIO;
    property IdBalsa: String  read FID_BALSA write FID_BALSA;
    property NumeroViagem: Integer  read FNUMERO_VIAGEM write FNUMERO_VIAGEM;
    property Direcao: String  read FDIRECAO write FDIRECAO;
    property PortoEmbarque: String  read FPORTO_EMBARQUE write FPORTO_EMBARQUE;
    property PortoTransbordo: String  read FPORTO_TRANSBORDO write FPORTO_TRANSBORDO;
    property PortoDestino: String  read FPORTO_DESTINO write FPORTO_DESTINO;
    property TipoNavegacao: Integer  read FTIPO_NAVEGACAO write FTIPO_NAVEGACAO;
    property Irin: String  read FIRIN write FIRIN;


    //Transientes



  end;

  TListaCteAquaviarioBalsaVO = specialize TFPGObjectList<TCteAquaviarioBalsaVO>;

implementation


initialization
  Classes.RegisterClass(TCteAquaviarioBalsaVO);

finalization
  Classes.UnRegisterClass(TCteAquaviarioBalsaVO);

end.
