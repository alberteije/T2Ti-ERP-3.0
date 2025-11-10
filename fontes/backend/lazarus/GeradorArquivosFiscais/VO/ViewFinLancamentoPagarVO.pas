{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_FIN_LANCAMENTO_PAGAR] 
                                                                                
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
unit ViewFinLancamentoPagarVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TViewFinLancamentoPagarVO = class(TVO)
  private
    FEmitirCheque: String;
    FID: Integer;
    FID_LANCAMENTO_PAGAR: Integer;
    FQUANTIDADE_PARCELA: Integer;
    FVALOR_LANCAMENTO: Extended;
    FDATA_LANCAMENTO: TDateTime;
    FNUMERO_DOCUMENTO: String;
    FID_PARCELA_PAGAR: Integer;
    FNUMERO_PARCELA: Integer;
    FDATA_VENCIMENTO: TDateTime;
    FVALOR_PARCELA: Extended;
    FTAXA_JURO: Extended;
    FVALOR_JURO: Extended;
    FTAXA_MULTA: Extended;
    FVALOR_MULTA: Extended;
    FTAXA_DESCONTO: Extended;
    FVALOR_DESCONTO: Extended;
    FSIGLA_DOCUMENTO: String;
    FNOME_FORNECEDOR: String;
    FID_STATUS_PARCELA: Integer;
    FSITUACAO_PARCELA: String;
    FDESCRICAO_SITUACAO_PARCELA: String;
    FID_CONTA_CAIXA: Integer;
    FNOME_CONTA_CAIXA: String;
    FFORNECEDOR_SOFRE_RETENCAO: String;

    //Transientes



  published
    property EmitirCheque: String  read FEmitirCheque write FEmitirCheque;

    property Id: Integer  read FID write FID;
    property IdLancamentoPagar: Integer  read FID_LANCAMENTO_PAGAR write FID_LANCAMENTO_PAGAR;
    property QuantidadeParcela: Integer  read FQUANTIDADE_PARCELA write FQUANTIDADE_PARCELA;
    property ValorLancamento: Extended  read FVALOR_LANCAMENTO write FVALOR_LANCAMENTO;
    property DataLancamento: TDateTime  read FDATA_LANCAMENTO write FDATA_LANCAMENTO;
    property NumeroDocumento: String  read FNUMERO_DOCUMENTO write FNUMERO_DOCUMENTO;
    property IdParcelaPagar: Integer  read FID_PARCELA_PAGAR write FID_PARCELA_PAGAR;
    property NumeroParcela: Integer  read FNUMERO_PARCELA write FNUMERO_PARCELA;
    property DataVencimento: TDateTime  read FDATA_VENCIMENTO write FDATA_VENCIMENTO;
    property ValorParcela: Extended  read FVALOR_PARCELA write FVALOR_PARCELA;
    property TaxaJuro: Extended  read FTAXA_JURO write FTAXA_JURO;
    property ValorJuro: Extended  read FVALOR_JURO write FVALOR_JURO;
    property TaxaMulta: Extended  read FTAXA_MULTA write FTAXA_MULTA;
    property ValorMulta: Extended  read FVALOR_MULTA write FVALOR_MULTA;
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    property SiglaDocumento: String  read FSIGLA_DOCUMENTO write FSIGLA_DOCUMENTO;
    property NomeFornecedor: String  read FNOME_FORNECEDOR write FNOME_FORNECEDOR;
    property IdStatusParcela: Integer  read FID_STATUS_PARCELA write FID_STATUS_PARCELA;
    property SituacaoParcela: String  read FSITUACAO_PARCELA write FSITUACAO_PARCELA;
    property DescricaoSituacaoParcela: String  read FDESCRICAO_SITUACAO_PARCELA write FDESCRICAO_SITUACAO_PARCELA;
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    property NomeContaCaixa: String  read FNOME_CONTA_CAIXA write FNOME_CONTA_CAIXA;
    property FornecedorSofreRetencao: String  read FFORNECEDOR_SOFRE_RETENCAO write FFORNECEDOR_SOFRE_RETENCAO;


    //Transientes



  end;

  TListaViewFinLancamentoPagarVO = specialize TFPGObjectList<TViewFinLancamentoPagarVO>;

implementation


initialization
  Classes.RegisterClass(TViewFinLancamentoPagarVO);

finalization
  Classes.UnRegisterClass(TViewFinLancamentoPagarVO);

end.
