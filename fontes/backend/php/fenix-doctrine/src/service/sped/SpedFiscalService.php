<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à geração do Sped Fiscal - EFD
                                                                                
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

class SpedFiscalService extends ServiceBase
{
	private $dataInicial;
	private $dataFinal;
	private $versaoLeiaute;
	private $finalidadeArquivo;
	private $perfilApresentacao;
	private $idEmpresa;
	private $inventario;
	private $idContador;
	private $spedT2Ti;
	
    public function gerarSpedFiscal(string $filter)
    {
        $conteudoFiltro = explode('|', $filter);
        /*
        0 - Periodo Inicial
        1 - Periodo Final
        2 - Versao Leiaute
        3 - Finalidade Arquivo
        4 - Perfil
        5 - IdEmpresa
        6 - Inventario
        7 - IdContador
        */
		$this->dataInicial = $conteudoFiltro[0];
        $this->dataFinal = $conteudoFiltro[1];
        $this->versaoLeiaute = $conteudoFiltro[2];
        $this->finalidadeArquivo = $conteudoFiltro[3];
        $this->perfilApresentacao = $conteudoFiltro[4];
        $this->idEmpresa = $conteudoFiltro[5];
        $this->inventario = $conteudoFiltro[6];
        $this->idContador = $conteudoFiltro[7];

		$this->spedT2Ti = new T2TiSpedFiscal();
		
		$this->geraBloco0();
		$this->geraBlocoC();
		// BLOCO D: DOCUMENTOS FISCAIS II - SERVIÇOS (ICMS).
		// Bloco de registros dos dados relativos à emissão ou ao recebimento de
		// documentos fiscais que acobertam as prestações de serviços de
		// comunicação, transporte intermunicipal e interestadual.
		// Implementado a critério do Participante do T2Ti ERP
		$this->geraBlocoE();
		// BLOCO G – CONTROLE DO CRÉDITO DE ICMS DO ATIVO PERMANENTE CIAP
		// Implementado a critério do Participante do T2Ti ERP
		if ($this->inventario > 0) {
			$this->geraBlocoH();
		}
		$this->geraBloco1();
		
		$date = new DateTime();
		$complementoNomeArquivo = $date->format('dmYHis');
		$nomeArquivoSped = "c:\\T2Ti\\Sped\\EFD\\SpedFiscal" . $complementoNomeArquivo . ".txt";		
		$arquivoSped = fopen($nomeArquivoSped, "w");

		$this->spedT2Ti->geraArquivoTxt($arquivoSped);

		return $nomeArquivoSped;
	}	


	// BLOCO 0: ABERTURA, IDENTIFICAÇÃO E REFERÊNCIAS
	public function geraBloco0()
    {
        $gerenteConexao = GerenteConexao::getInstance();

		//  Empresa
		$empresa = $gerenteConexao->entityManager->find('Empresa', $this->idEmpresa);
		$empresa->enderecoPrincipal = $empresa->getListaEmpresaEndereco()[0]; //TODO: configure o sistema para pegar o endereço principal

		// Contador
		$contador = $gerenteConexao->entityManager->find('Contador', $this->idContador);

		// Lista de NF-e
        $sql = "SELECT nfe FROM NfeCabecalho nfe WHERE nfe.dataHoraEmissao BETWEEN :dataInicio AND :dataFim";
        $query = $gerenteConexao->entityManager->createQuery($sql);
        $query->setParameter("dataInicio", "$this->dataInicial");
        $query->setParameter("dataFim", "$this->dataFinal");
        $listaNfeCabecalho = $query->getResult();

		// Lista de unidades
		$listaProdutoUnidade = array();

		// Operações Fiscais
        $sql = "select t from TributOperacaoFiscal t";
        $query = $gerenteConexao->entityManager->createQuery($sql);
        $listaOperacaoFiscal = $query->getResult();

		// Listas SPED
		$listaRegistro0190 = $this->spedT2Ti->getBloco0()->getListaRegistro0190();

		// REGISTRO 0000: ABERTURA DO ARQUIVO DIGITAL E IDENTIFICAÇÃO DA
		// ENTIDADE
		$this->spedT2Ti->getBloco0()->getRegistro0000()->setDtIni(new DateTime($this->dataInicial));
		$this->spedT2Ti->getBloco0()->getRegistro0000()->setDtFin(new DateTime($this->dataFinal));
		$this->spedT2Ti->getBloco0()->getRegistro0000()->setCodVer($this->versaoLeiaute);
		$this->spedT2Ti->getBloco0()->getRegistro0000()->setCodFin($this->finalidadeArquivo);
		$this->spedT2Ti->getBloco0()->getRegistro0000()->setIndPerfil($this->perfilApresentacao);
		$this->spedT2Ti->getBloco0()->getRegistro0000()->setNome($empresa->getRazaoSocial());
		$this->spedT2Ti->getBloco0()->getRegistro0000()->setCnpj($empresa->getCnpj());
		$this->spedT2Ti->getBloco0()->getRegistro0000()->setCpf("");
		$this->spedT2Ti->getBloco0()->getRegistro0000()->setIe($empresa->getInscricaoEstadual());
		$this->spedT2Ti->getBloco0()->getRegistro0000()->setCodMun(strval($empresa->getCodigoIbgeCidade()));
		$this->spedT2Ti->getBloco0()->getRegistro0000()->setIm($empresa->getInscricaoMunicipal());
		//TODO: $this->spedT2Ti->getBloco0()->getRegistro0000()->setSuframa($empresa->getSuframa());
		$this->spedT2Ti->getBloco0()->getRegistro0000()->setIndAtiv("1");
		$this->spedT2Ti->getBloco0()->getRegistro0000()->setUf($empresa->enderecoPrincipal->getUf());

		// REGISTRO 0001: ABERTURA DO BLOCO 0
		$this->spedT2Ti->getBloco0()->getRegistro0001()->setIndMov(0);

		// REGISTRO 0005: DADOS COMPLEMENTARES DA ENTIDADE
		$this->spedT2Ti->getBloco0()->getRegistro0005()->setFantasia($empresa->getNomeFantasia());
		$this->spedT2Ti->getBloco0()->getRegistro0005()->setCep($empresa->enderecoPrincipal->getCep());
		$this->spedT2Ti->getBloco0()->getRegistro0005()->setEndereco($empresa->enderecoPrincipal->getLogradouro());
		$this->spedT2Ti->getBloco0()->getRegistro0005()->setNum($empresa->enderecoPrincipal->getNumero());
		$this->spedT2Ti->getBloco0()->getRegistro0005()->setCompl($empresa->enderecoPrincipal->getComplemento());
		$this->spedT2Ti->getBloco0()->getRegistro0005()->setBairro($empresa->enderecoPrincipal->getBairro());
		//TODO: $this->spedT2Ti->getBloco0()->getRegistro0005()->setFone($empresa->enderecoPrincipal->getFone());
		//TODO: $this->spedT2Ti->getBloco0()->getRegistro0005()->setFax($empresa->enderecoPrincipal->getFone());
		$this->spedT2Ti->getBloco0()->getRegistro0005()->setEmail($empresa->getEmail());
		
		// REGISTRO 0015: DADOS DO CONTRIBUINTE SUBSTITUTO
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO 0100: DADOS DO CONTABILISTA
		// TODO
		$this->spedT2Ti->getBloco0()->getRegistro0100()->setNome("contador->getNome()");
		$this->spedT2Ti->getBloco0()->getRegistro0100()->setCpf("contador->getCpf()");
		$this->spedT2Ti->getBloco0()->getRegistro0100()->setCrc($contador->getCrcInscricao());
		$this->spedT2Ti->getBloco0()->getRegistro0100()->setCep("contador->getCep()");
		$this->spedT2Ti->getBloco0()->getRegistro0100()->setEndereco("contador->getLogradouro()");
		$this->spedT2Ti->getBloco0()->getRegistro0100()->setNum("contador->getNumero()");
		$this->spedT2Ti->getBloco0()->getRegistro0100()->setCompl("contador->getComplemento()");
		$this->spedT2Ti->getBloco0()->getRegistro0100()->setBairro("contador->getBairro()");
		$this->spedT2Ti->getBloco0()->getRegistro0100()->setFone("contador->getFone()");
		$this->spedT2Ti->getBloco0()->getRegistro0100()->setFax("contador->getFax()");
		$this->spedT2Ti->getBloco0()->getRegistro0100()->setEmail("contador->getEmail()");
		$this->spedT2Ti->getBloco0()->getRegistro0100()->setCodMun("123");

		// REGISTRO 0150: TABELA DE CADASTRO DO PARTICIPANTE
		/*
		 * Deverão ser informados somente os participantes que tiveram
		 * movimentação no período de referência da EFD, não sendo necessário
		 * informar os CNPJs e CPFs citados nos registros C350 e C460
		 * [adquirentes nas operações acobertadas com nota fiscal de venda a
		 * consumidor ou cupom fiscal]
		 */
		$listaRegistro0150 = array();
		foreach ($listaNfeCabecalho as $c) {
			// emitentes
			$emitente = $c->getNfeEmitente();
			if ($emitente != null) {
				$registro0150 = new EFDRegistro0150();
				$registro0150->setCodPart("F" . $emitente->getNfeCabecalho()->getFornecedor()->getId());
				$registro0150->setNome($emitente->getNome());
				$registro0150->setCodPais("01058");
				$registro0150->setCpf($emitente->getCpf());
				$registro0150->setCnpj($emitente->getCnpj());
				$registro0150->setCodMun($emitente->getCodigoMunicipio());
				// TODO: registro0150->setSuframa(strval($emitente->getSuframa()));
				$registro0150->setEndereco($emitente->getLogradouro());
				$registro0150->setNum($emitente->getNumero());
				$registro0150->setCompl($emitente->getComplemento());
				$registro0150->setBairro($emitente->getBairro());
				$this->spedT2Ti->getBloco0()->addRegistroLista0150($registro0150);
			}

			// destinatários
			$destinatario = $c->getNfeDestinatario();
			if ($destinatario != null) {
				$registro0150 = new EFDRegistro0150();
				$registro0150->setCodPart("C" . $destinatario->getNfeCabecalho()->getCliente()->getId());
				$registro0150->setNome($destinatario->getNome());
				$registro0150->setCodPais("01058");
				$registro0150->setCpf($destinatario->getCpf());
				$registro0150->setCnpj($destinatario->getCnpj());
				$registro0150->setCodMun(strval($destinatario->getCodigoMunicipio()));
				$registro0150->setSuframa(strval($destinatario->getSuframa()));
				$registro0150->setEndereco($destinatario->getLogradouro());
				$registro0150->setNum($destinatario->getNumero());
				$registro0150->setCompl($destinatario->getComplemento());
				$registro0150->setBairro($destinatario->getBairro());				
				$this->spedT2Ti->getBloco0()->addRegistroLista0150($registro0150);
			}

			// REGISTRO 0175: ALTERAÇÃO DA TABELA DE CADASTRO DE PARTICIPANTE
			// Pegar os dados de PESSOA_ALTERACAO para gerar o registro 0175
						
			// registro 0200
			foreach ($c->getListaNfeDetalhe() as $nfeDetalhe) {
				$registro0200 = new EFDRegistro0200();
				$produto = $nfeDetalhe->getProduto();

				$registro0200->setCodItem(strval($produto->getId()));
				$registro0200->setDescrItem($produto->getDescricao());
				$registro0200->setCodBarra($produto->getGtin());
				// TEM QUE PREENCHER PARA INFORMAR NO 0205
				$registro0200->setCodAntItem("");
				$registro0200->setUnidInv(strval($produto->getProdutoUnidade()->getId()));
				// TODO: $registro0200->setTipoItem($produto->getTipoItemSped());
				$registro0200->setCodNcm($produto->getCodigoNcm());
				// TODO: $registro0200->setExIpi($produto->getExTipi());
				$registro0200->setCodGen(substr($produto->getCodigoNcm(), 0, 2));
				// TODO: $registro0200->setCodLst($produto->getCodigoLst());
				// TODO: $registro0200->setAliqIcms($produto->getAliquotaIcmsPaf());

				if (!in_array($produto->getProdutoUnidade(), $listaProdutoUnidade)) {
					array_push($listaProdutoUnidade, $produto->getProdutoUnidade());
				}

				// REGISTRO 0205: ALTERAÇÃO DO ITEM
				/* TODO
				List<ProdutoAlteracaoItem> listaProdutoAlteracaoItem = alteracaoItemDao->getBeans(ProdutoAlteracaoItem.class, "produto", produto, "dataInicial", dataInicio, dataFim);
				Registro0205 registro0205;
				for (ProdutoAlteracaoItem produtoAlteracaoItem : listaProdutoAlteracaoItem) {
					registro0205 = new EFDRegistro0205();

					registro0205->setDescrAntItem(produtoAlteracaoItem->getNome());
					registro0205->setDtIni(produtoAlteracaoItem->getDataInicial());
					registro0205->setDtFin(produtoAlteracaoItem->getDataFinal());
					registro0205->setCodAntItem(produtoAlteracaoItem->getCodigo());

					$registro0200->getRegistro0205List()->add(registro0205);
				}
				*/

				// REGISTRO 0206: CÓDIGO DE PRODUTO CONFORME TABELA PUBLICADA
				// PELA ANP (COMBUSTÍVEIS)
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO 0210: CONSUMO ESPECÍFICO PADRONIZADO
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO 0220: FATORES DE CONVERSÃO DE UNIDADES
				/* TODO
				UnidadeConversao unidadeConversao = $produto->getUnidadeConversao();
				if (unidadeConversao != null) {
					Registro0220 registro0220 = new EFDRegistro0220();
					registro0220->setUnidConv(unidadeConversao->getProduto()->getUnidadeProduto()->getId()));
					registro0220->setFatConv(unidadeConversao->getFatorConversao());

					$registro0200->getRegistro0220List()->add(registro0220);
				}
				*/
			}
		}

		// REGISTRO 0190: IDENTIFICAÇÃO DAS UNIDADES DE MEDIDA
		foreach ($listaProdutoUnidade as $unidade) {
			$registro0190 = new EFDRegistro0190();

			$registro0190->setUnid(strval($unidade->getId()));
			$registro0190->setDescr($unidade->getSigla());

			array_push($listaRegistro0190, $registro0190);
		}


		// REGISTRO 0300: CADASTRO DE BENS OU COMPONENTES DO ATIVO IMOBILIZADO
		// REGISTRO 0305: INFORMAÇÃO SOBRE A UTILIZAÇÃO DO BEM
		// Implementado a critério do Participante do T2Ti ERP - versão 1.0 não
		// possui controle CIAP
		// REGISTRO 0400: TABELA DE NATUREZA DA OPERAÇÃO/PRESTAÇÃO
		foreach ($listaOperacaoFiscal as $operacaoFiscal) {
			$registro0400 = new EFDRegistro0400();

			$registro0400->setCodNat(strval($operacaoFiscal->getId()));
			$registro0400->setDescrNat($operacaoFiscal->getDescricaoNaNf());
		}

		// REGISTRO 0450: TABELA DE INFORMAÇÃO COMPLEMENTAR DO DOCUMENTO FISCAL
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO 0460: TABELA DE OBSERVAÇÕES DO LANÇAMENTO FISCAL
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO 0500: PLANO DE CONTAS CONTÁBEIS
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO 0600: CENTRO DE CUSTOS
		// Implementado a critério do Participante do T2Ti ERP		

	}


	// BLOCO C: DOCUMENTOS FISCAIS I - MERCADORIAS (ICMS/IPI)
	public function geraBlocoC()
    {
        $gerenteConexao = GerenteConexao::getInstance();

		// Lista de NF-e
        $sql = "SELECT nfe FROM NfeCabecalho nfe WHERE nfe.dataHoraEmissao BETWEEN :dataInicio AND :dataFim";
        $query = $gerenteConexao->entityManager->createQuery($sql);
        $query->setParameter("dataInicio", "$this->dataInicial");
        $query->setParameter("dataFim", "$this->dataFinal");
        $listaNfeCabecalho = $query->getResult();		

		// TODO: List<EcfNotaFiscalCabecalho> listaNf2Cabecalho = nf2Dao->getBeans(EcfNotaFiscalCabecalho.class, "dataEmissao", dataInicio, dataFim);

		// TODO: List<EcfNotaFiscalCabecalho> listaNf2Cancelada = nf2Dao->getBeans(EcfNotaFiscalCabecalho.class, "cancelada", "S", "dataEmissao", dataInicio, dataFim);

		// Listas SPED
		$listaRegistroC114 = $this->spedT2Ti->getBlocoC()->getListaRegistroC114();

		// PERFIL A
		if ($this->perfilApresentacao == "A") {
			// REGISTRO C100: NOTA FISCAL (CÓDIGO 01), NOTA FISCAL AVULSA
			// (CÓDIGO 1B), NOTA FISCAL DE PRODUTOR (CÓDIGO 04), NF-e (CÓDIGO
			// 55) e NFC-e (CÓDIGO 65)
			foreach ($listaNfeCabecalho as $nfe) {
				$registroC100 = new EFDRegistroC100();

				$listaRegistroC170 = $registroC100->getRegistroC170List();
				$listaRegistroC190 = $registroC100->getRegistroC190List();

				$registroC100->setIndOper(strval($nfe->getTipoOperacao()));
				$registroC100->setIndEmit("0"); // 0 - Emissao Propria
				if ($nfe->getCliente() != null) {
					$registroC100->setCodPart("C" . $nfe->getCliente()->getId());
				} else if ($nfe->getFornecedor() != null) {
					$registroC100->setCodPart("F" . $nfe->getFornecedor()->getId());
				}
				$registroC100->setCodMod($nfe->getCodigoModelo());

				/*
				 * 4.1.2- Tabela Situação do Documento Código Descrição 00
				 * Documento regular 01 Documento regular extemporâneo 02
				 * Documento cancelado 03 Documento cancelado extemporâneo 04
				 * NFe denegada 05 Nfe – Numeração inutilizada 06 Documento
				 * Fiscal Complementar 07 Documento Fiscal Complementar
				 * extemporâneo. 08 Documento Fiscal emitido com base em Regime
				 * Especial ou Norma Específica
				 */
				if ($nfe->getStatusNota() == "5") {
					$registroC100->setCodSit("00");
				} else if ($nfe->getStatusNota() == "6") {
					$registroC100->setCodSit("02");
				}
				$registroC100->setSer($nfe->getSerie());
				$registroC100->setNumDoc($nfe->getNumero());
				$registroC100->setChvNfe($nfe->getChaveAcesso());
				$registroC100->setDtDoc($nfe->getDataHoraEmissao());
				$registroC100->setDtES($nfe->getDataHoraEntradaSaida());
				$registroC100->setVlDoc($nfe->getValorTotal());
				// TODO: $registroC100->setIndPgto(strval($nfe->getIndicadorFormaPagamento()));
				$registroC100->setVlDesc($nfe->getValorDesconto());
				$registroC100->setVlAbatNt("0");
				$registroC100->setVlMerc($nfe->getValorTotalProdutos());

				$transporte = $nfe->getNfeTransporte();
				if ($transporte != null) {
					$registroC100->setIndFrt(strval($transporte->getModalidadeFrete()));
				}

				$registroC100->setVlFrt($nfe->getValorFrete());
				$registroC100->setVlSeg($nfe->getValorSeguro());
				$registroC100->setVlOutDa($nfe->getValorDespesasAcessorias());
				$registroC100->setVlBcIcms($nfe->getBaseCalculoIcms());
				$registroC100->setVlIcms($nfe->getValorIcms());
				$registroC100->setVlBcIcmsSt($nfe->getBaseCalculoIcmsSt());
				$registroC100->setVlIcmsSt($nfe->getValorIcmsSt());
				$registroC100->setVlIpi($nfe->getValorIpi());
				$registroC100->setVlPis($nfe->getValorPis());
				$registroC100->setVlPisSt("0");
				$registroC100->setVlCofins($nfe->getValorCofins());
				$registroC100->setVlCofinsSt("0");

				// REGISTRO C105: OPERAÇÕES COM ICMS ST RECOLHIDO PARA UF
				// DIVERSA DO DESTINATÁRIO DO DOCUMENTO FISCAL (CÓDIGO 55).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C110: INFORMAÇÃO COMPLEMENTAR DA NOTA FISCAL (CÓDIGO
				// 01, 1B, 04 e 55).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C111: PROCESSO REFERENCIADO
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C112: DOCUMENTO DE ARRECADAÇÃO REFERENCIADO.
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C113: DOCUMENTO FISCAL REFERENCIADO.
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C114: CUPOM FISCAL REFERENCIADO
				foreach ($nfe->getListaNfeCupomFiscalReferenciado() as $cupomFiscal) {
					$registroC114 = new EFDRegistroC114();

					$registroC114->setCodMod($cupomFiscal->getModeloDocumentoFiscal());
					$registroC114->setEcfFab($cupomFiscal->getNumeroSerieEcf());
					$registroC114->setEcfCx(strval($cupomFiscal->getNumeroCaixa()));
					$registroC114->setNumDoc(strval($cupomFiscal->getCoo()));
					$registroC114->setDtDoc($cupomFiscal->getDataEmissaoCupom());		
					
					$this->spedT2Ti->getBlocoC()->addRegistroLista0114($registroC114);					
				}

				// REGISTRO C115: LOCAL DA COLETA E/OU ENTREGA (CÓDIGO 01, 1B E
				// 04).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C116: CUPOM FISCAL ELETRÔNICO REFERENCIADO
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C120: COMPLEMENTO DE DOCUMENTO - OPERAÇÕES DE
				// IMPORTAÇÃO (CÓDIGOS 01 e 55).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C130: ISSQN, IRRF E PREVIDÊNCIA SOCIAL.
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C140: FATURA (CÓDIGO 01)
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C141: VENCIMENTO DA FATURA (CÓDIGO 01).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C160: VOLUMES TRANSPORTADOS (CÓDIGO 01 E 04) -
				// EXCETO COMBUSTÍVEIS.
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C165: OPERAÇÕES COM COMBUSTÍVEIS (CÓDIGO 01).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C170: ITENS DO DOCUMENTO (CÓDIGO 01, 1B, 04 e 55).
				foreach ($nfe->getListaNfeDetalhe() as $nfeDetalhe) {
					$registroC170 = new EFDRegistroC170();

					$registroC170->setNumItem(strval($nfeDetalhe->getNumeroItem()));
					$registroC170->setCodItem($nfeDetalhe->getGtin());
					$registroC170->setDescrCompl($nfeDetalhe->getNomeProduto());
					$registroC170->setQtd($nfeDetalhe->getQuantidadeComercial());
					$registroC170->setUnid(strval($nfeDetalhe->getProduto()->getProdutoUnidade()->getId()));
					$registroC170->setVlItem($nfeDetalhe->getValorTotal());
					$registroC170->setVlDesc($nfeDetalhe->getValorDesconto());
					$registroC170->setIndMov(0);
					$registroC170->setCstIcms($nfeDetalhe->getNfeDetalheImpostoIcms()->getCstIcms());
					$registroC170->setCfop(strval($nfeDetalhe->getCfop()));
					$registroC170->setCodNat(strval($nfeDetalhe->getNfeCabecalho()->getTributOperacaoFiscal()->getId()));
					$registroC170->setVlBcIcms($nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBcIcms());
					$registroC170->setAliqIcms($nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcms());
					$registroC170->setVlIcms($nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcms());
					$registroC170->setVlBcIcmsSt($nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBaseCalculoIcmsSt());
					$registroC170->setAliqSt($nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcmsSt());
					$registroC170->setVlIcmsSt($nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcmsSt());
					$registroC170->setIndApur(0);
					$registroC170->setCstIpi($nfeDetalhe->getNfeDetalheImpostoIpi()->getCstIpi());
					//TODO: $registroC170->setCodEnq($nfeDetalhe->getNfeDetalheImpostoIpi()->getEnquadramentoIpi());
					$registroC170->setVlBcIpi($nfeDetalhe->getNfeDetalheImpostoIpi()->getValorBaseCalculoIpi());
					$registroC170->setAliqIpi($nfeDetalhe->getNfeDetalheImpostoIpi()->getAliquotaIpi());
					$registroC170->setVlIpi($nfeDetalhe->getNfeDetalheImpostoIpi()->getValorIpi());
					$registroC170->setCstPis($nfeDetalhe->getNfeDetalheImpostoIpi()->getCstIpi());
					$registroC170->setVlBcPis($nfeDetalhe->getNfeDetalheImpostoPis()->getValorBaseCalculoPis());
					$registroC170->setAliqPisPerc($nfeDetalhe->getNfeDetalheImpostoPis()->getAliquotaPisPercentual());
					$registroC170->setQuantBcPis($nfeDetalhe->getNfeDetalheImpostoPis()->getQuantidadeVendida());
					$registroC170->setAliqPisR($nfeDetalhe->getNfeDetalheImpostoPis()->getAliquotaPisReais());
					$registroC170->setVlPis($nfeDetalhe->getNfeDetalheImpostoPis()->getValorPis());
					$registroC170->setCstCofins($nfeDetalhe->getNfeDetalheImpostoCofins()->getCstCofins());
					$registroC170->setVlBcCofins($nfeDetalhe->getNfeDetalheImpostoCofins()->getBaseCalculoCofins());
					$registroC170->setAliqCofinsPerc($nfeDetalhe->getNfeDetalheImpostoCofins()->getAliquotaCofinsPercentual());
					$registroC170->setQuantBcCofins($nfeDetalhe->getNfeDetalheImpostoCofins()->getQuantidadeVendida());
					$registroC170->setAliqCofinsR($nfeDetalhe->getNfeDetalheImpostoCofins()->getAliquotaCofinsReais());
					$registroC170->setVlCofins($nfeDetalhe->getNfeDetalheImpostoCofins()->getValorCofins());
					$registroC170->setCodCta("");

					$this->spedT2Ti->getBlocoC()->addRegistroListaC170($registroC170);
				}

				// REGISTRO C171: ARMAZENAMENTO DE COMBUSTIVEIS (código 01, 55).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C172: OPERAÇÕES COM ISSQN (CÓDIGO 01)
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C173: OPERAÇÕES COM MEDICAMENTOS (CÓDIGO 01 e 55).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C174: OPERAÇÕES COM ARMAS DE FOGO (CÓDIGO 01).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C175: OPERAÇÕES COM VEÍCULOS NOVOS (CÓDIGO 01 e 55).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C176: RESSARCIMENTO DE ICMS EM OPERAÇÕES COM
				// SUBSTITUIÇÃO TRIBUTÁRIA (CÓDIGO 01, 55).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C177: OPERAÇÕES COM PRODUTOS SUJEITOS A SELO DE
				// CONTROLE IPI.
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C178: OPERAÇÕES COM PRODUTOS SUJEITOS À TRIBUTAÇÀO
				// DE IPI POR UNIDADE OU QUANTIDADE DE PRODUTO.
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C179: INFORMAÇÕES COMPLEMENTARES ST (CÓDIGO 01).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C190: REGISTRO ANALÍTICO DO DOCUMENTO (CÓDIGO 01,
				// 1B, 04 ,55 e 65).

				$sql = "SELECT c190 FROM ViewSpedC190 c190 WHERE c190.id = :idNfe";
				$query = $gerenteConexao->entityManager->createQuery($sql);
				$query->setParameter("idNfe", $nfe->getId());
				$listaNfeAnalitico = $query->getResult();
				foreach ($listaNfeAnalitico as $spedC190) {
					$registroC190 = new EFDRegistroC190();

					$registroC190->setCstIcms($spedC190->getCstIcms());
					$registroC190->setCfop(strval($spedC190->getCfop()));
					$registroC190->setAliqIcms($spedC190->getAliquotaIcms());
					$registroC190->setVlOpr($spedC190->getSomaValorOperacao());
					$registroC190->setVlBcIcms($spedC190->getSomaBaseCalculoIcms());
					$registroC190->setVlIcms($spedC190->getSomaValorIcms());
					$registroC190->setVlBcIcmsSt($spedC190->getSomaBaseCalculoIcmsSt());
					$registroC190->setVlIcmsSt($spedC190->getSomaValorIcmsSt());
					$registroC190->setVlRedBc($spedC190->getSomaVlRedBc());
					$registroC190->setVlIpi($spedC190->getSomaValorIpi());
					$registroC190->setCodObs("");

					array_push($listaRegistroC190, $registroC190);
				}

				// REGISTRO C195: OBSERVAÇOES DO LANÇAMENTO FISCAL (CÓDIGO 01,
				// 1B E 55)
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C197: OUTRAS OBRIGAÇÕES TRIBUTÁRIAS, AJUSTES E
				// INFORMAÇÕES DE VALORES PROVENIENTES DE DOCUMENTO FISCAL.
				// Implementado a critério do Participante do T2Ti ERP
			}

			// REGISTRO C350: NOTA FISCAL DE VENDA A CONSUMIDOR (CÓDIGO 02)
			/* TODO
			RegistroC350 $registroC350;
			for (EcfNotaFiscalCabecalho notaFiscal : listaNf2Cabecalho) {
				$registroC350 = new EFDRegistroC350();

				$registroC350->setSer(notaFiscal->getSerie());
				$registroC350->setSubSer(notaFiscal->getSubserie());
				$registroC350->setNumDoc(notaFiscal->getNumero());
				$registroC350->setDtDoc(notaFiscal->getDataEmissao());
				$registroC350->setCnpjCpf(notaFiscal->getCpfCnpjCliente());
				$registroC350->setVlMerc(notaFiscal->getTotalProdutos());
				$registroC350->setVlDoc(notaFiscal->getTotalNf());
				$registroC350->setVlDesc(notaFiscal->getDesconto());
				$registroC350->setVlPis(notaFiscal->getPis());
				$registroC350->setVlCofins(notaFiscal->getCofins());
				$registroC350->setCodCta("");

				$this->spedT2Ti->getBlocoC()->getListaRegistroC350()->add($registroC350);

				// REGISTRO C370: ITENS DO DOCUMENTO (CÓDIGO 02)
				List<ViewSpedC370Id> listaC370 = viewC370Dao->getBeans(ViewSpedC370Id.class, "viewC370.idNfCabecalho", notaFiscal->getId());
				RegistroC370 $registroC370;
				;
				for (ViewSpedC370Id s : listaC370) {
					$registroC370 = new EFDRegistroC370();
					ViewSpedC370 viewC370 = s->getViewC370();

					$registroC370->setNumItem(viewC370->getItem()));
					$registroC370->setCodItem(viewC370->getIdProduto()));
					$registroC370->setQtd(viewC370->getQuantidade());
					$registroC370->setUnid(viewC370->getIdUnidadeProduto()));
					$registroC370->setVlItem(viewC370->getValorTotal());
					$registroC370->setVlDesc(viewC370->getDesconto());

					$registroC350->getRegistroC370List()->add($registroC370);
				}

				// REGISTRO C390: REGISTRO ANALÍTICO DAS NOTAS FISCAIS DE VENDA
				// A CONSUMIDOR (CÓDIGO 02)
				List<ViewSpedC390Id> listaC390 = viewC390Dao->getBeans(ViewSpedC390Id.class, "viewC390.dataEmissao", dataInicio, dataFim);
				RegistroC390 $registroC390;
				for (ViewSpedC390Id s : listaC390) {
					$registroC390 = new EFDRegistroC390();
					ViewSpedC390 viewC390 = s->getViewC390();

					$registroC390->setCstIcms(viewC390->getCst());
					$registroC390->setCfop(viewC390->getCfop()));
					$registroC390->setAliqIcms(viewC390->getTaxaIcms());
					$registroC390->setVlOpr(viewC390->getSomaItem());
					$registroC390->setVlBcIcms(viewC390->getSomaBaseIcms());
					$registroC390->setVlIcms(viewC390->getSomaIcms());
					$registroC390->setVlRedBc(viewC390->getSomaIcmsOutras());

					$registroC350->getRegistroC390List()->add($registroC390);
				}
			}
			*/
		}

		// PERFIL B
		if ($this->perfilApresentacao == "B") {
			/* TODO
			// REGISTRO C300: RESUMO DIÁRIO DAS NOTAS FISCAIS DE VENDA A
			// CONSUMIDOR (CÓDIGO 02)
			List<ViewSpedC300Id> listaC300 = viewC300Dao->getBeans(ViewSpedC300Id.class, "viewC300.dataEmissao", dataInicio, dataFim);
			RegistroC300 $registroC300;
			RegistroC310 $registroC310;
			for (ViewSpedC300Id c300 : listaC300) {
				ViewSpedC300 viewC300 = c300->getViewSpedC300();

				$registroC300 = new EFDRegistroC300();

				$registroC300->setCodMod("02");
				$registroC300->setSer(viewC300->getSerie());
				$registroC300->setSub(viewC300->getSubserie());

				List<EcfNotaFiscalCabecalho> listaEcfNotaFiscal = ecfNotaFiscalCabecalhoDao->getBeans(dataInicio, dataFim, viewC300->getSerie(), viewC300->getSubserie());
				if (!listaEcfNotaFiscal.isEmpty()) {
					$registroC300->setNumDocIni(listaEcfNotaFiscal->get(0)->getNumero());
					$registroC300->setNumDocFin(listaEcfNotaFiscal->get(listaEcfNotaFiscal.size() - 1)->getNumero());
				}

				$registroC300->setDtDoc(viewC300->getDataEmissao());
				$registroC300->setVlDoc(viewC300->getSomaTotalNf());
				$registroC300->setVlPis(viewC300->getSomaPis());
				$registroC300->setVlCofins(viewC300->getSomaCofins());

				// REGISTRO C310: DOCUMENTOS CANCELADOS DE NOTAS FISCAIS DE
				// VENDA A CONSUMIDOR (CÓDIGO 02).
				for (int j = 0; j < listaNf2Cancelada.size(); j++) {
					$registroC310 = new EFDRegistroC310();

					$registroC310->setNumDocCanc(listaNf2Cancelada->get(j)->getNumero());

					$registroC300->getRegistroC310List()->add($registroC310);
				}

				// REGISTRO C320: REGISTRO ANALÍTICO DO RESUMO DIÁRIO DAS NOTAS
				// FISCAIS DE VENDA A CONSUMIDOR (CÓDIGO 02). ---> igual ao C390
				List<ViewSpedC390Id> listaC390 = viewC390Dao->getBeans(ViewSpedC390Id.class, "viewC390.dataEmissao", dataInicio, dataFim);
				RegistroC320 $registroC320;
				for (ViewSpedC390Id c390 : listaC390) {
					$registroC320 = new EFDRegistroC320();
					ViewSpedC390 viewC390 = c390->getViewC390();

					$registroC320->setCstIcms(viewC390->getCst());
					$registroC320->setCfop(viewC390->getCfop()));
					$registroC320->setAliqIcms(viewC390->getTaxaIcms());
					$registroC320->setVlOpr(viewC390->getSomaItem());
					$registroC320->setVlBcIcms(viewC390->getSomaBaseIcms());
					$registroC320->setVlIcms(viewC390->getSomaIcms());
					$registroC320->setVlRedBc(viewC390->getSomaIcmsOutras());

					// REGISTRO C321: ITENS DO RESUMO DIÁRIO DOS DOCUMENTOS
					// (CÓDIGO 02).
					List<ViewSpedC321Id> listaC321 = viewC321Dao->getBeans(ViewSpedC321Id.class, "viewC321.dataEmissao", dataInicio, dataFim);
					RegistroC321 $registroC321;
					for (ViewSpedC321Id c321 : listaC321) {
						$registroC321 = new EFDRegistroC321();
						ViewSpedC321 spedC321 = c321->getViewC321();

						$registroC321->setCodItem(spedC321->getIdProduto()));
						$registroC321->setQtd(spedC321->getSomaQuantidade());
						$registroC321->setUnid(spedC321->getDescricaoUnidade());
						$registroC321->setVlItem(spedC321->getSomaItem());
						$registroC321->setVlDesc(spedC321->getSomaDesconto());
						$registroC321->setVlBcIcms(spedC321->getSomaBaseIcms());
						$registroC321->setVlIcms(spedC321->getSomaIcms());
						$registroC321->setVlPis(spedC321->getSomaPis());
						$registroC321->setVlCofins(spedC321->getSomaCofins());

						$registroC320->getRegistroC321List()->add($registroC321);
					}

					$registroC300->getRegistroC320List()->add($registroC320);
				}

				$this->spedT2Ti->getBlocoC()->getListaRegistroC300()->add($registroC300);
			}
			*/
		}// if (perfil.equals("B")) {

		/* TODO
		// Ambos os Perfis
		// REGISTRO C400: EQUIPAMENTO ECF (CÓDIGO 02, 2D e 60).
		List<EcfImpressora> listaEcf = ecfImpressoraDao->getBeans(EcfImpressora.class);
		RegistroC400 $registroC400;
		for (EcfImpressora ecf : listaEcf) {
			$registroC400 = new EFDRegistroC400();

			$registroC400->setCodMod(ecf->getModeloDocumentoFiscal());
			$registroC400->setEcfMod(ecf->getModelo());
			$registroC400->setEcfFab(ecf->getSerie());
			$registroC400->setEcfCx(ecf->getNumero()));

			// REGISTRO C405: REDUÇÃO Z (CÓDIGO 02, 2D e 60).
			// verifica se existe movimento no periodo para aquele ECF
			List<EcfR02> listaR02 = ecfR02Dao->getBeans(EcfR02.class, "idImpressora", ecf->getId(), "dataEmissao", dataInicio, dataFim);
			RegistroC405 $registroC405;
			for (EcfR02 r02 : listaR02) {
				$registroC405 = new EFDRegistroC405();

				$registroC405->setDtDoc(r02->getDataMovimento());
				$registroC405->setCro(r02->getCro());
				$registroC405->setCrz(r02->getCrz());
				$registroC405->setNumCooFin(r02->getCoo());
				$registroC405->setGtFin(r02->getGrandeTotal());
				$registroC405->setVlBrt(r02->getVendaBruta());

				// REGISTRO C410: PIS E COFINS TOTALIZADOS NO DIA (CÓDIGO 02 e
				// 2D).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C420: REGISTRO DOS TOTALIZADORES PARCIAIS DA REDUÇÃO
				// Z (COD 02, 2D e 60).
				List<EcfR03> listaR03 = ecfR03Dao->getBeans(EcfR03.class, "idR02", r02->getId());
				RegistroC420 $registroC420;
				for (EcfR03 r03 : listaR03) {
					$registroC420 = new EFDRegistroC420();

					if (r03->getTotalizadorParcial()->length() == 8) {
						$registroC420->setCodTotPar(r03->getTotalizadorParcial()->substring(1));
					} else {
						$registroC420->setCodTotPar(r03->getTotalizadorParcial());
					}
					$registroC420->setVlrAcumTot(r03->getValorAcumulado());
					if (r03->getTotalizadorParcial()->length() == 7) {
						$registroC420->setNrTot(Integer.valueOf(r03->getTotalizadorParcial()->substring(0, 2)));
					} else {
						$registroC420->setNrTot(0);
					}

					if (perfil.equals("B")) {
						// REGISTRO C425: RESUMO DE ITENS DO MOVIMENTO DIÁRIO
						// (CÓDIGO 02 e 2D).
						List<ViewSpedC425Id> listaC425 = viewC425Dao->getBeans(dataInicio, dataFim, "%CAN%", "%S%");
						RegistroC425 $registroC425;
						for (ViewSpedC425Id c425 : listaC425) {
							$registroC425 = new EFDRegistroC425();
							ViewSpedC425 viewC425 = c425->getViewC425();

							$registroC425->setCodItem(viewC425->getIdEcfProduto()));
							$registroC425->setUnid(viewC425->getDescricaoUnidade());
							$registroC425->setQtd(viewC425->getSomaQuantidade());
							$registroC425->setVlItem(viewC425->getSomaItem());
							$registroC425->setVlPis(viewC425->getSomaPis());
							$registroC425->setVlCofins(viewC425->getSomaCofins());

							$registroC420->getRegistroc425List()->add($registroC425);
						}
					}

					$registroC405->getRegistroC420List()->add($registroC420);
				}

				// se tiver o perfil A, gera o C460 com C470
				if (perfil.equals("A")) {
					// REGISTRO C460: DOCUMENTO FISCAL EMITIDO POR ECF (CÓDIGO
					// 02, 2D e 60).
					List<EcfVendaCabecalho> listaR04 = ecfVendaCabecalhoDao->getBeans(EcfVendaCabecalho.class, "dataVenda", dataInicio, dataFim);
					RegistroC460 $registroC460;
					for (EcfVendaCabecalho r04 : listaR04) {
						$registroC460 = new EFDRegistroC460();

						$registroC460->setCodMod("2D");
						if (r04->getStatusVenda() == "C") {
							$registroC460->setCodSit("02");
						} else {
							$registroC460->setCodSit("00");
							$registroC460->setDtDoc(r04->getDataVenda());
							$registroC460->setVlDoc(r04->getValorFinal());
							$registroC460->setVlPis(r04->getPis());
							$registroC460->setVlCofins(r04->getCofins());
							$registroC460->setCpfCnpj(r04->getCpfCnpjCliente());
							$registroC460->setNomAdq(r04->getNomeCliente());

							// REGISTRO C465: COMPLEMENTO DO CUPOM FISCAL
							// ELETRÔNICO EMITIDO POR ECF – CF-e-ECF (CÓDIGO
							// 60).
							// Implementado a critério do Participante do T2Ti
							// ERP }
							// REGISTRO C470: ITENS DO DOCUMENTO FISCAL EMITIDO
							// POR ECF (CÓDIGO 02 e 2D).
							List<EcfVendaDetalhe> listaR05 = ecfVendaDetalheDao->getBeans(EcfVendaDetalhe.class, "idEcfVendaCabecalho", r04->getId());
							RegistroC470 $registroC470;
							for (EcfVendaDetalhe r05 : listaR05) {
								$registroC470 = new EFDRegistroC470();

								$registroC470->setCodItem(r05->getIdEcfProduto()));
								$registroC470->setQtd(r05->getQuantidade());
								$registroC470->setQtdCanc("0");

								Produto produto = produtoDao->getBean(r05->getIdEcfProduto(), Produto.class);

								$registroC470->setUnid(produto->getUnidadeProduto()->getId()));
								$registroC470->setVlItem(r05->getTotalItem());
								$registroC470->setCstIcms(r05->getCst());
								$registroC470->setCfop(r05->getCfop()));
								$registroC470->setAliqIcms(r05->getTaxaIcms());
								$registroC470->setVlPis(r05->getPis());
								$registroC470->setVlCofins(r05->getCofins());

								$registroC460->getRegistroC470List()->add($registroC470);
							}
						}
						$registroC460->setNumDoc(r04->getCoo()));

						$registroC405->getRegistroC460List()->add($registroC460);
					}
				}

				// REGISTRO C490: REGISTRO ANALÍTICO DO MOVIMENTO DIÁRIO (CÓDIGO
				// 02, 2D e 60).
				List<ViewSpedC490Id> listaC490 = viewC490Dao->getBeans(ViewSpedC490Id.class, "viewC490.dataVenda", dataInicio, dataFim);
				RegistroC490 $registroC490;
				for (ViewSpedC490Id c490 : listaC490) {
					$registroC490 = new EFDRegistroC490();
					ViewSpedC490 viewC490 = c490->getViewC490();

					$registroC490->setCstIcms(viewC490->getCst());
					$registroC490->setCfop(viewC490->getCfop()));
					$registroC490->setAliqIcms(viewC490->getTaxaIcms());
					$registroC490->setVlOpr(viewC490->getSomaItem());
					$registroC490->setVlBcIcms(viewC490->getSomaBaseIcms());
					$registroC490->setVlIcms(viewC490->getSomaIcms());

					$registroC405->getRegistroC490List()->add($registroC490);
				}

				// REGISTRO C495: RESUMO MENSAL DE ITENS DO ECF POR
				// ESTABELECIMENTO (CÓDIGO 02 e 2D).
				// Implementado a critério do Participante do T2Ti ERP
				$registroC400->getRegistroC405List()->add($registroC405);
			}

			// REGISTRO C500: NOTA FISCAL/CONTA DE ENERGIA ELÉTRICA (CÓDIGO 06),
			// NOTA FISCAL/CONTA DE FORNECIMENTO D'ÁGUA CANALIZADA (CÓDIGO 29) E
			// NOTA FISCAL CONSUMO FORNECIMENTO DE GÁS (CÓDIGO 28).
			// REGISTRO C510: ITENS DO DOCUMENTO NOTA FISCAL/CONTA ENERGIA
			// ELÉTRICA (CÓDIGO 06), NOTA FISCAL/CONTA DE FORNECIMENTO D'ÁGUA
			// CANALIZADA (CÓDIGO 29) E NOTA FISCAL/CONTA DE FORNECIMENTO DE GÁS
			// (CÓDIGO 28).
			// REGISTRO C590: REGISTRO ANALÍTICO DO DOCUMENTO - NOTA
			// FISCAL/CONTA DE ENERGIA ELÉTRICA (CÓDIGO 06), NOTA FISCAL/CONTA
			// DE FORNECIMENTO D'ÁGUA CANALIZADA (CÓDIGO 29) E NOTA FISCAL
			// CONSUMO FORNECIMENTO DE GÁS (CÓDIGO 28).
			// REGISTRO C600: CONSOLIDAÇÃO DIÁRIA DE NOTAS FISCAIS/CONTAS DE
			// ENERGIA ELÉTRICA (CÓDIGO 06), NOTA FISCAL/CONTA DE FORNECIMENTO
			// D'ÁGUA CANALIZADA (CÓDIGO 29) E NOTA FISCAL/CONTA DE FORNECIMENTO
			// DE GÁS (CÓDIGO 28) ($empresaS NÃO OBRIGADAS AO CONVÊNIO ICMS
			// 115/03).
			// REGISTRO C601: DOCUMENTOS CANCELADOS - CONSOLIDAÇÃO DIÁRIA DE
			// NOTAS FISCAIS/CONTAS DE ENERGIA ELÉTRICA (CÓDIGO 06), NOTA
			// FISCAL/CONTA DE FORNECIMENTO D'ÁGUA CANALIZADA (CÓDIGO 29) E NOTA
			// FISCAL/CONTA DE FORNECIMENTO DE GÁS (CÓDIGO 28)
			// REGISTRO C610: ITENS DO DOCUMENTO CONSOLIDADO (CÓDIGO 06), NOTA
			// FISCAL/CONTA DE FORNECIMENTO D'ÁGUA CANALIZADA (CÓDIGO 29) E NOTA
			// FISCAL/CONTA DE FORNECIMENTO DE GÁS (CÓDIGO 28) ($empresaS NÃO
			// OBRIGADAS AO CONVÊNIO ICMS 115/03).
			// REGISTRO C690: REGISTRO ANALÍTICO DOS DOCUMENTOS (NOTAS
			// FISCAIS/CONTAS DE ENERGIA ELÉTRICA (CÓDIGO 06), NOTA FISCAL/CONTA
			// DE FORNECIMENTO D’ÁGUA CANALIZADA (CÓDIGO 29) E NOTA FISCAL/CONTA
			// DE FORNECIMENTO DE GÁS (CÓDIGO 28)
			// REGISTRO C700: CONSOLIDAÇÃO DOS DOCUMENTOS NF/CONTA ENERGIA
			// ELÉTRICA (CÓD 06), EMITIDAS EM VIA ÚNICA ($empresaS OBRIGADAS À
			// ENTREGA DO ARQUIVO PREVISTO NO CONVÊNIO ICMS 115/03) E NOTA
			// FISCAL/CONTA DE FORNECIMENTO DE GÁS CANALIZADO (CÓDIGO 28)
			// REGISTRO C790: REGISTRO ANALÍTICO DOS DOCUMENTOS (CÓDIGOS 06 e
			// 28).
			// REGISTRO C791: REGISTRO DE INFORMAÇÕES DE ST POR UF (COD 06)
			// Implementados a critério do Participante do T2Ti ERP

			// REGISTRO C800: CUPOM FISCAL ELETRÔNICO (CÓDIGO 59)
			// REGISTRO C850: REGISTRO ANALÍTICO DO CF-E (CODIGO 59)
			// REGISTRO C860: IDENTIFICAÇÃO DO EQUIPAMENTO SAT-CF-E
			// REGISTRO C890: RESUMO DIÁRIO DO CF-E (CÓDIGO 59) POR EQUIPAMENTO
			// SATCF-E
			// SERÃO IMPLEMENTADOS QUANDO O SAT FOR CONSTRUIDO

			$this->spedT2Ti->getBlocoC()->getListaRegistroC400()->add($registroC400);
		}
		*/
	}


	// BLOCO E: APURAÇÃO DO ICMS E DO IPI
	public function geraBlocoE()
    {
		// REGISTRO E001: ABERTURA DO BLOCO E
		$this->spedT2Ti->getBlocoE()->getRegistroE001()->setIndMov(0);

		// REGISTRO E100: PERÍODO DA APURAÇÃO DO ICMS.
		$registroE100 = new EFDRegistroE100();
		$registroE100->setDtIni($this->dataInicial);
		$registroE100->setDtFin($this->dataFinal);
		// $this->spedT2Ti->getBlocoE()->getListaRegistroE100()->add($registroE100);

		// REGISTRO E110: APURAÇÃO DO ICMS – OPERAÇÕES PRÓPRIAS.
		/* TODO
		List<FiscalApuracaoIcms> listaE110 = apuracaoIcmsDao->getBeans(FiscalApuracaoIcms.class, "competencia", Biblioteca.mesAno(dataInicio));
		FiscalApuracaoIcms v;
		RegistroE110 $registroE110;
		if (!listaE110.isEmpty()) {
			$registroE110 = new RegistroE110();
			v = listaE110->get(0);

			$registroE110->setVlTotDebitos(v->getValorTotalDebito());
			$registroE110->setVlAjDebitos(v->getValorAjusteDebito());
			$registroE110->setVlTotAjDebitos(v->getValorTotalAjusteDebito());
			$registroE110->setVlEstornosCred(v->getValorEstornoCredito());
			$registroE110->setVlTotCreditos(v->getValorTotalCredito());
			$registroE110->setVlAjCreditos(v->getValorAjusteCredito());
			$registroE110->setVlTotAjCreditos(v->getValorTotalAjusteCredito());
			$registroE110->setVlEstornosDeb(v->getValorEstornoDebito());
			$registroE110->setVlSldCredorAnt(v->getValorSaldoCredorAnterior());
			$registroE110->setVlSldApurado(v->getValorSaldoApurado());
			$registroE110->setVlTotDed(v->getValorTotalDeducao());
			$registroE110->setVlIcmsRecolher(v->getValorIcmsRecolher());
			$registroE110->setVlSldCredorTransportar(v->getValorSaldoCredorTransp());
			$registroE110->setDebEsp(v->getValorDebitoEspecial());

			// $registro E116
			RegistroE116 $registroE116 = new RegistroE116();
			$registroE116->setCodOr("000");
			$registroE116->setVlOr(v->getValorIcmsRecolher());
			$registroE116->setDtVcto(dataFim);
			$registroE116->setCodRec("1");
			$registroE116->setNumProc("");
			$registroE116->setIndProc("");
			$registroE116->setProc("");
			$registroE116->setTxtCompl("");
			$registroE116->setMesRef("");

			$registroE110->getRegistroE116List()->add($registroE116);

			$registroE100->setRegistroE110($registroE110);
		}
		*/
	}

	// BLOCO H: INVENTÁRIO FÍSICO
    public function geraBlocoH()
    {
        $gerenteConexao = GerenteConexao::getInstance();

		// Lista de Produtos
        $sql = "SELECT p FROM Produto p";
        $query = $gerenteConexao->entityManager->createQuery($sql);
        $listaProduto = $query->getResult();

		$this->spedT2Ti->getBlocoH()->getRegistroH001()->setIndMov(0);// com dados
		
		$totalGeral = 0;
		foreach ($listaProduto as $produto) {
			$totalGeral = $totalGeral + ($produto->getQuantidadeEstoque()  * $produto->getValorCompra());
		}

		// REGISTRO H005: TOTAIS DO INVENTÁRIO
		$registroH005 = new EFDRegistroH005();
		$registroH005->setDtInv($this->dataFinal);
		$registroH005->setVlInv($totalGeral);
		$registroH005->setMotInv("0" + $this->inventario);
		$this->spedT2Ti->getBlocoH()->getListaRegistroH005()->add($registroH005);

		foreach ($listaProduto as $produto) {
			$registroH010 = new EFDRegistroH010();

			$registroH010->setCodItem(strval($produto->getId()));
			$registroH010->setUnid(strval($produto->getProdutoUnidade()->getId()));
			$registroH010->setQtd($produto->getQuantidadeEstoque());
			$registroH010->setVlUnit($produto->getValorCompra());
			$registroH010->setVlItem($produto->getQuantidadeEstoque() * $produto->getValorCompra());
			$registroH010->setIndProp("0");

			// $registroH005->getRegistroH010List()->add($registroH010);
		}

		// REGISTRO H020: Informação complementar do Inventário.
		// Implementado a critério do Participante do T2Ti ERP }
	}
	
	// BLOCO 1: OUTRAS INFORMAÇÕES
    public function geraBloco1()
    {
		$this->spedT2Ti->getBloco1()->getRegistro1001()->setIndMov(0);// com dados

		$registro1010 = new EFDRegistro1010();
		$registro1010->setIndExp("N");
		$registro1010->setIndCcrf("N");
		$registro1010->setIndComb("N");
		$registro1010->setIndUsina("N");
		$registro1010->setIndVa("N");
		$registro1010->setIndEe("N");
		$registro1010->setIndCart("N");
		$registro1010->setIndForm("N");
		$registro1010->setIndAer("N");

		$this->spedT2Ti->getBloco1()->addRegistroLista1010($registro1010);
	}
}