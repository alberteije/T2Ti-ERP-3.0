{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_SPED_NFE_ITEM] 
                                                                                
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
unit ViewSpedNfeItemVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TViewSpedNfeItemVO = class(TVO)
  private
    FID: Integer;
    FNOME: String;
    FGTIN: String;
    FID_UNIDADE_PRODUTO: Integer;
    FSIGLA: String;
    FTIPO_ITEM_SPED: String;
    FNCM: String;
    FEX_TIPI: String;
    FCODIGO_LST: String;
    FALIQUOTA_ICMS_PAF: Extended;

  published 
    property Id: Integer  read FID write FID;
    property Nome: String  read FNOME write FNOME;
    property Gtin: String  read FGTIN write FGTIN;
    property IdUnidadeProduto: Integer  read FID_UNIDADE_PRODUTO write FID_UNIDADE_PRODUTO;
    property Sigla: String  read FSIGLA write FSIGLA;
    property TipoItemSped: String  read FTIPO_ITEM_SPED write FTIPO_ITEM_SPED;
    property Ncm: String  read FNCM write FNCM;
    property ExTipi: String  read FEX_TIPI write FEX_TIPI;
    property CodigoLst: String  read FCODIGO_LST write FCODIGO_LST;
    property AliquotaIcmsPaf: Extended  read FALIQUOTA_ICMS_PAF write FALIQUOTA_ICMS_PAF;

  end;

  TListaViewSpedNfeItemVO = specialize TFPGObjectList<TViewSpedNfeItemVO>;

implementation


initialization
  Classes.RegisterClass(TViewSpedNfeItemVO);

finalization
  Classes.UnRegisterClass(TViewSpedNfeItemVO);

end.
