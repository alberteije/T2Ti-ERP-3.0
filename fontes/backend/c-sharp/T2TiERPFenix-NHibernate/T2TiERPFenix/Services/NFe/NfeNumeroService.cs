/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [NFE_NUMERO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
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
    public class NfeNumeroService
    {

        public IEnumerable<NfeNumero> ConsultarLista()
        {
            IList<NfeNumero> Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<NfeNumero> DAL = new NHibernateDAL<NfeNumero>(Session);
                Resultado = DAL.Select(new NfeNumero());
            }
            return Resultado;
        }

        public IEnumerable<NfeNumero> ConsultarListaFiltro(Filtro filtro)
        {
            IList<NfeNumero> Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                var consultaSql = "from NfeNumero where " + filtro.Where;
                NHibernateDAL<NfeNumero> DAL = new NHibernateDAL<NfeNumero>(Session);
                Resultado = DAL.SelectListaSql<NfeNumero>(consultaSql);
            }
            return Resultado;
        }
		
        public NfeNumero ConsultarObjeto(int id)
        {
            NfeNumero Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<NfeNumero> DAL = new NHibernateDAL<NfeNumero>(Session);
                Resultado = DAL.SelectId<NfeNumero>(id);
            }
            return Resultado;
        }
		
        public void Inserir(NfeNumero objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<NfeNumero> DAL = new NHibernateDAL<NfeNumero>(Session);
                DAL.SaveOrUpdate(objeto);
                Session.Flush();
            }
        }

        public void Alterar(NfeNumero objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<NfeNumero> DAL = new NHibernateDAL<NfeNumero>(Session);
                DAL.SaveOrUpdate(objeto);
                Session.Flush();
            }
        }

        public void Excluir(NfeNumero objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<NfeNumero> DAL = new NHibernateDAL<NfeNumero>(Session);
                DAL.Delete(objeto);
                Session.Flush();
            }
        }
		
    }

}