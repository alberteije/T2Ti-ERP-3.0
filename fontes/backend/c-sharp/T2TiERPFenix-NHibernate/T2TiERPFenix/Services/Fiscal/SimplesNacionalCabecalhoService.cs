/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [SIMPLES_NACIONAL_CABECALHO] 
                                                                                
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
    public class SimplesNacionalCabecalhoService
    {

        public IEnumerable<SimplesNacionalCabecalho> ConsultarLista()
        {
            IList<SimplesNacionalCabecalho> Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<SimplesNacionalCabecalho> DAL = new NHibernateDAL<SimplesNacionalCabecalho>(Session);
                Resultado = DAL.Select(new SimplesNacionalCabecalho());
            }
            return Resultado;
        }

        public IEnumerable<SimplesNacionalCabecalho> ConsultarListaFiltro(Filtro filtro)
        {
            IList<SimplesNacionalCabecalho> Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                var consultaSql = "from SimplesNacionalCabecalho where " + filtro.Where;
                NHibernateDAL<SimplesNacionalCabecalho> DAL = new NHibernateDAL<SimplesNacionalCabecalho>(Session);
                Resultado = DAL.SelectListaSql<SimplesNacionalCabecalho>(consultaSql);
            }
            return Resultado;
        }
		
        public SimplesNacionalCabecalho ConsultarObjeto(int id)
        {
            SimplesNacionalCabecalho Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<SimplesNacionalCabecalho> DAL = new NHibernateDAL<SimplesNacionalCabecalho>(Session);
                Resultado = DAL.SelectId<SimplesNacionalCabecalho>(id);
            }
            return Resultado;
        }
		
        public void Inserir(SimplesNacionalCabecalho objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<SimplesNacionalCabecalho> DAL = new NHibernateDAL<SimplesNacionalCabecalho>(Session);
                DAL.SaveOrUpdate(objeto);
                Session.Flush();
            }
        }

        public void Alterar(SimplesNacionalCabecalho objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<SimplesNacionalCabecalho> DAL = new NHibernateDAL<SimplesNacionalCabecalho>(Session);
                DAL.SaveOrUpdate(objeto);
                Session.Flush();
            }
        }

        public void Excluir(SimplesNacionalCabecalho objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<SimplesNacionalCabecalho> DAL = new NHibernateDAL<SimplesNacionalCabecalho>(Session);
                DAL.Delete(objeto);
                Session.Flush();
            }
        }
		
    }

}