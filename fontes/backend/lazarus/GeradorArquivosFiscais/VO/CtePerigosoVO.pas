{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CTE_PERIGOSO] 
                                                                                
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
unit CtePerigosoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TCtePerigosoVO = class(TVO)
  private
    FID: Integer;
    FID_CTE_CABECALHO: Integer;
    FNUMERO_ONU: String;
    FNOME_APROPRIADO: String;
    FCLASSE_RISCO: String;
    FGRUPO_EMBALAGEM: String;
    FQUANTIDADE_TOTAL_PRODUTO: String;
    FQUANTIDADE_TIPO_VOLUME: String;
    FPONTO_FULGOR: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdCteCabecalho: Integer  read FID_CTE_CABECALHO write FID_CTE_CABECALHO;
    property NumeroOnu: String  read FNUMERO_ONU write FNUMERO_ONU;
    property NomeApropriado: String  read FNOME_APROPRIADO write FNOME_APROPRIADO;
    property ClasseRisco: String  read FCLASSE_RISCO write FCLASSE_RISCO;
    property GrupoEmbalagem: String  read FGRUPO_EMBALAGEM write FGRUPO_EMBALAGEM;
    property QuantidadeTotalProduto: String  read FQUANTIDADE_TOTAL_PRODUTO write FQUANTIDADE_TOTAL_PRODUTO;
    property QuantidadeTipoVolume: String  read FQUANTIDADE_TIPO_VOLUME write FQUANTIDADE_TIPO_VOLUME;
    property PontoFulgor: String  read FPONTO_FULGOR write FPONTO_FULGOR;


    //Transientes



  end;

  TListaCtePerigosoVO = specialize TFPGObjectList<TCtePerigosoVO>;

implementation


initialization
  Classes.RegisterClass(TCtePerigosoVO);

finalization
  Classes.UnRegisterClass(TCtePerigosoVO);

end.
