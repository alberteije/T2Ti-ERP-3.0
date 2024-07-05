{ *******************************************************************************
Title: T2Ti ERP 3.0
Description: Unit que controla o estoque (incremento e decremento)
The MIT License
Copyright: Copyright (C) 2023 T2Ti.COM
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
@author Albert Eije (T2Ti.COM)
@version 3.0
******************************************************************************* }
unit ControleEstoqueService;
interface
uses
  System.Classes, System.SysUtils, System.Generics.Collections, ServiceBase,
  MVCFramework.DataSet.Utils,
  Produto, ProdutoService;
type
  TControleEstoqueService = class(TServiceBase)
  protected
  public
    class function AtualizarEstoque(pProduto: TProduto; pQuantidade: Extended; pTipoAtualizacaoEstoque: String = ''): Boolean;
  end;

implementation

class function TControleEstoqueService.AtualizarEstoque(pProduto: TProduto; pQuantidade: Extended; pTipoAtualizacaoEstoque: String): Boolean;
var
  ComandoSQL, ComandoAtualizacao: String;
  Produto: TProduto;
begin
  try
    ///  primeiro vamos ver se o produto existe na base a partir do GTIN
    ///  Se existir, vamos atualizar o estoque de acordo com o tipo de atualização
    ///  se não existir, vamos inserir o produto com a quantidade definida no objeto do produto
    ComandoSQL := 'SELECT * FROM PRODUTO WHERE GTIN = ' + QuotedStr(pProduto.Gtin);
    Produto := GetQuery(ComandoSQL).AsObject<TProduto>;
    if not Assigned(Produto) then
    begin
       pProduto.IdTributGrupoTributario := 1;
       TProdutoService.Inserir(pProduto);
    end
    else
    begin
      ComandoAtualizacao :=
                    'update PRODUTO ' +
                    'set QUANTIDADE_ESTOQUE = ' +
                    'case ' +
                    'when QUANTIDADE_ESTOQUE is null then ' + FloatToStr(pQuantidade) + ' ';
      if pTipoAtualizacaoEstoque = 'D' then
        ComandoAtualizacao := ComandoAtualizacao + 'when QUANTIDADE_ESTOQUE is not null then QUANTIDADE_ESTOQUE - ' + FloatToStr(pQuantidade) + ' '
      else
        ComandoAtualizacao := ComandoAtualizacao + 'when QUANTIDADE_ESTOQUE is not null then QUANTIDADE_ESTOQUE + ' + FloatToStr(pQuantidade) + ' ';

      ComandoAtualizacao := ComandoAtualizacao +
          'end ' +
          'where ID = ' + IntToStr(Produto.Id);
      ExecutarConsulta(ComandoAtualizacao);
    end;
  finally
  end;
end;

end.
