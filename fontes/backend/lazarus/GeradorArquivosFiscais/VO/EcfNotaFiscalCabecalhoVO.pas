{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ECF_NOTA_FISCAL_CABECALHO] 
                                                                                
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
unit EcfNotaFiscalCabecalhoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TEcfNotaFiscalCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FNOME_CAIXA: String;
    FID_GERADO_CAIXA: Integer;
    FID_EMPRESA: Integer;
    FID_ECF_FUNCIONARIO: Integer;
    FID_CLIENTE: Integer;
    FCPF_CNPJ_CLIENTE: String;
    FCFOP: Integer;
    FNUMERO: String;
    FDATA_EMISSAO: TDateTime;
    FHORA_EMISSAO: String;
    FSERIE: String;
    FSUBSERIE: String;
    FTOTAL_PRODUTOS: Extended;
    FTOTAL_NF: Extended;
    FBASE_ICMS: Extended;
    FICMS: Extended;
    FICMS_OUTRAS: Extended;
    FISSQN: Extended;
    FPIS: Extended;
    FCOFINS: Extended;
    FIPI: Extended;
    FTAXA_ACRESCIMO: Extended;
    FACRESCIMO: Extended;
    FACRESCIMO_ITENS: Extended;
    FTAXA_DESCONTO: Extended;
    FDESCONTO: Extended;
    FDESCONTO_ITENS: Extended;
    FCANCELADA: String;
    FTIPO_NOTA: String;
    FDATA_SINCRONIZACAO: TDateTime;
    FHORA_SINCRONIZACAO: String;

  published 
    property Id: Integer  read FID write FID;
    property NomeCaixa: String  read FNOME_CAIXA write FNOME_CAIXA;
    property IdGeradoCaixa: Integer  read FID_GERADO_CAIXA write FID_GERADO_CAIXA;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property IdEcfFuncionario: Integer  read FID_ECF_FUNCIONARIO write FID_ECF_FUNCIONARIO;
    property IdCliente: Integer  read FID_CLIENTE write FID_CLIENTE;
    property CpfCnpjCliente: String  read FCPF_CNPJ_CLIENTE write FCPF_CNPJ_CLIENTE;
    property Cfop: Integer  read FCFOP write FCFOP;
    property Numero: String  read FNUMERO write FNUMERO;
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    property HoraEmissao: String  read FHORA_EMISSAO write FHORA_EMISSAO;
    property Serie: String  read FSERIE write FSERIE;
    property Subserie: String  read FSUBSERIE write FSUBSERIE;
    property TotalProdutos: Extended  read FTOTAL_PRODUTOS write FTOTAL_PRODUTOS;
    property TotalNf: Extended  read FTOTAL_NF write FTOTAL_NF;
    property BaseIcms: Extended  read FBASE_ICMS write FBASE_ICMS;
    property Icms: Extended  read FICMS write FICMS;
    property IcmsOutras: Extended  read FICMS_OUTRAS write FICMS_OUTRAS;
    property Issqn: Extended  read FISSQN write FISSQN;
    property Pis: Extended  read FPIS write FPIS;
    property Cofins: Extended  read FCOFINS write FCOFINS;
    property Ipi: Extended  read FIPI write FIPI;
    property TaxaAcrescimo: Extended  read FTAXA_ACRESCIMO write FTAXA_ACRESCIMO;
    property Acrescimo: Extended  read FACRESCIMO write FACRESCIMO;
    property AcrescimoItens: Extended  read FACRESCIMO_ITENS write FACRESCIMO_ITENS;
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    property Desconto: Extended  read FDESCONTO write FDESCONTO;
    property DescontoItens: Extended  read FDESCONTO_ITENS write FDESCONTO_ITENS;
    property Cancelada: String  read FCANCELADA write FCANCELADA;
    property TipoNota: String  read FTIPO_NOTA write FTIPO_NOTA;
    property DataSincronizacao: TDateTime  read FDATA_SINCRONIZACAO write FDATA_SINCRONIZACAO;
    property HoraSincronizacao: String  read FHORA_SINCRONIZACAO write FHORA_SINCRONIZACAO;

  end;

  TListaEcfNotaFiscalCabecalhoVO = specialize TFPGObjectList<TEcfNotaFiscalCabecalhoVO>;

implementation


initialization
  Classes.RegisterClass(TEcfNotaFiscalCabecalhoVO);

finalization
  Classes.UnRegisterClass(TEcfNotaFiscalCabecalhoVO);

end.
