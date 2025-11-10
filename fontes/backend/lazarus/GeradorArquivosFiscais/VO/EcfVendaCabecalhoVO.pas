{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ECF_VENDA_CABECALHO] 
                                                                                
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
unit EcfVendaCabecalhoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TEcfVendaCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FNOME_CAIXA: String;
    FID_GERADO_CAIXA: Integer;
    FID_EMPRESA: Integer;
    FID_CLIENTE: Integer;
    FID_ECF_FUNCIONARIO: Integer;
    FID_ECF_MOVIMENTO: Integer;
    FID_ECF_DAV: Integer;
    FID_ECF_PRE_VENDA_CABECALHO: Integer;
    FSERIE_ECF: String;
    FCFOP: Integer;
    FCOO: Integer;
    FCCF: Integer;
    FDATA_VENDA: TDateTime;
    FHORA_VENDA: String;
    FVALOR_VENDA: Extended;
    FTAXA_DESCONTO: Extended;
    FDESCONTO: Extended;
    FTAXA_ACRESCIMO: Extended;
    FACRESCIMO: Extended;
    FVALOR_FINAL: Extended;
    FVALOR_RECEBIDO: Extended;
    FTROCO: Extended;
    FVALOR_CANCELADO: Extended;
    FTOTAL_PRODUTOS: Extended;
    FTOTAL_DOCUMENTO: Extended;
    FBASE_ICMS: Extended;
    FICMS: Extended;
    FICMS_OUTRAS: Extended;
    FISSQN: Extended;
    FPIS: Extended;
    FCOFINS: Extended;
    FACRESCIMO_ITENS: Extended;
    FDESCONTO_ITENS: Extended;
    FSTATUS_VENDA: String;
    FNOME_CLIENTE: String;
    FCPF_CNPJ_CLIENTE: String;
    FCUPOM_CANCELADO: String;
    FLOGSS: String;
    FDATA_SINCRONIZACAO: TDateTime;
    FHORA_SINCRONIZACAO: String;

  published 
    property Id: Integer  read FID write FID;
    property NomeCaixa: String  read FNOME_CAIXA write FNOME_CAIXA;
    property IdGeradoCaixa: Integer  read FID_GERADO_CAIXA write FID_GERADO_CAIXA;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property IdCliente: Integer  read FID_CLIENTE write FID_CLIENTE;
    property IdEcfFuncionario: Integer  read FID_ECF_FUNCIONARIO write FID_ECF_FUNCIONARIO;
    property IdEcfMovimento: Integer  read FID_ECF_MOVIMENTO write FID_ECF_MOVIMENTO;
    property IdEcfDav: Integer  read FID_ECF_DAV write FID_ECF_DAV;
    property IdEcfPreVendaCabecalho: Integer  read FID_ECF_PRE_VENDA_CABECALHO write FID_ECF_PRE_VENDA_CABECALHO;
    property SerieEcf: String  read FSERIE_ECF write FSERIE_ECF;
    property Cfop: Integer  read FCFOP write FCFOP;
    property Coo: Integer  read FCOO write FCOO;
    property Ccf: Integer  read FCCF write FCCF;
    property DataVenda: TDateTime  read FDATA_VENDA write FDATA_VENDA;
    property HoraVenda: String  read FHORA_VENDA write FHORA_VENDA;
    property ValorVenda: Extended  read FVALOR_VENDA write FVALOR_VENDA;
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    property Desconto: Extended  read FDESCONTO write FDESCONTO;
    property TaxaAcrescimo: Extended  read FTAXA_ACRESCIMO write FTAXA_ACRESCIMO;
    property Acrescimo: Extended  read FACRESCIMO write FACRESCIMO;
    property ValorFinal: Extended  read FVALOR_FINAL write FVALOR_FINAL;
    property ValorRecebido: Extended  read FVALOR_RECEBIDO write FVALOR_RECEBIDO;
    property Troco: Extended  read FTROCO write FTROCO;
    property ValorCancelado: Extended  read FVALOR_CANCELADO write FVALOR_CANCELADO;
    property TotalProdutos: Extended  read FTOTAL_PRODUTOS write FTOTAL_PRODUTOS;
    property TotalDocumento: Extended  read FTOTAL_DOCUMENTO write FTOTAL_DOCUMENTO;
    property BaseIcms: Extended  read FBASE_ICMS write FBASE_ICMS;
    property Icms: Extended  read FICMS write FICMS;
    property IcmsOutras: Extended  read FICMS_OUTRAS write FICMS_OUTRAS;
    property Issqn: Extended  read FISSQN write FISSQN;
    property Pis: Extended  read FPIS write FPIS;
    property Cofins: Extended  read FCOFINS write FCOFINS;
    property AcrescimoItens: Extended  read FACRESCIMO_ITENS write FACRESCIMO_ITENS;
    property DescontoItens: Extended  read FDESCONTO_ITENS write FDESCONTO_ITENS;
    property StatusVenda: String  read FSTATUS_VENDA write FSTATUS_VENDA;
    property NomeCliente: String  read FNOME_CLIENTE write FNOME_CLIENTE;
    property CpfCnpjCliente: String  read FCPF_CNPJ_CLIENTE write FCPF_CNPJ_CLIENTE;
    property CupomCancelado: String  read FCUPOM_CANCELADO write FCUPOM_CANCELADO;
    property Logss: String  read FLOGSS write FLOGSS;
    property DataSincronizacao: TDateTime  read FDATA_SINCRONIZACAO write FDATA_SINCRONIZACAO;
    property HoraSincronizacao: String  read FHORA_SINCRONIZACAO write FHORA_SINCRONIZACAO;

  end;

  TListaEcfVendaCabecalhoVO = specialize TFPGObjectList<TEcfVendaCabecalhoVO>;

implementation


initialization
  Classes.RegisterClass(TEcfVendaCabecalhoVO);

finalization
  Classes.UnRegisterClass(TEcfVendaCabecalhoVO);

end.
