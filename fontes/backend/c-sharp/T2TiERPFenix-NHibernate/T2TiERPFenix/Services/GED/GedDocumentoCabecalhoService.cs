/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [GED_DOCUMENTO_CABECALHO] 
                                                                                
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
using System.IO;
using T2TiERPFenix.Models;
using T2TiERPFenix.NHibernate;
using T2TiERPFenix.Util;

namespace T2TiERPFenix.Services
{
    public class GedDocumentoCabecalhoService
    {

        public IEnumerable<GedDocumentoCabecalho> ConsultarLista()
        {
            IList<GedDocumentoCabecalho> Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<GedDocumentoCabecalho> DAL = new NHibernateDAL<GedDocumentoCabecalho>(Session);
                Resultado = DAL.Select(new GedDocumentoCabecalho());
            }
            return Resultado;
        }

        public IEnumerable<GedDocumentoCabecalho> ConsultarListaFiltro(Filtro filtro)
        {
            IList<GedDocumentoCabecalho> Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                var consultaSql = "from GedDocumentoCabecalho where " + filtro.Where;
                NHibernateDAL<GedDocumentoCabecalho> DAL = new NHibernateDAL<GedDocumentoCabecalho>(Session);
                Resultado = DAL.SelectListaSql<GedDocumentoCabecalho>(consultaSql);
            }
            return Resultado;
        }

        public GedDocumentoCabecalho ConsultarObjeto(int id)
        {
            GedDocumentoCabecalho Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<GedDocumentoCabecalho> DAL = new NHibernateDAL<GedDocumentoCabecalho>(Session);
                Resultado = DAL.SelectId<GedDocumentoCabecalho>(id);
            }
            return Resultado;
        }

        public void Inserir(GedDocumentoCabecalho objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<GedDocumentoCabecalho> DAL = new NHibernateDAL<GedDocumentoCabecalho>(Session);
                DAL.SaveOrUpdate(objeto);
                Session.Flush();
            }
        }

        public void Alterar(GedDocumentoCabecalho objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<GedDocumentoCabecalho> DAL = new NHibernateDAL<GedDocumentoCabecalho>(Session);
                DAL.SaveOrUpdate(objeto);
                Session.Flush();
            }
        }

        public void Excluir(GedDocumentoCabecalho objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<GedDocumentoCabecalho> DAL = new NHibernateDAL<GedDocumentoCabecalho>(Session);
                DAL.Delete(objeto);
                Session.Flush();
            }
        }

        public void AtualizarDetalhe(Microsoft.AspNetCore.Http.IFormFile file)
        {
            string NomeArquivoMD5 = Biblioteca.MD5String(file.FileName);
            string NomeArquivoCompleto = "c:\\T2Ti\\GED\\" + NomeArquivoMD5 + ".jpg";
            using (var stream = new FileStream(NomeArquivoCompleto, FileMode.Create))
            {
                file.CopyTo(stream);
            }
			
			// Exercício - observe o algoritmo abaixo e implemente
			/*
			01-verifique se o usuário mandou um detalhe com um cabeçalho que ainda não foi persistido
			  01.1-se este for o caso, persista o cabeçalho
			02-verifique qual operação no detalhe foi solicitada pelo usuário
			  02.1-se for 'gravar detalhe'
				02.1.1-verifique se é uma inserção
				  02.1.1.1 - insira um novo registro em ged_documento_detalhe
				  02.1.1.2 - insira um registro em ged_versao_documento com ação=I
					--- calcule o hash do arquivo e grave no campo HASH_ARQUIVO
				02.1.2-verifique se é uma alteração
				  02.1.2.1 - altere o registro em ged_documento_detalhe
				  02.1.2.2 - insira um registro em ged_versao_documento com ação=A
					--- calcule o hash do arquivo e grave no campo HASH_ARQUIVO
			  02.2-se for 'excluir detalhe'
				02.2.1 - altere o registro em ged_documento_detalhe informando a data da exclusão
				02.2.2 - insira um registro em ged_versao_documento com ação=E
					--- calcule o hash do arquivo e grave no campo HASH_ARQUIVO
			03-verifique se o detalhe veio com o campo 'assinado="S"'
			  03.1-neste caso utilize o OpenSSL para assinar o arquivo
			*/			
        }
    }
}