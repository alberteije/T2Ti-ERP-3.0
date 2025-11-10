{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PRE_VENDA_CABECALHO] 
                                                                                
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
unit PreVendaCabecalhoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  PreVendaDetalheVO;

type
  TPreVendaCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FID_PESSOA: Integer;
    FDATA_EMISSAO: TDateTime;
    FHORA_EMISSAO: String;
    FSITUACAO: String;
    FCCF: Integer;
    FVALOR: Extended;
    FNOME_DESTINATARIO: String;
    FCPF_CNPJ_DESTINATARIO: String;
    FSUBTOTAL: Extended;
    FDESCONTO: Extended;
    FACRESCIMO: Extended;
    FTAXA_ACRESCIMO: Extended;
    FTAXA_DESCONTO: Extended;

    FListaPreVendaDetalheVO: TListaPreVendaDetalheVO;

  published 
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    property HoraEmissao: String  read FHORA_EMISSAO write FHORA_EMISSAO;
    property Situacao: String  read FSITUACAO write FSITUACAO;
    property Ccf: Integer  read FCCF write FCCF;
    property NomeDestinatario: String  read FNOME_DESTINATARIO write FNOME_DESTINATARIO;
    property CpfCnpjDestinatario: String  read FCPF_CNPJ_DESTINATARIO write FCPF_CNPJ_DESTINATARIO;
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    property Desconto: Extended  read FDESCONTO write FDESCONTO;
    property Subtotal: Extended  read FSUBTOTAL write FSUBTOTAL;
    property Valor: Extended  read FVALOR write FVALOR;
    property Acrescimo: Extended  read FACRESCIMO write FACRESCIMO;
    property TaxaAcrescimo: Extended  read FTAXA_ACRESCIMO write FTAXA_ACRESCIMO;

    property ListaPreVendaDetalheVO: TListaPreVendaDetalheVO read FListaPreVendaDetalheVO write FListaPreVendaDetalheVO;

  end;

  TListaPreVendaCabecalhoVO = specialize TFPGObjectList<TPreVendaCabecalhoVO>;

implementation

constructor TPreVendaCabecalhoVO.Create;
begin
  inherited;
  FListaPreVendaDetalheVO := TListaPreVendaDetalheVO.Create;
end;

destructor TPreVendaCabecalhoVO.Destroy;
begin
  FreeAndNil(FListaPreVendaDetalheVO);
  inherited;
end;


initialization
  Classes.RegisterClass(TPreVendaCabecalhoVO);

finalization
  Classes.UnRegisterClass(TPreVendaCabecalhoVO);

end.
