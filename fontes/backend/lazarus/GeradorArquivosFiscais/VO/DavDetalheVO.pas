{*******************************************************************************
Title: T2Ti ERP
Description:  VO  relacionado à tabela [DAV_DETALHE]

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
unit DavDetalheVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  DavDetalheAlteracaoVO;

type
  TDavDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_PRODUTO: Integer;
    FID_DAV_CABECALHO: Integer;
    FNUMERO_DAV: String;
    FDATA_EMISSAO: TDateTime;
    FITEM: Integer;
    FQUANTIDADE: Extended;
    FVALOR_UNITARIO: Extended;
    FVALOR_TOTAL: Extended;
    FCANCELADO: String;
    FMESCLA_PRODUTO: String;
    FGTIN_PRODUTO: String;
    FNOME_PRODUTO: String;
    FUNIDADE_PRODUTO: String;
    FTOTALIZADOR_PARCIAL: String;
    FLOGSS: String;

    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;

    FListaDavDetalheAlteracaoVO: TListaDavDetalheAlteracaoVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdProduto: Integer  read FID_PRODUTO write FID_PRODUTO;
    property IdDavCabecalho: Integer  read FID_DAV_CABECALHO write FID_DAV_CABECALHO;
    property NumeroDav: String  read FNUMERO_DAV write FNUMERO_DAV;
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    property Item: Integer  read FITEM write FITEM;
    property Quantidade: Extended  read FQUANTIDADE write FQUANTIDADE;
    property ValorUnitario: Extended  read FVALOR_UNITARIO write FVALOR_UNITARIO;
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    property Cancelado: String  read FCANCELADO write FCANCELADO;
    property MesclaProduto: String  read FMESCLA_PRODUTO write FMESCLA_PRODUTO;
    property GtinProduto: String  read FGTIN_PRODUTO write FGTIN_PRODUTO;
    property NomeProduto: String  read FNOME_PRODUTO write FNOME_PRODUTO;
    property UnidadeProduto: String  read FUNIDADE_PRODUTO write FUNIDADE_PRODUTO;
    property TotalizadorParcial: String  read FTOTALIZADOR_PARCIAL write FTOTALIZADOR_PARCIAL;
    property HashRegistro: String  read FLOGSS write FLOGSS;

    property Persiste: String  read FPersiste write FPersiste;

    property ListaDavDetalheAlteracaoVO: TListaDavDetalheAlteracaoVO read FListaDavDetalheAlteracaoVO write FListaDavDetalheAlteracaoVO;

  end;

  TListaDavDetalheVO = specialize TFPGObjectList<TDavDetalheVO>;

implementation

constructor TDavDetalheVO.Create;
begin
  inherited;
  FListaDavDetalheAlteracaoVO := TListaDavDetalheAlteracaoVO.Create;
end;

destructor TDavDetalheVO.Destroy;
begin
  FreeAndNil(FListaDavDetalheAlteracaoVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TDavDetalheVO);

finalization
  Classes.UnRegisterClass(TDavDetalheVO);

end.
