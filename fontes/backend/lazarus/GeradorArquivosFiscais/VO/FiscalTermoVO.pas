{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FISCAL_TERMO] 
                                                                                
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
unit FiscalTermoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TFiscalTermoVO = class(TVO)
  private
    FID: Integer;
    FID_FISCAL_LIVRO: Integer;
    FABERTURA_ENCERRAMENTO: String;
    FNUMERO: Integer;
    FPAGINA_INICIAL: Integer;
    FPAGINA_FINAL: Integer;
    FREGISTRADO: String;
    FNUMERO_REGISTRO: String;
    FDATA_DESPACHO: TDateTime;
    FDATA_ABERTURA: TDateTime;
    FDATA_ENCERRAMENTO: TDateTime;
    FESCRITURACAO_INICIO: TDateTime;
    FESCRITURACAO_FIM: TDateTime;
    FTEXTO: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdFiscalLivro: Integer  read FID_FISCAL_LIVRO write FID_FISCAL_LIVRO;
    property AberturaEncerramento: String  read FABERTURA_ENCERRAMENTO write FABERTURA_ENCERRAMENTO;
    property Numero: Integer  read FNUMERO write FNUMERO;
    property PaginaInicial: Integer  read FPAGINA_INICIAL write FPAGINA_INICIAL;
    property PaginaFinal: Integer  read FPAGINA_FINAL write FPAGINA_FINAL;
    property Registrado: String  read FREGISTRADO write FREGISTRADO;
    property NumeroRegistro: String  read FNUMERO_REGISTRO write FNUMERO_REGISTRO;
    property DataDespacho: TDateTime  read FDATA_DESPACHO write FDATA_DESPACHO;
    property DataAbertura: TDateTime  read FDATA_ABERTURA write FDATA_ABERTURA;
    property DataEncerramento: TDateTime  read FDATA_ENCERRAMENTO write FDATA_ENCERRAMENTO;
    property EscrituracaoInicio: TDateTime  read FESCRITURACAO_INICIO write FESCRITURACAO_INICIO;
    property EscrituracaoFim: TDateTime  read FESCRITURACAO_FIM write FESCRITURACAO_FIM;
    property Texto: String  read FTEXTO write FTEXTO;


    //Transientes



  end;

  TListaFiscalTermoVO = specialize TFPGObjectList<TFiscalTermoVO>;

implementation


initialization
  Classes.RegisterClass(TFiscalTermoVO);

finalization
  Classes.UnRegisterClass(TFiscalTermoVO);

end.
