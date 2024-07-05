/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [TRIBUT_OPERACAO_FISCAL] 
                                                                                
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
    public class TributOperacaoFiscalService
    {

        public IEnumerable<TributOperacaoFiscal> ConsultarLista()
        {
            IList<TributOperacaoFiscal> Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<TributOperacaoFiscal> DAL = new NHibernateDAL<TributOperacaoFiscal>(Session);
                Resultado = DAL.Select(new TributOperacaoFiscal());
            }
            return Resultado;
        }

        public IEnumerable<TributOperacaoFiscal> ConsultarListaFiltro(Filtro filtro)
        {
            IList<TributOperacaoFiscal> Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                var consultaSql = "from TributOperacaoFiscal where " + filtro.Where;
                NHibernateDAL<TributOperacaoFiscal> DAL = new NHibernateDAL<TributOperacaoFiscal>(Session);
                Resultado = DAL.SelectListaSql<TributOperacaoFiscal>(consultaSql);
            }
            return Resultado;
        }
		
        public TributOperacaoFiscal ConsultarObjeto(int id)
        {
            TributOperacaoFiscal Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<TributOperacaoFiscal> DAL = new NHibernateDAL<TributOperacaoFiscal>(Session);
                Resultado = DAL.SelectId<TributOperacaoFiscal>(id);
            }
            return Resultado;
        }
		
        public void Inserir(TributOperacaoFiscal objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<TributOperacaoFiscal> DAL = new NHibernateDAL<TributOperacaoFiscal>(Session);
                DAL.SaveOrUpdate(objeto);
                Session.Flush();
            }
        }

        public void Alterar(TributOperacaoFiscal objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<TributOperacaoFiscal> DAL = new NHibernateDAL<TributOperacaoFiscal>(Session);
                DAL.SaveOrUpdate(objeto);
                Session.Flush();
            }
        }

        public void Excluir(TributOperacaoFiscal objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<TributOperacaoFiscal> DAL = new NHibernateDAL<TributOperacaoFiscal>(Session);
                DAL.Delete(objeto);
                Session.Flush();
            }
        }
		
    }

}