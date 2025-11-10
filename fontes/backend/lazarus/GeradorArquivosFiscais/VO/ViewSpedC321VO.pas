{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_SPED_C321] 
                                                                                
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
unit ViewSpedC321VO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TViewSpedC321VO = class(TVO)
  private
    FID_PRODUTO: Integer;
    FDESCRICAO_UNIDADE: String;
    FDATA_EMISSAO: TDateTime;
    FSOMA_QUANTIDADE: Extended;
    FSOMA_ITEM: Extended;
    FSOMA_DESCONTO: Extended;
    FSOMA_BASE_ICMS: Extended;
    FSOMA_ICMS: Extended;
    FSOMA_PIS: Extended;
    FSOMA_COFINS: Extended;

  published 
    property IdProduto: Integer  read FID_PRODUTO write FID_PRODUTO;
    property DescricaoUnidade: String  read FDESCRICAO_UNIDADE write FDESCRICAO_UNIDADE;
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    property SomaQuantidade: Extended  read FSOMA_QUANTIDADE write FSOMA_QUANTIDADE;
    property SomaItem: Extended  read FSOMA_ITEM write FSOMA_ITEM;
    property SomaDesconto: Extended  read FSOMA_DESCONTO write FSOMA_DESCONTO;
    property SomaBaseIcms: Extended  read FSOMA_BASE_ICMS write FSOMA_BASE_ICMS;
    property SomaIcms: Extended  read FSOMA_ICMS write FSOMA_ICMS;
    property SomaPis: Extended  read FSOMA_PIS write FSOMA_PIS;
    property SomaCofins: Extended  read FSOMA_COFINS write FSOMA_COFINS;

  end;

  TListaViewSpedC321VO = specialize TFPGObjectList<TViewSpedC321VO>;

implementation


initialization
  Classes.RegisterClass(TViewSpedC321VO);

finalization
  Classes.UnRegisterClass(TViewSpedC321VO);

end.
