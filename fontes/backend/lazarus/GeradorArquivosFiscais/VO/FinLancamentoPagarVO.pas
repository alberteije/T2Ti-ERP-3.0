{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_LANCAMENTO_PAGAR] 
                                                                                
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
unit FinLancamentoPagarVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ViewPessoaFornecedorVO, FinParcelaPagarVO, FinDocumentoOrigemVO,
  FinLctoPagarNtFinanceiraVO;

type
  TFinLancamentoPagarVO = class(TVO)
  private
    FMesclarPagamento: String;

    FID: Integer;
    FID_FIN_DOCUMENTO_ORIGEM: Integer;
    FID_FORNECEDOR: Integer;
    FPAGAMENTO_COMPARTILHADO: String;
    FQUANTIDADE_PARCELA: Integer;
    FVALOR_TOTAL: Extended;
    FVALOR_A_PAGAR: Extended;
    FDATA_LANCAMENTO: TDateTime;
    FNUMERO_DOCUMENTO: String;
    FIMAGEM_DOCUMENTO: String;
    FPRIMEIRO_VENCIMENTO: TDateTime;
    FCODIGO_MODULO_LCTO: String;
    FINTERVALO_ENTRE_PARCELAS: Integer;
    FMESCLADO_PARA: Integer;

    //Transientes
    FFornecedorNome: String;
    FDocumentoOrigemSigla: String;

    FFornecedorVO: TViewPessoaFornecedorVO;
    FDocumentoOrigemVO: TFinDocumentoOrigemVO;

    FListaParcelaPagarVO: TListaFinParcelaPagarVO;
    FListaLancPagarNatFinanceiraVO: TListaFinLctoPagarNtFinanceiraVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property MesclarPagamento: String  read FMesclarPagamento write FMesclarPagamento;

    property Id: Integer  read FID write FID;

    property IdFinDocumentoOrigem: Integer  read FID_FIN_DOCUMENTO_ORIGEM write FID_FIN_DOCUMENTO_ORIGEM;
    property DocumentoOrigemSigla: String read FDocumentoOrigemSigla write FDocumentoOrigemSigla;

    property IdFornecedor: Integer  read FID_FORNECEDOR write FID_FORNECEDOR;
    property FornecedorNome: String read FFornecedorNome write FFornecedorNome;

    property PagamentoCompartilhado: String  read FPAGAMENTO_COMPARTILHADO write FPAGAMENTO_COMPARTILHADO;
    property QuantidadeParcela: Integer  read FQUANTIDADE_PARCELA write FQUANTIDADE_PARCELA;
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    property ValorAPagar: Extended  read FVALOR_A_PAGAR write FVALOR_A_PAGAR;
    property DataLancamento: TDateTime  read FDATA_LANCAMENTO write FDATA_LANCAMENTO;
    property NumeroDocumento: String  read FNUMERO_DOCUMENTO write FNUMERO_DOCUMENTO;
    property ImagemDocumento: String  read FIMAGEM_DOCUMENTO write FIMAGEM_DOCUMENTO;
    property PrimeiroVencimento: TDateTime  read FPRIMEIRO_VENCIMENTO write FPRIMEIRO_VENCIMENTO;
    property CodigoModuloLcto: String  read FCODIGO_MODULO_LCTO write FCODIGO_MODULO_LCTO;
    property IntervaloEntreParcelas: Integer  read FINTERVALO_ENTRE_PARCELAS write FINTERVALO_ENTRE_PARCELAS;
    property MescladoPara: Integer  read FMESCLADO_PARA write FMESCLADO_PARA;

    //Transientes
    property FornecedorVO: TViewPessoaFornecedorVO read FFornecedorVO write FFornecedorVO;

    property DocumentoOrigemVO: TFinDocumentoOrigemVO read FDocumentoOrigemVO write FDocumentoOrigemVO;

    property ListaParcelaPagarVO: TListaFinParcelaPagarVO read FListaParcelaPagarVO write FListaParcelaPagarVO;

    property ListaLancPagarNatFinanceiraVO: TListaFinLctoPagarNtFinanceiraVO read FListaLancPagarNatFinanceiraVO write FListaLancPagarNatFinanceiraVO;


  end;

  TListaFinLancamentoPagarVO = specialize TFPGObjectList<TFinLancamentoPagarVO>;

implementation

constructor TFinLancamentoPagarVO.Create;
begin
  inherited;

  FDocumentoOrigemVO := TFinDocumentoOrigemVO.Create;
  FFornecedorVO := TViewPessoaFornecedorVO.Create;

  FListaParcelaPagarVO := TListaFinParcelaPagarVO.Create;
  FListaLancPagarNatFinanceiraVO := TListaFinLctoPagarNtFinanceiraVO.Create;
end;

destructor TFinLancamentoPagarVO.Destroy;
begin
  FreeAndNil(FFornecedorVO);
  FreeAndNil(FDocumentoOrigemVO);

  FreeAndNil(FListaParcelaPagarVO);
  FreeAndNil(FListaLancPagarNatFinanceiraVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TFinLancamentoPagarVO);

finalization
  Classes.UnRegisterClass(TFinLancamentoPagarVO);

end.
