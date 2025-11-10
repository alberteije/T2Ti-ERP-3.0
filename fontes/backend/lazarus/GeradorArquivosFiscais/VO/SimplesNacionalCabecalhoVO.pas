{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [SIMPLES_NACIONAL_CABECALHO] 
                                                                                
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
unit SimplesNacionalCabecalhoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  SimplesNacionalDetalheVO;

type
  TSimplesNacionalCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FVIGENCIA_INICIAL: TDateTime;
    FVIGENCIA_FINAL: TDateTime;
    FANEXO: String;
    FTABELA: String;

    //Transientes
    FListaSimplesNacionalDetalheVO: TListaSimplesNacionalDetalheVO;


  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property VigenciaInicial: TDateTime  read FVIGENCIA_INICIAL write FVIGENCIA_INICIAL;
    property VigenciaFinal: TDateTime  read FVIGENCIA_FINAL write FVIGENCIA_FINAL;
    property Anexo: String  read FANEXO write FANEXO;
    property Tabela: String  read FTABELA write FTABELA;


    //Transientes
    property ListaSimplesNacionalDetalheVO: TListaSimplesNacionalDetalheVO read FListaSimplesNacionalDetalheVO write FListaSimplesNacionalDetalheVO;


  end;

  TListaSimplesNacionalCabecalhoVO = specialize TFPGObjectList<TSimplesNacionalCabecalhoVO>;

implementation

constructor TSimplesNacionalCabecalhoVO.Create;
begin
  inherited;

  FListaSimplesNacionalDetalheVO := TListaSimplesNacionalDetalheVO.Create;
end;

destructor TSimplesNacionalCabecalhoVO.Destroy;
begin
  FreeAndNil(FListaSimplesNacionalDetalheVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TSimplesNacionalCabecalhoVO);

finalization
  Classes.UnRegisterClass(TSimplesNacionalCabecalhoVO);

end.
