{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NOTA_FISCAL_TIPO] 
                                                                                
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
unit NotaFiscalTipoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TNotaFiscalTipoVO = class(TVO)
  private
    FID: Integer;
    FID_NOTA_FISCAL_MODELO: Integer;
    FID_EMPRESA: Integer;
    FNOME: String;
    FDESCRICAO: String;
    FSERIE: String;
    FSERIE_SCAN: String;
    FULTIMO_NUMERO: Integer;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdNotaFiscalModelo: Integer  read FID_NOTA_FISCAL_MODELO write FID_NOTA_FISCAL_MODELO;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property Nome: String  read FNOME write FNOME;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property Serie: String  read FSERIE write FSERIE;
    property SerieScan: String  read FSERIE_SCAN write FSERIE_SCAN;
    property UltimoNumero: Integer  read FULTIMO_NUMERO write FULTIMO_NUMERO;


    //Transientes



  end;

  TListaNotaFiscalTipoVO = specialize TFPGObjectList<TNotaFiscalTipoVO>;

implementation


initialization
  Classes.RegisterClass(TNotaFiscalTipoVO);

finalization
  Classes.UnRegisterClass(TNotaFiscalTipoVO);

end.
