{*******************************************************************************
Title: T2Ti ERP
Description:  VO  relacionado à tabela [FICHA_TECNICA]

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
unit FichaTecnicaVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TFichaTecnicaVO = class(TVO)
  private
    FID: Integer;
    FID_PRODUTO: Integer;
    FDESCRICAO: String;
    FID_PRODUTO_FILHO: Integer;
    FQUANTIDADE: Extended;
    FSEQUENCIA_PRODUCAO: Integer;

    FPersiste: String;

  published
    property Id: Integer  read FID write FID;
    property IdProduto: Integer  read FID_PRODUTO write FID_PRODUTO;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property IdProdutoFilho: Integer  read FID_PRODUTO_FILHO write FID_PRODUTO_FILHO;
    property Quantidade: Extended  read FQUANTIDADE write FQUANTIDADE;
    property SequenciaProducao: Integer  read FSEQUENCIA_PRODUCAO write FSEQUENCIA_PRODUCAO;

    property Persiste: String  read FPersiste write FPersiste;

  end;

  TListaFichaTecnicaVO = specialize TFPGObjectList<TFichaTecnicaVO>;

implementation

initialization
  Classes.RegisterClass(TFichaTecnicaVO);

finalization
  Classes.UnRegisterClass(TFichaTecnicaVO);

end.

