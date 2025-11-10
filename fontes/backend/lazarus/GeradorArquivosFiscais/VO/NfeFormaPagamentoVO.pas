{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_FORMA_PAGAMENTO] 
                                                                                
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
unit NfeFormaPagamentoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TNfeFormaPagamentoVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FID_NFCE_TIPO_PAGAMENTO: Integer;
    FFORMA: String;
    FVALOR: Extended;
    FCNPJ_OPERADORA_CARTAO: String;
    FBANDEIRA: String;
    FNUMERO_AUTORIZACAO: String;
    FESTORNO: String;

  published 
    property Id: Integer  read FID write FID;
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    property IdNfceTipoPagamento: Integer  read FID_NFCE_TIPO_PAGAMENTO write FID_NFCE_TIPO_PAGAMENTO;
    property Forma: String  read FFORMA write FFORMA;
    property Valor: Extended  read FVALOR write FVALOR;
    property CnpjOperadoraCartao: String  read FCNPJ_OPERADORA_CARTAO write FCNPJ_OPERADORA_CARTAO;
    property Bandeira: String  read FBANDEIRA write FBANDEIRA;
    property NumeroAutorizacao: String  read FNUMERO_AUTORIZACAO write FNUMERO_AUTORIZACAO;
    property Estorno: String  read FESTORNO write FESTORNO;

  end;

  TListaNfeFormaPagamentoVO = specialize TFPGObjectList<TNfeFormaPagamentoVO>;

implementation


initialization
  Classes.RegisterClass(TNfeFormaPagamentoVO);

finalization
  Classes.UnRegisterClass(TNfeFormaPagamentoVO);

end.
