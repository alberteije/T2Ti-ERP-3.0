{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_SPED_C425] 
                                                                                
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
unit ViewSpedC425VO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TViewSpedC425VO = class(TVO)
  private
    FID_ECF_PRODUTO: Integer;
    FDESCRICAO_UNIDADE: String;
    FTOTALIZADOR_PARCIAL: String;
    FDATA_VENDA: TDateTime;
    FSOMA_QUANTIDADE: Extended;
    FSOMA_ITEM: Extended;
    FSOMA_PIS: Extended;
    FSOMA_COFINS: Extended;

  published 
    property IdEcfProduto: Integer  read FID_ECF_PRODUTO write FID_ECF_PRODUTO;
    property DescricaoUnidade: String  read FDESCRICAO_UNIDADE write FDESCRICAO_UNIDADE;
    property TotalizadorParcial: String  read FTOTALIZADOR_PARCIAL write FTOTALIZADOR_PARCIAL;
    property DataVenda: TDateTime  read FDATA_VENDA write FDATA_VENDA;
    property SomaQuantidade: Extended  read FSOMA_QUANTIDADE write FSOMA_QUANTIDADE;
    property SomaItem: Extended  read FSOMA_ITEM write FSOMA_ITEM;
    property SomaPis: Extended  read FSOMA_PIS write FSOMA_PIS;
    property SomaCofins: Extended  read FSOMA_COFINS write FSOMA_COFINS;

  end;

  TListaViewSpedC425VO = specialize TFPGObjectList<TViewSpedC425VO>;

implementation


initialization
  Classes.RegisterClass(TViewSpedC425VO);

finalization
  Classes.UnRegisterClass(TViewSpedC425VO);

end.
