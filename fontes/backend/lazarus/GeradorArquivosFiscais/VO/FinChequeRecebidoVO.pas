{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_CHEQUE_RECEBIDO] 
                                                                                
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
unit FinChequeRecebidoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ContaCaixaVO;

type
  TFinChequeRecebidoVO = class(TVO)
  private
    FID: Integer;
    FID_CONTA_CAIXA: Integer;
    FID_PESSOA: Integer;
    FCPF_CNPJ: String;
    FNOME: String;
    FCODIGO_BANCO: String;
    FCODIGO_AGENCIA: String;
    FCONTA: String;
    FNUMERO: Integer;
    FDATA_EMISSAO: TDateTime;
    FBOM_PARA: TDateTime;
    FDATA_COMPENSACAO: TDateTime;
    FVALOR: Extended;
    FCUSTODIA_DATA: TDateTime;
    FCUSTODIA_TARIFA: Extended;
    FCUSTODIA_COMISSAO: Extended;
    FDESCONTO_CHEQUE: String;
    FDESCONTO_DATA: TDateTime;
    FDESCONTO_TARIFA: Extended;
    FDESCONTO_COMISSAO: Extended;
    FVALOR_RECEBIDO: Extended;

    //Transientes
    FContaCaixaNome: String;

    FContaCaixaVO: TContaCaixaVO;


  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    property ContaCaixaNome: String read FContaCaixaNome write FContaCaixaNome;

    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    property CpfCnpj: String  read FCPF_CNPJ write FCPF_CNPJ;
    property Nome: String  read FNOME write FNOME;
    property CodigoBanco: String  read FCODIGO_BANCO write FCODIGO_BANCO;
    property CodigoAgencia: String  read FCODIGO_AGENCIA write FCODIGO_AGENCIA;
    property Conta: String  read FCONTA write FCONTA;
    property Numero: Integer  read FNUMERO write FNUMERO;
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    property BomPara: TDateTime  read FBOM_PARA write FBOM_PARA;
    property DataCompensacao: TDateTime  read FDATA_COMPENSACAO write FDATA_COMPENSACAO;
    property Valor: Extended  read FVALOR write FVALOR;
    property CustodiaData: TDateTime  read FCUSTODIA_DATA write FCUSTODIA_DATA;
    property CustodiaTarifa: Extended  read FCUSTODIA_TARIFA write FCUSTODIA_TARIFA;
    property CustodiaComissao: Extended  read FCUSTODIA_COMISSAO write FCUSTODIA_COMISSAO;
    property DescontoCheque: String  read FDESCONTO_CHEQUE write FDESCONTO_CHEQUE;
    property DescontoData: TDateTime  read FDESCONTO_DATA write FDESCONTO_DATA;
    property DescontoTarifa: Extended  read FDESCONTO_TARIFA write FDESCONTO_TARIFA;
    property DescontoComissao: Extended  read FDESCONTO_COMISSAO write FDESCONTO_COMISSAO;
    property ValorRecebido: Extended  read FVALOR_RECEBIDO write FVALOR_RECEBIDO;


    //Transientes
    property ContaCaixaVO: TContaCaixaVO read FContaCaixaVO write FContaCaixaVO;


  end;

  TListaFinChequeRecebidoVO = specialize TFPGObjectList<TFinChequeRecebidoVO>;

implementation

constructor TFinChequeRecebidoVO.Create;
begin
  inherited;

  FContaCaixaVO := TContaCaixaVO.Create;
end;

destructor TFinChequeRecebidoVO.Destroy;
begin
  FreeAndNil(FContaCaixaVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TFinChequeRecebidoVO);

finalization
  Classes.UnRegisterClass(TFinChequeRecebidoVO);

end.
