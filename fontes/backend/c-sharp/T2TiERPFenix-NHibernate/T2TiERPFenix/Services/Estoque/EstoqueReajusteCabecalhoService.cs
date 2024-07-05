/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [ESTOQUE_REAJUSTE_CABECALHO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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
    public class EstoqueReajusteCabecalhoService
    {

        public IEnumerable<EstoqueReajusteCabecalho> ConsultarLista()
        {
            IList<EstoqueReajusteCabecalho> Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<EstoqueReajusteCabecalho> DAL = new NHibernateDAL<EstoqueReajusteCabecalho>(Session);
                Resultado = DAL.Select(new EstoqueReajusteCabecalho());
            }
            return Resultado;
        }

        public IEnumerable<EstoqueReajusteCabecalho> ConsultarListaFiltro(Filtro filtro)
        {
            IList<EstoqueReajusteCabecalho> Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                var consultaSql = "from EstoqueReajusteCabecalho where " + filtro.Where;
                NHibernateDAL<EstoqueReajusteCabecalho> DAL = new NHibernateDAL<EstoqueReajusteCabecalho>(Session);
                Resultado = DAL.SelectListaSql<EstoqueReajusteCabecalho>(consultaSql);
            }
            return Resultado;
        }
		
        public EstoqueReajusteCabecalho ConsultarObjeto(int id)
        {
            EstoqueReajusteCabecalho Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<EstoqueReajusteCabecalho> DAL = new NHibernateDAL<EstoqueReajusteCabecalho>(Session);
                Resultado = DAL.SelectId<EstoqueReajusteCabecalho>(id);
            }
            return Resultado;
        }
		
        public void Inserir(EstoqueReajusteCabecalho objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<EstoqueReajusteCabecalho> DAL = new NHibernateDAL<EstoqueReajusteCabecalho>(Session);
                DAL.SaveOrUpdate(objeto);
                AjustarPrecoProdutos(objeto.ListaEstoqueReajusteDetalhe, Session);
                Session.Flush();
            }
        }

        public void Alterar(EstoqueReajusteCabecalho objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<EstoqueReajusteCabecalho> DAL = new NHibernateDAL<EstoqueReajusteCabecalho>(Session);
                DAL.SaveOrUpdate(objeto);
                AjustarPrecoProdutos(objeto.ListaEstoqueReajusteDetalhe, Session);
                Session.Flush();
            }
        }

        public void Excluir(EstoqueReajusteCabecalho objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<EstoqueReajusteCabecalho> DAL = new NHibernateDAL<EstoqueReajusteCabecalho>(Session);
                DAL.Delete(objeto);
                Session.Flush();
            }
        }
        public void FormarPreco(EstoqueReajusteCabecalho objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                AjustarPrecoProdutos(objeto.ListaEstoqueReajusteDetalhe, Session);
                Session.Flush();
            }
        }
        public void AjustarPrecoProdutos(IList<EstoqueReajusteDetalhe> listaEstoqueReajusteDetalhe, ISession Session)
        {
            NHibernateDAL<Produto> ProdutoDAL = new NHibernateDAL<Produto>(Session);
            for (int i = 0; i < listaEstoqueReajusteDetalhe.Count; i++)
            {
                Produto produto = ProdutoDAL.SelectId<Produto>(listaEstoqueReajusteDetalhe[i].Produto.Id.Value);
                produto.ValorVenda = listaEstoqueReajusteDetalhe[i].ValorReajuste;
                ProdutoDAL.Save(produto);
            }
        }
		
    }

}