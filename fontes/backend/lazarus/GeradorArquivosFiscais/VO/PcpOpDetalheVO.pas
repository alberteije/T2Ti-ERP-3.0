{*******************************************************************************
Title: T2Ti ERP
Description:  VO  relacionado à tabela [PCP_OP_DETALHE]

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
unit PcpOpDetalheVO;

{$mode objfpc}{$H+}

interface

uses
  VO, ProdutoVO, PcpServicoVO, Classes, SysUtils, FGL;

type
  TPcpOpDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_PRODUTO: Integer;
    FID_PCP_OP_CABECALHO: Integer;
    FQUANTIDADE_PRODUZIR: Extended;
    FQUANTIDADE_PRODUZIDA: Extended;
    FQUANTIDADE_ENTREGUE: Extended;
    FCUSTO_PREVISTO: Extended;
    FCUSTO_REALIZADO: Extended;

    FProdutoNome: string;
    FProdutoUnidade: string;
    FProduto: TProdutoVO;

    FListaPcpServicoVO: TListaPcpServicoVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdProduto: Integer  read FID_PRODUTO write FID_PRODUTO;
    property IdPcpOpCabecalho: Integer  read FID_PCP_OP_CABECALHO write FID_PCP_OP_CABECALHO;
    property QuantidadeProduzir: Extended  read FQUANTIDADE_PRODUZIR write FQUANTIDADE_PRODUZIR;
    property QuantidadeProduzida: Extended  read FQUANTIDADE_PRODUZIDA write FQUANTIDADE_PRODUZIDA;
    property QuantidadeEntregue: Extended  read FQUANTIDADE_ENTREGUE write FQUANTIDADE_ENTREGUE;
    property CustoPrevisto: Extended  read FCUSTO_PREVISTO write FCUSTO_PREVISTO;
    property CustoRealizado: Extended  read FCUSTO_REALIZADO write FCUSTO_REALIZADO;

    property ProdutoNome: string  read FProdutoNome write FProdutoNome;
    property ProdutoUnidade: string  read FProdutoUnidade write FProdutoUnidade;

    property Produto: TProdutoVO read FProduto write FProduto;

    property ListaPcpServicoVO: TListaPcpServicoVO read FListaPcpServicoVO write FListaPcpServicoVO;

  end;

  TListaPcpOpDetalheVO = specialize TFPGObjectList<TPcpOpDetalheVO>;

implementation

{ TPcpOpDetalheVO }

constructor TPcpOpDetalheVO.Create;
begin
  inherited;
  FProduto := TProdutoVO.Create;
  FListaPcpServicoVO := TListaPcpServicoVO.Create;
end;

destructor TPcpOpDetalheVO.Destroy;
begin
  FreeAndNil(FProduto);
  FreeAndNil(FListaPcpServicoVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TPcpOpDetalheVO);

finalization
  Classes.UnRegisterClass(TPcpOpDetalheVO);

end.

