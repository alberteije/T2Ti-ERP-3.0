{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_DECLARACAO_IMPORTACAO] 
                                                                                
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
unit NfeDeclaracaoImportacaoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL, NfeImportacaoDetalheVO;

type
  TNfeDeclaracaoImportacaoVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FNUMERO_DOCUMENTO: String;
    FDATA_REGISTRO: TDateTime;
    FLOCAL_DESEMBARACO: String;
    FUF_DESEMBARACO: String;
    FDATA_DESEMBARACO: TDateTime;
    FCODIGO_EXPORTADOR: String;
    FVIA_TRANSPORTE: Integer;
    FVALOR_AFRMM: Extended;
    FFORMA_INTERMEDIACAO: Integer;
    FCNPJ: String;
    FUF_TERCEIRO: String;

    FListaNfeImportacaoDetalheVO: TListaNfeImportacaoDetalheVO; //1:100

  published 
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    property NumeroDocumento: String  read FNUMERO_DOCUMENTO write FNUMERO_DOCUMENTO;
    property DataRegistro: TDateTime  read FDATA_REGISTRO write FDATA_REGISTRO;
    property LocalDesembaraco: String  read FLOCAL_DESEMBARACO write FLOCAL_DESEMBARACO;
    property UfDesembaraco: String  read FUF_DESEMBARACO write FUF_DESEMBARACO;
    property DataDesembaraco: TDateTime  read FDATA_DESEMBARACO write FDATA_DESEMBARACO;
    property CodigoExportador: String  read FCODIGO_EXPORTADOR write FCODIGO_EXPORTADOR;
    property ViaTransporte: Integer  read FVIA_TRANSPORTE write FVIA_TRANSPORTE;
    property ValorAfrmm: Extended  read FVALOR_AFRMM write FVALOR_AFRMM;
    property FormaIntermediacao: Integer  read FFORMA_INTERMEDIACAO write FFORMA_INTERMEDIACAO;
    property Cnpj: String  read FCNPJ write FCNPJ;
    property UfTerceiro: String  read FUF_TERCEIRO write FUF_TERCEIRO;

    property ListaNfeImportacaoDetalheVO: TListaNfeImportacaoDetalheVO read FListaNfeImportacaoDetalheVO write FListaNfeImportacaoDetalheVO;

  end;

  TListaNfeDeclaracaoImportacaoVO = specialize TFPGObjectList<TNfeDeclaracaoImportacaoVO>;

implementation

constructor TNfeDeclaracaoImportacaoVO.Create;
begin
  inherited;
  FListaNfeImportacaoDetalheVO := TListaNfeImportacaoDetalheVO.Create;
end;

destructor TNfeDeclaracaoImportacaoVO.Destroy;
begin
  FreeAndNil(FListaNfeImportacaoDetalheVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TNfeDeclaracaoImportacaoVO);

finalization
  Classes.UnRegisterClass(TNfeDeclaracaoImportacaoVO);

end.
