/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PONTO_RELOGIO] 
                                                                                
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
    public class PontoRelogioService
    {

        public IEnumerable<PontoRelogio> ConsultarLista()
        {
            IList<PontoRelogio> Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<PontoRelogio> DAL = new NHibernateDAL<PontoRelogio>(Session);
                Resultado = DAL.Select(new PontoRelogio());
            }
            return Resultado;
        }

        public IEnumerable<PontoRelogio> ConsultarListaFiltro(Filtro filtro)
        {
            IList<PontoRelogio> Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                var consultaSql = "from PontoRelogio where " + filtro.Where;
                NHibernateDAL<PontoRelogio> DAL = new NHibernateDAL<PontoRelogio>(Session);
                Resultado = DAL.SelectListaSql<PontoRelogio>(consultaSql);
            }
            return Resultado;
        }
		
        public PontoRelogio ConsultarObjeto(int id)
        {
            PontoRelogio Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<PontoRelogio> DAL = new NHibernateDAL<PontoRelogio>(Session);
                Resultado = DAL.SelectId<PontoRelogio>(id);
            }
            return Resultado;
        }
		
        public void Inserir(PontoRelogio objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<PontoRelogio> DAL = new NHibernateDAL<PontoRelogio>(Session);
                DAL.SaveOrUpdate(objeto);
                Session.Flush();
            }
        }

        public void Alterar(PontoRelogio objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<PontoRelogio> DAL = new NHibernateDAL<PontoRelogio>(Session);
                DAL.SaveOrUpdate(objeto);
                Session.Flush();
            }
        }

        public void Excluir(PontoRelogio objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<PontoRelogio> DAL = new NHibernateDAL<PontoRelogio>(Session);
                DAL.Delete(objeto);
                Session.Flush();
            }
        }
		
    }

}