{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ETIQUETA_LAYOUT] 
                                                                                
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
unit EtiquetaLayoutVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TEtiquetaLayoutVO = class(TVO)
  private
    FID: Integer;
    FID_FORMATO_PAPEL: Integer;
    FCODIGO_FABRICANTE: String;
    FQUANTIDADE: Integer;
    FQUANTIDADE_HORIZONTAL: Integer;
    FQUANTIDADE_VERTICAL: Integer;
    FMARGEM_SUPERIOR: Integer;
    FMARGEM_INFERIOR: Integer;
    FMARGEM_ESQUERDA: Integer;
    FMARGEM_DIREITA: Integer;
    FESPACAMENTO_HORIZONTAL: Integer;
    FESPACAMENTO_VERTICAL: Integer;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdFormatoPapel: Integer  read FID_FORMATO_PAPEL write FID_FORMATO_PAPEL;
    property CodigoFabricante: String  read FCODIGO_FABRICANTE write FCODIGO_FABRICANTE;
    property Quantidade: Integer  read FQUANTIDADE write FQUANTIDADE;
    property QuantidadeHorizontal: Integer  read FQUANTIDADE_HORIZONTAL write FQUANTIDADE_HORIZONTAL;
    property QuantidadeVertical: Integer  read FQUANTIDADE_VERTICAL write FQUANTIDADE_VERTICAL;
    property MargemSuperior: Integer  read FMARGEM_SUPERIOR write FMARGEM_SUPERIOR;
    property MargemInferior: Integer  read FMARGEM_INFERIOR write FMARGEM_INFERIOR;
    property MargemEsquerda: Integer  read FMARGEM_ESQUERDA write FMARGEM_ESQUERDA;
    property MargemDireita: Integer  read FMARGEM_DIREITA write FMARGEM_DIREITA;
    property EspacamentoHorizontal: Integer  read FESPACAMENTO_HORIZONTAL write FESPACAMENTO_HORIZONTAL;
    property EspacamentoVertical: Integer  read FESPACAMENTO_VERTICAL write FESPACAMENTO_VERTICAL;


    //Transientes



  end;

  TListaEtiquetaLayoutVO = specialize TFPGObjectList<TEtiquetaLayoutVO>;

implementation


initialization
  Classes.RegisterClass(TEtiquetaLayoutVO);

finalization
  Classes.UnRegisterClass(TEtiquetaLayoutVO);

end.
