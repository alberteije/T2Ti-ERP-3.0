{*******************************************************************************
Title: T2Ti ERP
Description:  VO  relacionado à tabela [PESSOA]

The MIT License

Copyright: Copyright (C) 2010 T2Ti.COM

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
           t2ti.com@gmail.com</p>

@author Albert Eije (t2ti.com@gmail.com)
@version 1.0
*******************************************************************************}
unit PessoaVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  PessoaFisicaVO, PessoaJuridicaVO, PessoaEnderecoVO, PessoaContatoVO,
  PessoaTelefoneVO;

type
  TPessoaVO = class(TVO)
  private
    FID: Integer;
    FNOME: String;
    FTIPO: String;
    FEMAIL: String;
    FSITE: String;
    FCLIENTE: String;
    FFORNECEDOR: String;
    FCOLABORADOR: String;
    FTRANSPORTADORA: String;

    FListaPessoaContatoVO: TListaPessoaContatoVO;
    FListaPessoaEnderecoVO: TListaPessoaEnderecoVO;
    FListaPessoaTelefoneVO: TListaPessoaTelefoneVO;

    FPessoaFisicaVO: TPessoaFisicaVO;
    FPessoaJuridicaVO: TPessoaJuridicaVO;
  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property Nome: String  read FNOME write FNOME;
    property Tipo: String  read FTIPO write FTIPO;
    property Email: String  read FEMAIL write FEMAIL;
    property Site: String  read FSITE write FSITE;
    property Cliente: String  read FCLIENTE write FCLIENTE;
    property Fornecedor: String  read FFORNECEDOR write FFORNECEDOR;
    property Colaborador: String  read FCOLABORADOR write FCOLABORADOR;
    property Transportadora: String  read FTRANSPORTADORA write FTRANSPORTADORA;

    property PessoaFisicaVO: TPessoaFisicaVO read FPessoaFisicaVO write FPessoaFisicaVO;

    property PessoaJuridicaVO: TPessoaJuridicaVO read FPessoaJuridicaVO write FPessoaJuridicaVO;

    property ListaPessoaContatoVO: TListaPessoaContatoVO read FListaPessoaContatoVO write FListaPessoaContatoVO;

    property ListaPessoaEnderecoVO: TListaPessoaEnderecoVO read FListaPessoaEnderecoVO write FListaPessoaEnderecoVO;

    property ListaPessoaTelefoneVO: TListaPessoaTelefoneVO read FListaPessoaTelefoneVO write FListaPessoaTelefoneVO;
  end;

  TListaPessoaVO = specialize TFPGObjectList<TPessoaVO>;

implementation

{ TPessoaVO }

constructor TPessoaVO.Create;
begin
  inherited;

  FPessoaFisicaVO := TPessoaFisicaVO.Create;
  FPessoaJuridicaVO := TPessoaJuridicaVO.Create;

  FListaPessoaContatoVO := TListaPessoaContatoVO.Create;
  FListaPessoaEnderecoVO := TListaPessoaEnderecoVO.Create;
  FListaPessoaTelefoneVO := TListaPessoaTelefoneVO.Create;
end;

destructor TPessoaVO.Destroy;
begin
  FreeAndNil(FListaPessoaContatoVO);
  FreeAndNil(FListaPessoaEnderecoVO);
  FreeAndNil(FListaPessoaTelefoneVO);

  FreeAndNil(FPessoaFisicaVO);
  FreeAndNil(FPessoaJuridicaVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TPessoaVO);

finalization
  Classes.UnRegisterClass(TPessoaVO);

end.
