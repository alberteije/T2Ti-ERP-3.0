{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [OS_PRODUTO_SERVICO] 
                                                                                
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
unit OsProdutoServicoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TOsProdutoServicoVO = class(TVO)
  private
    FID: Integer;
    FID_PRODUTO: Integer;
    FID_OS_ABERTURA: Integer;
    FTIPO: Integer;
    FCOMPLEMENTO: String;
    FQUANTIDADE: Extended;
    FVALOR_UNITARIO: Extended;
    FVALOR_SUBTOTAL: Extended;
    FTAXA_DESCONTO: Extended;
    FVALOR_DESCONTO: Extended;
    FVALOR_TOTAL: Extended;

    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;



  published 
    property Id: Integer  read FID write FID;
    property IdProduto: Integer  read FID_PRODUTO write FID_PRODUTO;
    property IdOsAbertura: Integer  read FID_OS_ABERTURA write FID_OS_ABERTURA;
    property Tipo: Integer  read FTIPO write FTIPO;
    property Complemento: String  read FCOMPLEMENTO write FCOMPLEMENTO;
    property Quantidade: Extended  read FQUANTIDADE write FQUANTIDADE;
    property ValorUnitario: Extended  read FVALOR_UNITARIO write FVALOR_UNITARIO;
    property ValorSubtotal: Extended  read FVALOR_SUBTOTAL write FVALOR_SUBTOTAL;
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;


    //Transientes
    property Persiste: String  read FPersiste write FPersiste;



  end;

  TListaOsProdutoServicoVO = specialize TFPGObjectList<TOsProdutoServicoVO>;

implementation


initialization
  Classes.RegisterClass(TOsProdutoServicoVO);

finalization
  Classes.UnRegisterClass(TOsProdutoServicoVO);

end.
