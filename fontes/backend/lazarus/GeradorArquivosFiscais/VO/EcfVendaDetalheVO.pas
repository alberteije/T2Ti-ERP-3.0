{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ECF_VENDA_DETALHE] 
                                                                                
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
unit EcfVendaDetalheVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TEcfVendaDetalheVO = class(TVO)
  private
    FID: Integer;
    FNOME_CAIXA: String;
    FID_GERADO_CAIXA: Integer;
    FID_EMPRESA: Integer;
    FID_ECF_PRODUTO: Integer;
    FID_ECF_VENDA_CABECALHO: Integer;
    FCFOP: Integer;
    FGTIN: String;
    FCCF: Integer;
    FCOO: Integer;
    FSERIE_ECF: String;
    FITEM: Integer;
    FQUANTIDADE: Extended;
    FVALOR_UNITARIO: Extended;
    FVALOR_TOTAL: Extended;
    FTOTAL_ITEM: Extended;
    FBASE_ICMS: Extended;
    FTAXA_ICMS: Extended;
    FICMS: Extended;
    FTAXA_DESCONTO: Extended;
    FDESCONTO: Extended;
    FTAXA_ISSQN: Extended;
    FISSQN: Extended;
    FTAXA_PIS: Extended;
    FPIS: Extended;
    FTAXA_COFINS: Extended;
    FCOFINS: Extended;
    FTAXA_ACRESCIMO: Extended;
    FACRESCIMO: Extended;
    FACRESCIMO_RATEIO: Extended;
    FDESCONTO_RATEIO: Extended;
    FTOTALIZADOR_PARCIAL: String;
    FCST: String;
    FCANCELADO: String;
    FMOVIMENTA_ESTOQUE: String;
    FECF_ICMS_ST: String;
    FLOGSS: String;
    FDATA_SINCRONIZACAO: TDateTime;
    FHORA_SINCRONIZACAO: String;

  published 
    property Id: Integer  read FID write FID;
    property NomeCaixa: String  read FNOME_CAIXA write FNOME_CAIXA;
    property IdGeradoCaixa: Integer  read FID_GERADO_CAIXA write FID_GERADO_CAIXA;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property IdEcfProduto: Integer  read FID_ECF_PRODUTO write FID_ECF_PRODUTO;
    property IdEcfVendaCabecalho: Integer  read FID_ECF_VENDA_CABECALHO write FID_ECF_VENDA_CABECALHO;
    property Cfop: Integer  read FCFOP write FCFOP;
    property Gtin: String  read FGTIN write FGTIN;
    property Ccf: Integer  read FCCF write FCCF;
    property Coo: Integer  read FCOO write FCOO;
    property SerieEcf: String  read FSERIE_ECF write FSERIE_ECF;
    property Item: Integer  read FITEM write FITEM;
    property Quantidade: Extended  read FQUANTIDADE write FQUANTIDADE;
    property ValorUnitario: Extended  read FVALOR_UNITARIO write FVALOR_UNITARIO;
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    property TotalItem: Extended  read FTOTAL_ITEM write FTOTAL_ITEM;
    property BaseIcms: Extended  read FBASE_ICMS write FBASE_ICMS;
    property TaxaIcms: Extended  read FTAXA_ICMS write FTAXA_ICMS;
    property Icms: Extended  read FICMS write FICMS;
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    property Desconto: Extended  read FDESCONTO write FDESCONTO;
    property TaxaIssqn: Extended  read FTAXA_ISSQN write FTAXA_ISSQN;
    property Issqn: Extended  read FISSQN write FISSQN;
    property TaxaPis: Extended  read FTAXA_PIS write FTAXA_PIS;
    property Pis: Extended  read FPIS write FPIS;
    property TaxaCofins: Extended  read FTAXA_COFINS write FTAXA_COFINS;
    property Cofins: Extended  read FCOFINS write FCOFINS;
    property TaxaAcrescimo: Extended  read FTAXA_ACRESCIMO write FTAXA_ACRESCIMO;
    property Acrescimo: Extended  read FACRESCIMO write FACRESCIMO;
    property AcrescimoRateio: Extended  read FACRESCIMO_RATEIO write FACRESCIMO_RATEIO;
    property DescontoRateio: Extended  read FDESCONTO_RATEIO write FDESCONTO_RATEIO;
    property TotalizadorParcial: String  read FTOTALIZADOR_PARCIAL write FTOTALIZADOR_PARCIAL;
    property Cst: String  read FCST write FCST;
    property Cancelado: String  read FCANCELADO write FCANCELADO;
    property MovimentaEstoque: String  read FMOVIMENTA_ESTOQUE write FMOVIMENTA_ESTOQUE;
    property EcfIcmsSt: String  read FECF_ICMS_ST write FECF_ICMS_ST;
    property Logss: String  read FLOGSS write FLOGSS;
    property DataSincronizacao: TDateTime  read FDATA_SINCRONIZACAO write FDATA_SINCRONIZACAO;
    property HoraSincronizacao: String  read FHORA_SINCRONIZACAO write FHORA_SINCRONIZACAO;

  end;

  TListaEcfVendaDetalheVO = specialize TFPGObjectList<TEcfVendaDetalheVO>;

implementation


initialization
  Classes.RegisterClass(TEcfVendaDetalheVO);

finalization
  Classes.UnRegisterClass(TEcfVendaDetalheVO);

end.
