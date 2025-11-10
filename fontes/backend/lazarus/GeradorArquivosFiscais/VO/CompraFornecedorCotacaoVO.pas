{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [COMPRA_FORNECEDOR_COTACAO] 
                                                                                
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
unit CompraFornecedorCotacaoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ViewPessoaFornecedorVO, CompraCotacaoDetalheVO;

type
  TCompraFornecedorCotacaoVO = class(TVO)
  private
    FID: Integer;
    FID_COMPRA_COTACAO: Integer;
    FID_FORNECEDOR: Integer;
    FPRAZO_ENTREGA: String;
    FCONDICOES_PAGAMENTO: String;
    FVALOR_SUBTOTAL: Extended;
    FTAXA_DESCONTO: Extended;
    FVALOR_DESCONTO: Extended;
    FTOTAL: Extended;

    //Transientes
    FFornecedorNome: String;

    FFornecedorVO: TViewPessoaFornecedorVO;

    FListaCompraCotacaoDetalhe: TListaCompraCotacaoDetalheVO;

  published 
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdCompraCotacao: Integer  read FID_COMPRA_COTACAO write FID_COMPRA_COTACAO;

    property IdFornecedor: Integer  read FID_FORNECEDOR write FID_FORNECEDOR;
    property FornecedorNome: String read FFornecedorNome write FFornecedorNome;

    property PrazoEntrega: String  read FPRAZO_ENTREGA write FPRAZO_ENTREGA;
    property CondicoesPagamento: String  read FCONDICOES_PAGAMENTO write FCONDICOES_PAGAMENTO;
    property ValorSubtotal: Extended  read FVALOR_SUBTOTAL write FVALOR_SUBTOTAL;
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    property Total: Extended  read FTOTAL write FTOTAL;

    //Transientes
    property FornecedorVO: TViewPessoaFornecedorVO read FFornecedorVO write FFornecedorVO;

    property ListaCompraCotacaoDetalhe: TListaCompraCotacaoDetalheVO read FListaCompraCotacaoDetalhe write FListaCompraCotacaoDetalhe;

  end;

  TListaCompraFornecedorCotacaoVO = specialize TFPGObjectList<TCompraFornecedorCotacaoVO>;

implementation

constructor TCompraFornecedorCotacaoVO.Create;
begin
  inherited;

  FFornecedorVO := TViewPessoaFornecedorVO.Create;

  FListaCompraCotacaoDetalhe := TListaCompraCotacaoDetalheVO.Create;
end;

destructor TCompraFornecedorCotacaoVO.Destroy;
begin
  FreeAndNil(FFornecedorVO);

  FreeAndNil(FListaCompraCotacaoDetalhe);

  inherited;
end;


initialization
  Classes.RegisterClass(TCompraFornecedorCotacaoVO);

finalization
  Classes.UnRegisterClass(TCompraFornecedorCotacaoVO);

end.
