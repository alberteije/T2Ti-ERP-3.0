{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PATRIM_APOLICE_SEGURO] 
                                                                                
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
unit PatrimApoliceSeguroVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  PatrimBemVO, SeguradoraVO;

type
  TPatrimApoliceSeguroVO = class(TVO)
  private
    FID: Integer;
    FID_PATRIM_BEM: Integer;
    FID_SEGURADORA: Integer;
    FNUMERO: String;
    FDATA_CONTRATACAO: TDateTime;
    FDATA_VENCIMENTO: TDateTime;
    FVALOR_PREMIO: Extended;
    FVALOR_SEGURADO: Extended;
    FOBSERVACAO: String;
    FIMAGEM: String;

    //Transientes
    FPatrimBemNome: String;
    FSeguradoraNome: String;

    FPatrimBemVO: TPatrimBemVO;
    FSeguradoraVO: TSeguradoraVO;


  published 
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdPatrimBem: Integer  read FID_PATRIM_BEM write FID_PATRIM_BEM;
    property PatrimBemNome: String read FPatrimBemNome write FPatrimBemNome;

    property IdSeguradora: Integer  read FID_SEGURADORA write FID_SEGURADORA;
    property SeguradoraNome: String read FSeguradoraNome write FSeguradoraNome;

    property Numero: String  read FNUMERO write FNUMERO;
    property DataContratacao: TDateTime  read FDATA_CONTRATACAO write FDATA_CONTRATACAO;
    property DataVencimento: TDateTime  read FDATA_VENCIMENTO write FDATA_VENCIMENTO;
    property ValorPremio: Extended  read FVALOR_PREMIO write FVALOR_PREMIO;
    property ValorSegurado: Extended  read FVALOR_SEGURADO write FVALOR_SEGURADO;
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;
    property Imagem: String  read FIMAGEM write FIMAGEM;


    //Transientes
    property PatrimBemVO: TPatrimBemVO read FPatrimBemVO write FPatrimBemVO;

    property SeguradoraVO: TSeguradoraVO read FSeguradoraVO write FSeguradoraVO;

  end;

  TListaPatrimApoliceSeguroVO = specialize TFPGObjectList<TPatrimApoliceSeguroVO>;

implementation

constructor TPatrimApoliceSeguroVO.Create;
begin
  inherited;

  FPatrimBemVO := TPatrimBemVO.Create;
  FSeguradoraVO := TSeguradoraVO.Create;
end;

destructor TPatrimApoliceSeguroVO.Destroy;
begin
  FreeAndNil(FPatrimBemVO);
  FreeAndNil(FSeguradoraVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TPatrimApoliceSeguroVO);

finalization
  Classes.UnRegisterClass(TPatrimApoliceSeguroVO);

end.
