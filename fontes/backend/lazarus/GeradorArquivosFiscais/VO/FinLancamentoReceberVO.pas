{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_LANCAMENTO_RECEBER] 
                                                                                
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
unit FinLancamentoReceberVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ViewPessoaClienteVO, FinParcelaReceberVO, FinDocumentoOrigemVO,
  FinLctoReceberNtFinanceiraVO;

type
  TFinLancamentoReceberVO = class(TVO)
  private
    FMesclarRecebimento: String;

    FID: Integer;
    FID_FIN_DOCUMENTO_ORIGEM: Integer;
    FID_CLIENTE: Integer;
    FQUANTIDADE_PARCELA: Integer;
    FVALOR_TOTAL: Extended;
    FVALOR_DESCONTO_CONVENIO: Extended;
    FVALOR_A_RECEBER: Extended;
    FDATA_LANCAMENTO: TDateTime;
    FNUMERO_DOCUMENTO: String;
    FPRIMEIRO_VENCIMENTO: TDateTime;
    FTAXA_COMISSAO: Extended;
    FVALOR_COMISSAO: Extended;
    FINTERVALO_ENTRE_PARCELAS: Integer;
    FCODIGO_MODULO_LCTO: String;
    FMESCLADO_PARA: Integer;

    //Transientes
    FClienteNome: String;
    FDocumentoOrigemSigla: String;

    FClienteVO: TViewPessoaClienteVO;
    FDocumentoOrigemVO: TFinDocumentoOrigemVO;

    FListaParcelaReceberVO: TListaFinParcelaReceberVO;
    FListaLancReceberNatFinanceiraVO: TListaFinLctoReceberNtFinanceiraVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property MesclarRecebimento: String  read FMesclarRecebimento write FMesclarRecebimento;

    property Id: Integer  read FID write FID;

    property IdFinDocumentoOrigem: Integer  read FID_FIN_DOCUMENTO_ORIGEM write FID_FIN_DOCUMENTO_ORIGEM;
    property DocumentoOrigemSigla: String read FDocumentoOrigemSigla write FDocumentoOrigemSigla;

    property IdCliente: Integer  read FID_CLIENTE write FID_CLIENTE;
    property ClienteNome: String read FClienteNome write FClienteNome;

    property QuantidadeParcela: Integer  read FQUANTIDADE_PARCELA write FQUANTIDADE_PARCELA;
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    property ValorDescontoConvenio: Extended  read FVALOR_DESCONTO_CONVENIO write FVALOR_DESCONTO_CONVENIO;
    property ValorAReceber: Extended  read FVALOR_A_RECEBER write FVALOR_A_RECEBER;
    property DataLancamento: TDateTime  read FDATA_LANCAMENTO write FDATA_LANCAMENTO;
    property NumeroDocumento: String  read FNUMERO_DOCUMENTO write FNUMERO_DOCUMENTO;
    property PrimeiroVencimento: TDateTime  read FPRIMEIRO_VENCIMENTO write FPRIMEIRO_VENCIMENTO;
    property TaxaComissao: Extended  read FTAXA_COMISSAO write FTAXA_COMISSAO;
    property ValorComissao: Extended  read FVALOR_COMISSAO write FVALOR_COMISSAO;
    property IntervaloEntreParcelas: Integer  read FINTERVALO_ENTRE_PARCELAS write FINTERVALO_ENTRE_PARCELAS;
    property CodigoModuloLcto: String  read FCODIGO_MODULO_LCTO write FCODIGO_MODULO_LCTO;
    property MescladoPara: Integer  read FMESCLADO_PARA write FMESCLADO_PARA;

    //Transientes
    property ClienteVO: TViewPessoaClienteVO read FClienteVO write FClienteVO;

    property DocumentoOrigemVO: TFinDocumentoOrigemVO read FDocumentoOrigemVO write FDocumentoOrigemVO;

    property ListaParcelaReceberVO: TListaFinParcelaReceberVO read FListaParcelaReceberVO write FListaParcelaReceberVO;

    property ListaLancReceberNatFinanceiraVO: TListaFinLctoReceberNtFinanceiraVO read FListaLancReceberNatFinanceiraVO write FListaLancReceberNatFinanceiraVO;

  end;

  TListaFinLancamentoReceberVO = specialize TFPGObjectList<TFinLancamentoReceberVO>;

implementation

constructor TFinLancamentoReceberVO.Create;
begin
  inherited;

  FDocumentoOrigemVO := TFinDocumentoOrigemVO.Create;
  FClienteVO := TViewPessoaClienteVO.Create;

  FListaParcelaReceberVO := TListaFinParcelaReceberVO.Create;
  FListaLancReceberNatFinanceiraVO := TListaFinLctoReceberNtFinanceiraVO.Create;
end;

destructor TFinLancamentoReceberVO.Destroy;
begin
  FreeAndNil(FClienteVO);
  FreeAndNil(FDocumentoOrigemVO);

  FreeAndNil(FListaParcelaReceberVO);
  FreeAndNil(FListaLancReceberNatFinanceiraVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TFinLancamentoReceberVO);

finalization
  Classes.UnRegisterClass(TFinLancamentoReceberVO);

end.
