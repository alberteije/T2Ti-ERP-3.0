{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PLANO_CONTA_REF_SPED] 
                                                                                
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
unit PlanoContaRefSpedVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TPlanoContaRefSpedVO = class(TVO)
  private
    FID: Integer;
    FCOD_CTA_REF: String;
    FDESCRICAO: String;
    FORIENTACOES: String;
    FINICIO_VALIDADE: TDateTime;
    FFIM_VALIDADE: TDateTime;
    FTIPO: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property CodCtaRef: String  read FCOD_CTA_REF write FCOD_CTA_REF;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property Orientacoes: String  read FORIENTACOES write FORIENTACOES;
    property InicioValidade: TDateTime  read FINICIO_VALIDADE write FINICIO_VALIDADE;
    property FimValidade: TDateTime  read FFIM_VALIDADE write FFIM_VALIDADE;
    property Tipo: String  read FTIPO write FTIPO;


    //Transientes



  end;

  TListaPlanoContaRefSpedVO = specialize TFPGObjectList<TPlanoContaRefSpedVO>;

implementation


initialization
  Classes.RegisterClass(TPlanoContaRefSpedVO);

finalization
  Classes.UnRegisterClass(TPlanoContaRefSpedVO);

end.
