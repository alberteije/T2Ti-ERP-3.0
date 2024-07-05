/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado ao Sped Contabil - EFD
                                                                                
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
using T2Ti.Lib.Sped.Contabil;
using T2TiERPFenix.Models;
using T2TiERPFenix.NHibernate;
using T2TiERPFenix.Util;

namespace T2TiERPFenix.Services
{
    public class SpedContabilService
    {
        private string VersaoLeiaute, FormaEscrituracao;
        private int IdEmpresa, IdContador;
        private string DataInicial, DataFinal;
        private ISession Session;
        private T2TiSpedContabil spedT2Ti;

        public string GerarSpedContabil(string filter)
        {
            string[] conteudoFiltro = filter.Split("|");
            /*
			  0 - Periodo Inicial
			  1 - Periodo Final
			  2 - Forma de Escritura��o
			  3 - Layout da Vers�o
			*/

            DataInicial = conteudoFiltro[0];
            DataFinal = conteudoFiltro[1];
            FormaEscrituracao = conteudoFiltro[2];
            VersaoLeiaute = conteudoFiltro[3];
            IdEmpresa = 1;

            spedT2Ti = new T2TiSpedContabil();

            using (Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                GerarBloco0();
                GerarBlocoI();
                GerarBlocoJ();
            }

            string nomeArquivo = "C:\\T2Ti\\Sped\\ECD\\sped-contabil-c.txt";
            spedT2Ti.geraArquivoTxt(nomeArquivo);
            return nomeArquivo;
        }


        #region BLOCO 0: ABERTURA, IDENTIFICA��O E REFER�NCIAS
        public void GerarBloco0()
        {
            Empresa Empresa = new EmpresaService().ConsultarObjeto(IdEmpresa);

            // REGISTRO 0000: ABERTURA DO ARQUIVO DIGITAL E IDENTIFICA��O DO EMPRES�RIO OU DA SOCIEDADE EMPRES�RIA
            spedT2Ti.bloco0.registro0000.dtIni = Convert.ToDateTime(DataInicial);
            spedT2Ti.bloco0.registro0000.dtFin = Convert.ToDateTime(DataFinal);
            spedT2Ti.bloco0.registro0000.nome = Empresa.RazaoSocial;
            spedT2Ti.bloco0.registro0000.cnpj = Empresa.Cnpj;
            spedT2Ti.bloco0.registro0000.ie = Empresa.InscricaoEstadual;
            spedT2Ti.bloco0.registro0000.codMun = Empresa.CodigoIbgeCidade.Value;
            spedT2Ti.bloco0.registro0000.im = Empresa.InscricaoMunicipal;
            spedT2Ti.bloco0.registro0000.uf = Empresa.EnderecoPrincipal.Uf;

            // REGISTRO 0001: ABERTURA DO BLOCO 0
            // bloco com dados informados = 0 | sem dados inf = 1
            spedT2Ti.bloco0.registro0001.indDad = 0;


            // REGISTRO 0007: OUTRAS INSCRI��ES CADASTRAIS DA PESSOA JUR�DICA
            // Implementado a crit�rio do Participante do T2Ti ERP
            // REGISTRO 0020: ESCRITURA��O CONT�BIL DESCENTRALIZADA
            // Implementado a crit�rio do Participante do T2Ti ERP - Para o treinamento a escritura��o ser� centralizada
            // REGISTRO 0150: TABELA DE CADASTRO DO PARTICIPANTE
            // Implementado a crit�rio do Participante do T2Ti ERP
            // REGISTRO 0180: IDENTIFICA��O DO RELACIONAMENTO COM O PARTICIPANTE
            // Implementado a crit�rio do Participante do T2Ti ERP
        }
        #endregion

        #region Bloco I - Lan�amentos Cont�beis
        public void GerarBlocoI()
        {
            // REGISTRO I001: ABERTURA DO BLOCO I
            spedT2Ti.blocoI.registroI001.indDad = 0;

            // REGISTRO I010: IDENTIFICA��O DA ESCRITURA��O CONT�BIL
            spedT2Ti.blocoI.registroI010.indEsc = FormaEscrituracao;
            spedT2Ti.blocoI.registroI010.codVerLc = VersaoLeiaute;

            // REGISTRO I012: LIVROS AUXILIARES AO DI�RIO
            // Implementado a crit�rio do Participante do T2Ti ERP
            // REGISTRO I015: IDENTIFICA��O DAS CONTAS DA ESCRITURA��O RESUMIDA A QUE SE REFERE A ESCRITURA��O AUXILIAR
            // Implementado a crit�rio do Participante do T2Ti ERP
            // REGISTRO I020: CAMPOS ADICIONAIS
            // Implementado a crit�rio do Participante do T2Ti ERP
            // REGISTRO I030: TERMO DE ABERTURA
            /* TODO
            filtros.clear();
            filtros.add(new Filtro(Filtro.AND, "formaEscrituracao", Filtro.IGUAL, formaEscrituracao));
            filtros.add(new Filtro(Filtro.AND, "competencia", Filtro.IGUAL, Biblioteca.mesAno(dataInicial)));
            ContabilLivro contabilLivro = contabilLivroDao.getBean(ContabilLivro.class, filtros);

            if (contabilLivro != null) {
                filtros.clear();
                filtros.add(new Filtro(Filtro.AND, "contabilLivro", Filtro.IGUAL, contabilLivro));
                filtros.add(new Filtro(Filtro.AND, "aberturaEncerramento", Filtro.IGUAL, "A"));
                ContabilTermo contabilTermo = contabilTermoDao.getBean(ContabilTermo.class, filtros);
                if (contabilTermo == null) {
                    throw new Exception("Termo de Abertura n�o encontrado");
                }

                filtros.clear();
                filtros.add(new Filtro(Filtro.AND, "empresa", Filtro.IGUAL, empresa));
                RegistroCartorio registroCartorio = registroCartorioDao.getBean(RegistroCartorio.class, filtros);
                if (registroCartorio == null) {
                    throw new Exception("Registro em Cart�rio n�o encontrado");
                }

                spedT2Ti.getBlocoI().getRegistroI030().setNumOrd(contabilTermo.getNumeroRegistro());
                spedT2Ti.getBlocoI().getRegistroI030().setNatLivr(contabilLivro.getDescricao());
                spedT2Ti.getBlocoI().getRegistroI030().setNome(empresa.getRazaoSocial());
                spedT2Ti.getBlocoI().getRegistroI030().setNire(registroCartorio.getNire());
                spedT2Ti.getBlocoI().getRegistroI030().setCnpj(empresa.getCnpj());
                spedT2Ti.getBlocoI().getRegistroI030().setDtArq(registroCartorio.getDataRegistro());
                spedT2Ti.getBlocoI().getRegistroI030().setDescMun(endereco.getCidade());
            }

            // REGISTRO I050: PLANO DE CONTAS
            filtros.clear();
            filtros.add(new Filtro(Filtro.AND, "empresa", Filtro.IGUAL, empresa));
            PlanoConta planoConta = planoContaDao.getBean(PlanoConta.class, filtros);

            List<ContabilConta> listaContabilConta = new ArrayList<>();
            if (planoConta != null) {
                filtros.clear();
                filtros.add(new Filtro(Filtro.AND, "planoConta", Filtro.IGUAL, planoConta));
                listaContabilConta = dao.getBeans(ContabilConta.class, filtros);

                RegistroI050 registroI050;
                for (int i = 0; i < listaContabilConta.size(); i++) {
                    registroI050 = new RegistroI050();
                    registroI050.setDtAlt(listaContabilConta.get(i).getDataInclusao());
                    registroI050.setCodNat(listaContabilConta.get(i).getCodigoEfd());
                    registroI050.setIndCta(listaContabilConta.get(i).getTipo());
                    String classificacao[] = listaContabilConta.get(i).getClassificacao().split(".");
                    registroI050.setNivel(String.valueOf(classificacao.length));
                    registroI050.setCodCta(listaContabilConta.get(i).getClassificacao());
                    registroI050.setCodCtaSup("");
                    registroI050.setCta(listaContabilConta.get(i).getDescricao());

                    // REGISTRO I051: PLANO DE CONTAS REFERENCIAL

                    // Observa��o: A partir da vers�o 3.X e altera��es posteriores do PVA do Sped Cont�bil, n�o haver� o plano de
                    // contas referencial da RFB . Portanto, para as empresas que utilizavam esse plano, n�o ser� necess�rio o preenchimento
                    // do registro I051.

                    // Fonte: Manual de Orienta��o da ECD

                    //registroI050.getRegistroi051List().add(registroI051);
                    spedT2Ti.getBlocoI().getListaRegistroI050().add(registroI050);
                }

            }*/

            // REGISTRO I052: INDICA��O DOS C�DIGOS DE AGLUTINA��O
            // Implementado a crit�rio do Participante do T2Ti ERP
            // REGISTRO I075: TABELA DE HIST�RICO PADRONIZADO
            /* TODO
            filtros.clear();
            filtros.add(new Filtro(Filtro.AND, "empresa", Filtro.IGUAL, empresa));
            List<ContabilHistorico> contabilHistorico = contabilHistoricoDao.getBeans(ContabilHistorico.class, filtros);
            RegistroI075 registroI075;
            for (int i = 0; i < contabilHistorico.size(); i++) {
                registroI075 = new RegistroI075();

                registroI075.setCodHist(contabilHistorico.get(i).getId().toString());
                registroI075.setDescrHist(contabilHistorico.get(i).getDescricao());

                spedT2Ti.getBlocoI().getListaRegistroI075().add(registroI075);
            }

            // REGISTRO I100: CENTRO DE CUSTOS
            // Implementado a crit�rio do Participante do T2Ti ERP
            // REGISTRO I150: SALDOS PERI�DICOS � IDENTIFICA��O DO PER�ODO
            RegistroI150 registroI150 = new RegistroI150();
            registroI150.setDtIni(dataInicial);
            registroI150.setDtFin(dataFinal);

            // REGISTRO I151: Hash dos Arquivos que Cont�m as Fichas de Lan�amento Utilizadas no Per�odo
            // Implementado a crit�rio do Participante do T2Ti ERP
            BigDecimal creditos;
            BigDecimal debitos;
            BigDecimal saldo;
            ViewSpedI155VoId i155Credito;
            ViewSpedI155VoId i155Debito;
            for (int i = 0; i < listaContabilConta.size(); i++) {
                // REGISTRO I155: DETALHE DOS SALDOS PERI�DICOS
                //busca o saldo anterior
                filtros.clear();
                filtros.add(new Filtro(Filtro.AND, "viewSpedI155VO.mesAno", Filtro.IGUAL, Biblioteca.mesAno(Biblioteca.mesAnterior(dataInicial))));
                filtros.add(new Filtro(Filtro.AND, "viewSpedI155VO.idContabilConta", Filtro.IGUAL, listaContabilConta.get(i).getId()));
                filtros.add(new Filtro(Filtro.AND, "viewSpedI155VO.tipo", Filtro.IGUAL, "C"));
                i155Credito = viewSpedI155VoIdDao.getBean(ViewSpedI155VoId.class, filtros);
                if (i155Credito != null) {
                    creditos = i155Credito.getViewSpedI155VO().getSomaValor();
                } else {
                    creditos = BigDecimal.ZERO;
                }

                filtros.clear();
                filtros.add(new Filtro(Filtro.AND, "viewSpedI155VO.mesAno", Filtro.IGUAL, Biblioteca.mesAno(Biblioteca.mesAnterior(dataInicial))));
                filtros.add(new Filtro(Filtro.AND, "viewSpedI155VO.idContabilConta", Filtro.IGUAL, listaContabilConta.get(i).getId()));
                filtros.add(new Filtro(Filtro.AND, "viewSpedI155VO.tipo", Filtro.IGUAL, "D"));
                i155Debito = viewSpedI155VoIdDao.getBean(ViewSpedI155VoId.class, filtros);
                if (i155Debito != null) {
                    debitos = i155Credito.getViewSpedI155VO().getSomaValor();
                } else {
                    debitos = BigDecimal.ZERO;
                }

                saldo = creditos.subtract(debitos);

                RegistroI155 registroI155 = new RegistroI155();
                registroI155.setCodCta(listaContabilConta.get(i).getClassificacao());
                registroI155.setCodCcus("");
                registroI155.setVlSldIni(saldo);
                if (saldo.compareTo(BigDecimal.ZERO) == -1) {
                    registroI155.setIndDcIni("D");
                } else {
                    registroI155.setIndDcIni("C");
                }

                //busca o saldo atual
                filtros.clear();
                filtros.add(new Filtro(Filtro.AND, "viewSpedI155VO.mesAno", Filtro.IGUAL, Biblioteca.mesAno(dataInicial)));
                filtros.add(new Filtro(Filtro.AND, "viewSpedI155VO.idContabilConta", Filtro.IGUAL, listaContabilConta.get(i).getId()));
                filtros.add(new Filtro(Filtro.AND, "viewSpedI155VO.tipo", Filtro.IGUAL, "C"));
                i155Credito = viewSpedI155VoIdDao.getBean(ViewSpedI155VoId.class, filtros);
                if (i155Credito != null) {
                    creditos = i155Credito.getViewSpedI155VO().getSomaValor();
                } else {
                    creditos = BigDecimal.ZERO;
                }

                filtros.clear();
                filtros.add(new Filtro(Filtro.AND, "viewSpedI155VO.mesAno", Filtro.IGUAL, Biblioteca.mesAno(dataInicial)));
                filtros.add(new Filtro(Filtro.AND, "viewSpedI155VO.idContabilConta", Filtro.IGUAL, listaContabilConta.get(i).getId()));
                filtros.add(new Filtro(Filtro.AND, "viewSpedI155VO.tipo", Filtro.IGUAL, "D"));
                i155Debito = viewSpedI155VoIdDao.getBean(ViewSpedI155VoId.class, filtros);
                if (i155Debito != null) {
                    debitos = i155Credito.getViewSpedI155VO().getSomaValor();
                } else {
                    debitos = BigDecimal.ZERO;
                }

                saldo = creditos.subtract(debitos);

                registroI155.setVlDeb(debitos);
                registroI155.setVlCred(creditos);
                registroI155.setVlSldFin(saldo);
                if (saldo.compareTo(BigDecimal.ZERO) == -1) {
                    registroI155.setIndDcFin("D");
                } else {
                    registroI155.setIndDcFin("C");
                }

                registroI150.getRegistroi155List().add(registroI155);

                // REGISTRO I157: TRANSFER�NCIA DE SALDOS DE PLANO DE CONTAS ANTERIOR
                // Implementado a crit�rio do Participante do T2Ti ERP
            }
            spedT2Ti.getBlocoI().getListaRegistroI150().add(registroI150);

            // REGISTRO I200: LAN�AMENTO CONT�BIL
            filtros.clear();
            filtros.add(new Filtro(Filtro.AND, "dataLancamento", Filtro.MAIOR_OU_IGUAL, dataInicial));
            filtros.add(new Filtro(Filtro.AND, "dataLancamento", Filtro.MENOR_OU_IGUAL, dataFinal));
            List<ContabilLancamentoCabecalho> listaLancamentoCabecalho = contabilLancamentoCabecalhoDao.getBeans(ContabilLancamentoCabecalho.class, filtros);
            RegistroI200 registroI200;
            RegistroI250 registroI250;
            for (int i = 0; i < listaLancamentoCabecalho.size(); i++) {
                registroI200 = new RegistroI200();
                registroI200.setNumLcto(String.valueOf(listaLancamentoCabecalho.get(i).getId()));
                registroI200.setDtLcto(listaLancamentoCabecalho.get(i).getDataLancamento());
                registroI200.setVlLcto(listaLancamentoCabecalho.get(i).getValor());
                registroI200.setIndLcto("N");

                filtros.clear();
                filtros.add(new Filtro(Filtro.AND, "contabilLancamentoCabecalho", Filtro.IGUAL, listaLancamentoCabecalho.get(i)));
                List<ContabilLancamentoDetalhe> lancamentoDetalhe = contabilLancamentoDetalheDao.getBeans(ContabilLancamentoDetalhe.class, filtros);
                for (int j = 0; j < lancamentoDetalhe.size(); j++) {
                    registroI250 = new RegistroI250();
                    registroI250.setCodCta(lancamentoDetalhe.get(j).getContabilConta().getClassificacao());
                    //registroI250.setCodCcus("");
                    registroI250.setVlDc(lancamentoDetalhe.get(j).getValor());
                    registroI250.setIndDc(lancamentoDetalhe.get(j).getTipo());
                    //registroI250.setNumArq("");
                    registroI250.setCodHistPad(String.valueOf(lancamentoDetalhe.get(j).getContabilHistorico().getId()));
                    registroI250.setHist(lancamentoDetalhe.get(j).getHistorico());
                    //registroI250.setCodPart("");

                    registroI200.getRegistroi250List().add(registroI250);
                }

                spedT2Ti.getBlocoI().getListaRegistroI200().add(registroI200);
            }
            */
            // REGISTRO I300: BALANCETES DI�RIOS � IDENTIFICA��O DA DATA
            // REGISTRO I310: DETALHES DO BALANCETE DI�RIO
            // Implementados a crit�rio do Participante do T2Ti ERP
            // REGISTRO I350: SALDOS DAS CONTAS DE RESULTADO ANTES DO ENCERRAMENTO � IDENTIFICA��O DA DATA
            // REGISTRO I355: DETALHES DOS SALDOS DAS CONTAS DE RESULTADO ANTES DO ENCERRAMENTO
            // Implementados a crit�rio do Participante do T2Ti ERP
            // REGISTRO I500: PAR�METROS DE IMPRESS�O E VISUALIZA��O DO LIVRO RAZ�O AUXILIAR COM LEIAUTE PARAMETRIZ�VEL
            // REGISTRO I510: DEFINI��O DE CAMPOS DO LIVRO RAZ�O AUXILIAR COM LEIAUTE PARAMETRIZ�VEL
            // REGISTRO I550: DETALHES DO LIVRO AUXILIAR COM LEIAUTE PARAMETRIZ�VEL
            // REGISTRO I555: TOTAIS NO LIVRO AUXILIAR COM LEIAUTE PARAMETRIZ�VEL
            // Implementados a crit�rio do Participante do T2Ti ERP
        }
        #endregion

        #region Bloco J - Demonstra��es Cont�beis
        public void GerarBlocoJ()
        {
            // REGISTRO J001: ABERTURA DO BLOCO J
            spedT2Ti.blocoJ.registroJ001.indDad = 0;

            // REGISTRO J005: DEMONSTRA��ES CONT�BEIS
            // Implementado a crit�rio do Participante do T2Ti ERP
            // REGISTRO J100: BALAN�O PATRIMONIAL
            // Implementado a crit�rio do Participante do T2Ti ERP
            //REGISTRO J150: DEMONSTRA��O DO RESULTADO DO EXERC�CIO
            //Implementado a crit�rio do Participante do T2Ti ERP
            // REGISTRO J200: TABELA DE HIST�RICO DE FATOS CONT�BEIS QUE MODIFICAM A CONTA LUCROS ACUMULADOS OU A CONTA PREJU�ZOS ACUMULADOS OU TODO O PATRIM�NIO L�QUIDO
            // REGISTRO J210: DLPA � DEMONSTRA��O DE LUCROS OU PREJU�ZOS ACUMULADOS/DMPL � DEMONSTRA��O DE MUTA��ES DO PATRIM�NIO L�QUIDO
            // REGISTRO J215: FATO CONT�BIL QUE ALTERA A CONTA LUCROS ACUMULADOS OU A CONTA PREJU�ZOS ACUMULADOS OU TODO O PATRIM�NIO L�QUIDO
            // Implementados a crit�rio do Participante do T2Ti ERP
            // REGISTRO J310: DEMONSTRA��O DO FLUXO DE CAIXA
            // Implementado a crit�rio do Participante do T2Ti ERP
            // REGISTRO J410: DEMONSTRA��O DO VALOR ADICIONADO
            // Implementado a crit�rio do Participante do T2Ti ERP
            // REGISTRO J800: OUTRAS INFORMA��ES
            // Implementado a crit�rio do Participante do T2Ti ERP
            // REGISTRO J900: TERMO DE ENCERRAMENTO
            /* TODO
            filtros.clear();
            filtros.add(new Filtro(Filtro.AND, "formaEscrituracao", Filtro.IGUAL, formaEscrituracao));
            filtros.add(new Filtro(Filtro.AND, "competencia", Filtro.IGUAL, Biblioteca.mesAno(dataInicial)));
            ContabilLivro contabilLivro = contabilLivroDao.getBean(ContabilLivro.class, filtros);
            if (contabilLivro != null) {
                filtros.clear();
                filtros.add(new Filtro(Filtro.AND, "contabilLivro", Filtro.IGUAL, contabilLivro));
                filtros.add(new Filtro(Filtro.AND, "aberturaEncerramento", Filtro.IGUAL, "E"));
                ContabilTermo contabilTermo = contabilTermoDao.getBean(ContabilTermo.class, filtros);
                if (contabilTermo == null) {
                    throw new Exception("Termo de Encerramento n�o encontrado");
                }

                spedT2Ti.getBlocoJ().getRegistroJ900().setNumOrd(contabilTermo.getNumeroRegistro());
                spedT2Ti.getBlocoJ().getRegistroJ900().setNatLivro(contabilLivro.getDescricao());
                spedT2Ti.getBlocoJ().getRegistroJ900().setNome(empresa.getRazaoSocial());
                spedT2Ti.getBlocoJ().getRegistroJ900().setDtIniEscr(contabilTermo.getEscrituracaoInicio());
                spedT2Ti.getBlocoJ().getRegistroJ900().setDtFinEscr(contabilTermo.getEscrituracaoFim());

                // REGISTRO J930: IDENTIFICA��O DOS SIGNAT�RIOS DA ESCRITURA��O
                List<Contador> contadores  = contadorDao.getBeans(Contador.class);
                RegistroJ930 registroJ930;
                for (int i = 0; i < contadores.size(); i++) {
                    registroJ930 = new RegistroJ930();
                    registroJ930.setIdentNom(contadores.get(i).getNome());
                    registroJ930.setIdentCpf(contadores.get(i).getCpf());
                    registroJ930.setIdentQualif("CONTADOR");
                    registroJ930.setCodAssin("900");
                    registroJ930.setIndCrc(contadores.get(i).getInscricaoCrc());

                    spedT2Ti.getBlocoJ().getListaRegistroJ930().add(registroJ930);
                }
            }
            */
        }
        #endregion


    }

}