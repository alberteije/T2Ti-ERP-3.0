/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [PRODUTO_SUBGRUPO] 
                                                                                
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
using System.Collections.Generic;
using T2TiERPFenix.Models;
using T2TiERPFenix.NHibernate;

namespace T2TiERPFenix.Services
{
    public class ProdutoSubgrupoService
    {

        public IEnumerable<ProdutoSubgrupo> ConsultarLista()
        {
            IList<ProdutoSubgrupo> Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<ProdutoSubgrupo> DAL = new NHibernateDAL<ProdutoSubgrupo>(Session);
                Resultado = DAL.Select(new ProdutoSubgrupo());
            }
            return Resultado;
        }

        public IEnumerable<ProdutoSubgrupo> ConsultarListaFiltro(Filtro filtro)
        {
            IList<ProdutoSubgrupo> Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                var consultaSql = "from ProdutoSubgrupo where " + filtro.Where;
                NHibernateDAL<ProdutoSubgrupo> DAL = new NHibernateDAL<ProdutoSubgrupo>(Session);
                Resultado = DAL.SelectListaSql<ProdutoSubgrupo>(consultaSql);
            }
            return Resultado;
        }
		
        public ProdutoSubgrupo ConsultarObjeto(int id)
        {
            ProdutoSubgrupo Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<ProdutoSubgrupo> DAL = new NHibernateDAL<ProdutoSubgrupo>(Session);
                Resultado = DAL.SelectId<ProdutoSubgrupo>(id);
            }
            return Resultado;
        }
		
        public void Inserir(ProdutoSubgrupo objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<ProdutoSubgrupo> DAL = new NHibernateDAL<ProdutoSubgrupo>(Session);
                DAL.SaveOrUpdate(objeto);
                Session.Flush();
            }
        }

        public void Alterar(ProdutoSubgrupo objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<ProdutoSubgrupo> DAL = new NHibernateDAL<ProdutoSubgrupo>(Session);
                DAL.SaveOrUpdate(objeto);
                Session.Flush();
            }
        }

        public void Excluir(ProdutoSubgrupo objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<ProdutoSubgrupo> DAL = new NHibernateDAL<ProdutoSubgrupo>(Session);
                DAL.Delete(objeto);
                Session.Flush();
            }
        }
		
    }

}