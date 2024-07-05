/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [REQUISICAO_INTERNA_CABECALHO] 
                                                                                
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
using MySqlX.XDevAPI;
using NHibernate;
using System.Collections.Generic;
using T2TiERPFenix.Models;
using T2TiERPFenix.NHibernate;

namespace T2TiERPFenix.Services
{
    public class RequisicaoInternaCabecalhoService
    {

        public IEnumerable<RequisicaoInternaCabecalho> ConsultarLista()
        {
            IList<RequisicaoInternaCabecalho> Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<RequisicaoInternaCabecalho> DAL = new NHibernateDAL<RequisicaoInternaCabecalho>(Session);
                Resultado = DAL.Select(new RequisicaoInternaCabecalho());
            }
            return Resultado;
        }

        public IEnumerable<RequisicaoInternaCabecalho> ConsultarListaFiltro(Filtro filtro)
        {
            IList<RequisicaoInternaCabecalho> Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                var consultaSql = "from RequisicaoInternaCabecalho where " + filtro.Where;
                NHibernateDAL<RequisicaoInternaCabecalho> DAL = new NHibernateDAL<RequisicaoInternaCabecalho>(Session);
                Resultado = DAL.SelectListaSql<RequisicaoInternaCabecalho>(consultaSql);
            }
            return Resultado;
        }
		
        public RequisicaoInternaCabecalho ConsultarObjeto(int id)
        {
            RequisicaoInternaCabecalho Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<RequisicaoInternaCabecalho> DAL = new NHibernateDAL<RequisicaoInternaCabecalho>(Session);
                Resultado = DAL.SelectId<RequisicaoInternaCabecalho>(id);
            }
            return Resultado;
        }
		
        public void Inserir(RequisicaoInternaCabecalho objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<RequisicaoInternaCabecalho> DAL = new NHibernateDAL<RequisicaoInternaCabecalho>(Session);
                DAL.SaveOrUpdate(objeto);
                Session.Flush();
            }
        }

        public void Alterar(RequisicaoInternaCabecalho objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<RequisicaoInternaCabecalho> DAL = new NHibernateDAL<RequisicaoInternaCabecalho>(Session);
                RequisicaoInternaCabecalho RequisicaoCabOld = DAL.SelectId<RequisicaoInternaCabecalho>(objeto.Id);
                Session.Evict(RequisicaoCabOld);
                DAL.SaveOrUpdate(objeto);

                // Atualizar Estoque
                if (RequisicaoCabOld != null)
                {
                    ControleEstoqueService controleEstoqueService = new ControleEstoqueService();

                    for (int i = 0; i < objeto.ListaRequisicaoInternaDetalhe.Count; i++)
                    {
                        /*
                          Tava Aberta OU Indeferida E foi Deferida - Drecementa Estoque
                          Tava Aberta E foi Indeferida - não faz nada
                          Tava Deferida E foi Indeferida OU Aberta - Incrementa Estoque
                          Tava Indeferida e foi Aberta - não faz nada
                        */
                        if (
                                 (RequisicaoCabOld.Situacao == "A" || RequisicaoCabOld.Situacao == "I")
                                  &&
                                 (objeto.Situacao == "D")
                           )
                        {
                            controleEstoqueService.AtualizarEstoque(objeto.ListaRequisicaoInternaDetalhe[i].Produto, objeto.ListaRequisicaoInternaDetalhe[i].Quantidade.Value, "D");
                        }
                        else if
                            (
                                 (RequisicaoCabOld.Situacao == "D")
                                  &&
                                 (objeto.Situacao == "I" || objeto.Situacao == "A")
                            )
                        {
                            controleEstoqueService.AtualizarEstoque(objeto.ListaRequisicaoInternaDetalhe[i].Produto, objeto.ListaRequisicaoInternaDetalhe[i].Quantidade.Value, "I");
                        }
                    }
                }



                Session.Flush();
            }
        }

        public void Excluir(RequisicaoInternaCabecalho objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<RequisicaoInternaCabecalho> DAL = new NHibernateDAL<RequisicaoInternaCabecalho>(Session);
                DAL.Delete(objeto);
                Session.Flush();
            }
        }
		
    }

}