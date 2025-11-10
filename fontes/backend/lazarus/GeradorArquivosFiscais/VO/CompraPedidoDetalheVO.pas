{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [COMPRA_PEDIDO_DETALHE] 
                                                                                
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
unit CompraPedidoDetalheVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ProdutoVO;

type
  TCompraPedidoDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_COMPRA_PEDIDO: Integer;
    FID_PRODUTO: Integer;
    FQUANTIDADE: Extended;
    FVALOR_UNITARIO: Extended;
    FVALOR_SUBTOTAL: Extended;
    FTAXA_DESCONTO: Extended;
    FVALOR_DESCONTO: Extended;
    FVALOR_TOTAL: Extended;
    FCST_CSOSN: String;
    FCFOP: Integer;
    FBASE_CALCULO_ICMS: Extended;
    FVALOR_ICMS: Extended;
    FVALOR_IPI: Extended;
    FALIQUOTA_ICMS: Extended;
    FALIQUOTA_IPI: Extended;

    //Transientes
    FProdutoNome: String;

    FProdutoVO: TProdutoVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdCompraPedido: Integer  read FID_COMPRA_PEDIDO write FID_COMPRA_PEDIDO;

    property IdProduto: Integer  read FID_PRODUTO write FID_PRODUTO;
    property ProdutoNome: String read FProdutoNome write FProdutoNome;

    property Quantidade: Extended  read FQUANTIDADE write FQUANTIDADE;
    property ValorUnitario: Extended  read FVALOR_UNITARIO write FVALOR_UNITARIO;
    property ValorSubtotal: Extended  read FVALOR_SUBTOTAL write FVALOR_SUBTOTAL;
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    property CstCsosn: String  read FCST_CSOSN write FCST_CSOSN;
    property Cfop: Integer  read FCFOP write FCFOP;
    property BaseCalculoIcms: Extended  read FBASE_CALCULO_ICMS write FBASE_CALCULO_ICMS;
    property ValorIcms: Extended  read FVALOR_ICMS write FVALOR_ICMS;
    property ValorIpi: Extended  read FVALOR_IPI write FVALOR_IPI;
    property AliquotaIcms: Extended  read FALIQUOTA_ICMS write FALIQUOTA_ICMS;
    property AliquotaIpi: Extended  read FALIQUOTA_IPI write FALIQUOTA_IPI;

    //Transientes
    property ProdutoVO: TProdutoVO read FProdutoVO write FProdutoVO;


  end;

  TListaCompraPedidoDetalheVO = specialize TFPGObjectList<TCompraPedidoDetalheVO>;

implementation

constructor TCompraPedidoDetalheVO.Create;
begin
  inherited;

  FProdutoVO := TProdutoVO.Create;
end;

destructor TCompraPedidoDetalheVO.Destroy;
begin
  FreeAndNil(FProdutoVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TCompraPedidoDetalheVO);

finalization
  Classes.UnRegisterClass(TCompraPedidoDetalheVO);

end.
