{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PRE_VENDA_DETALHE] 
                                                                                
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
unit PreVendaDetalheVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TPreVendaDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_PRODUTO: Integer;
    FID_PRE_VENDA_CABECALHO: Integer;
    FITEM: Integer;
    FQUANTIDADE: Extended;
    FVALOR_UNITARIO: Extended;
    FVALOR_TOTAL: Extended;
    FCANCELADO: String;
    FGTIN_PRODUTO: String;
    FNOME_PRODUTO: String;
    FUNIDADE_PRODUTO: String;
    FECF_ICMS_ST: String;

    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;

  published 
    property Id: Integer  read FID write FID;
    property IdProduto: Integer  read FID_PRODUTO write FID_PRODUTO;
    property IdPreVendaCabecalho: Integer  read FID_PRE_VENDA_CABECALHO write FID_PRE_VENDA_CABECALHO;
    property Item: Integer  read FITEM write FITEM;
    property Quantidade: Extended  read FQUANTIDADE write FQUANTIDADE;
    property ValorUnitario: Extended  read FVALOR_UNITARIO write FVALOR_UNITARIO;
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    property Cancelado: String  read FCANCELADO write FCANCELADO;
    property GtinProduto: String  read FGTIN_PRODUTO write FGTIN_PRODUTO;
    property NomeProduto: String  read FNOME_PRODUTO write FNOME_PRODUTO;
    property UnidadeProduto: String  read FUNIDADE_PRODUTO write FUNIDADE_PRODUTO;
    property EcfIcmsSt: String  read FECF_ICMS_ST write FECF_ICMS_ST;

    property Persiste: String  read FPersiste write FPersiste;

  end;

  TListaPreVendaDetalheVO = specialize TFPGObjectList<TPreVendaDetalheVO>;

implementation


initialization
  Classes.RegisterClass(TPreVendaDetalheVO);

finalization
  Classes.UnRegisterClass(TPreVendaDetalheVO);

end.
