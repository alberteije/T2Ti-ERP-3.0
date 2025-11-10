{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CTE_RODOVIARIO_PEDAGIO] 
                                                                                
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
unit CteRodoviarioPedagioVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TCteRodoviarioPedagioVO = class(TVO)
  private
    FID: Integer;
    FID_CTE_RODOVIARIO: Integer;
    FCNPJ_FORNECEDOR: String;
    FCOMPROVANTE_COMPRA: String;
    FCNPJ_RESPONSAVEL: String;
    FVALOR: Extended;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdCteRodoviario: Integer  read FID_CTE_RODOVIARIO write FID_CTE_RODOVIARIO;
    property CnpjFornecedor: String  read FCNPJ_FORNECEDOR write FCNPJ_FORNECEDOR;
    property ComprovanteCompra: String  read FCOMPROVANTE_COMPRA write FCOMPROVANTE_COMPRA;
    property CnpjResponsavel: String  read FCNPJ_RESPONSAVEL write FCNPJ_RESPONSAVEL;
    property Valor: Extended  read FVALOR write FVALOR;


    //Transientes



  end;

  TListaCteRodoviarioPedagioVO = specialize TFPGObjectList<TCteRodoviarioPedagioVO>;

implementation


initialization
  Classes.RegisterClass(TCteRodoviarioPedagioVO);

finalization
  Classes.UnRegisterClass(TCteRodoviarioPedagioVO);

end.
