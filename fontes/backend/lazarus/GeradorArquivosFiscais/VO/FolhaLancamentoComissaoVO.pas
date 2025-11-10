{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FOLHA_LANCAMENTO_COMISSAO] 
                                                                                
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
unit FolhaLancamentoComissaoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TFolhaLancamentoComissaoVO = class(TVO)
  private
    FID: Integer;
    FID_VENDEDOR: Integer;
    FCOMPETENCIA: String;
    FVENCIMENTO: TDateTime;
    FBASE_CALCULO: Extended;
    FVALOR_COMISSAO: Extended;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdVendedor: Integer  read FID_VENDEDOR write FID_VENDEDOR;
    property Competencia: String  read FCOMPETENCIA write FCOMPETENCIA;
    property Vencimento: TDateTime  read FVENCIMENTO write FVENCIMENTO;
    property BaseCalculo: Extended  read FBASE_CALCULO write FBASE_CALCULO;
    property ValorComissao: Extended  read FVALOR_COMISSAO write FVALOR_COMISSAO;


    //Transientes



  end;

  TListaFolhaLancamentoComissaoVO = specialize TFPGObjectList<TFolhaLancamentoComissaoVO>;

implementation


initialization
  Classes.RegisterClass(TFolhaLancamentoComissaoVO);

finalization
  Classes.UnRegisterClass(TFolhaLancamentoComissaoVO);

end.
