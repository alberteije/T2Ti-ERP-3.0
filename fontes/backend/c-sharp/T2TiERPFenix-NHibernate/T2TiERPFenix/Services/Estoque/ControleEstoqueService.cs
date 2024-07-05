/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado ao Controle de Estoque 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2022 T2Ti.COM                                          
                                                                                
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
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************/
using NHibernate;
using System;
using System.Collections.Generic;
using T2TiERPFenix.Models;
using T2TiERPFenix.NHibernate;

namespace T2TiERPFenix.Services
{
    public class ControleEstoqueService
    {
	
        public void AtualizarEstoque(Produto pProduto, decimal pQuantidade, string pTipoAtualizacaoEstoque)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                /*
                 * primeiro vamos ver se o produto existe na base a partir do GTIN
                 * Se existir, vamos atualizar o estoque de acordo com o tipo de atualização
                 * se não existir, vamos inserir o produto com a quantidade definida no objeto do produto
                 */
                NHibernateDAL<Produto> ProdutoDAL = new NHibernateDAL<Produto>(Session);
                Produto produto = ProdutoDAL.SelectObjetoSql<Produto>("from Produto where Gtin = '" + pProduto.Gtin + "'");

                if (produto == null)
                {
                    ProdutoDAL.SaveOrUpdate(pProduto);
                } else
                {
                    String comandoAtualizacao =
                              "update PRODUTO " +
                              "set QUANTIDADE_ESTOQUE = " +
                              "case " +
                              "when QUANTIDADE_ESTOQUE is null then " + pQuantidade.ToString("0.00", System.Globalization.CultureInfo.InvariantCulture) + " ";
                    if (pTipoAtualizacaoEstoque == "D")
                    {
                        comandoAtualizacao += "when QUANTIDADE_ESTOQUE is not null then QUANTIDADE_ESTOQUE - " + pQuantidade.ToString("0.00", System.Globalization.CultureInfo.InvariantCulture) + " ";
                    }
                    else
                    {
                        comandoAtualizacao += "when QUANTIDADE_ESTOQUE is not null then QUANTIDADE_ESTOQUE + " + pQuantidade.ToString("0.00", System.Globalization.CultureInfo.InvariantCulture) + " ";
                    }

                    comandoAtualizacao +=
                            "end " +
                            "where ID = " + produto.Id;

                    new NHibernateDAL<Produto>(Session).ComandoSql(comandoAtualizacao);
                }

                //Session.Flush();
            }
        }

		
    }

}