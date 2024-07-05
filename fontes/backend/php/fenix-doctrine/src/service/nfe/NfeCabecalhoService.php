<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [NFE_CABECALHO] 
                                                                                
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

class NfeCabecalhoService extends ServiceBase
{
    public static function consultarLista()
    {
        $gerenteConexao = GerenteConexao::getInstance();
        $objetoRepository = $gerenteConexao->entityManager->getRepository('NfeCabecalho');
        return $objetoRepository->findAll();
    }

    public static function consultarListaFiltroValor($filtro)
    {
        
        $gerenteConexao = GerenteConexao::getInstance();
        $sql = "SELECT t FROM NfeCabecalho t WHERE " . $filtro->where;
        $query = $gerenteConexao->entityManager->createQuery($sql);
        
        return $query->getResult();
    }

    public static function consultarObjeto(int $id)
    {
        $gerenteConexao = GerenteConexao::getInstance();
        return $gerenteConexao->entityManager->find('NfeCabecalho', $id);
    }

    public static function salvar($objeto)
    {
        parent::salvarBase($objeto);
    }

    public static function excluir($objeto)
    {
		NfeCabecalhoService::excluirFilhos($objeto);
		parent::excluirBase($objeto);
    }

	public static function excluirFilhos($objeto)
	{
		$gerenteConexao = GerenteConexao::getInstance();
	
		$nfeCana = $objeto->getNfeCana();
		if ($nfeCana != null) {
			$objeto->setNfeCana(null);
			$gerenteConexao->entityManager->remove($nfeCana);
		}

		$nfeDestinatario = $objeto->getNfeDestinatario();
		if ($nfeDestinatario != null) {
			$objeto->setNfeDestinatario(null);
			$gerenteConexao->entityManager->remove($nfeDestinatario);
		}

		$nfeEmitente = $objeto->getNfeEmitente();
		if ($nfeEmitente != null) {
			$objeto->setNfeEmitente(null);
			$gerenteConexao->entityManager->remove($nfeEmitente);
		}

		$nfeFatura = $objeto->getNfeFatura();
		if ($nfeFatura != null) {
			$objeto->setNfeFatura(null);
			$gerenteConexao->entityManager->remove($nfeFatura);
		}

		$nfeInformacaoPagamento = $objeto->getNfeInformacaoPagamento();
		if ($nfeInformacaoPagamento != null) {
			$objeto->setNfeInformacaoPagamento(null);
			$gerenteConexao->entityManager->remove($nfeInformacaoPagamento);
		}

		$nfeLocalEntrega = $objeto->getNfeLocalEntrega();
		if ($nfeLocalEntrega != null) {
			$objeto->setNfeLocalEntrega(null);
			$gerenteConexao->entityManager->remove($nfeLocalEntrega);
		}

		$nfeLocalRetirada = $objeto->getNfeLocalRetirada();
		if ($nfeLocalRetirada != null) {
			$objeto->setNfeLocalRetirada(null);
			$gerenteConexao->entityManager->remove($nfeLocalRetirada);
		}

		$nfeResponsavelTecnico = $objeto->getNfeResponsavelTecnico();
		if ($nfeResponsavelTecnico != null) {
			$objeto->setNfeResponsavelTecnico(null);
			$gerenteConexao->entityManager->remove($nfeResponsavelTecnico);
		}

		$nfeTransporte = $objeto->getNfeTransporte();
		if ($nfeTransporte != null) {
			$objeto->setNfeTransporte(null);
			$gerenteConexao->entityManager->remove($nfeTransporte);
		}

		$listaNfeAcessoXml = $objeto->getListaNfeAcessoXml();
		if ($listaNfeAcessoXml != null) {
			for ($i = 0; $i < count($listaNfeAcessoXml); $i++) {
				$nfeAcessoXml = $listaNfeAcessoXml[$i];
				$gerenteConexao->entityManager->remove($nfeAcessoXml);
			}

		}

		$listaNfeCteReferenciado = $objeto->getListaNfeCteReferenciado();
		if ($listaNfeCteReferenciado != null) {
			for ($i = 0; $i < count($listaNfeCteReferenciado); $i++) {
				$nfeCteReferenciado = $listaNfeCteReferenciado[$i];
				$gerenteConexao->entityManager->remove($nfeCteReferenciado);
			}

		}

		$listaNfeCupomFiscalReferenciado = $objeto->getListaNfeCupomFiscalReferenciado();
		if ($listaNfeCupomFiscalReferenciado != null) {
			for ($i = 0; $i < count($listaNfeCupomFiscalReferenciado); $i++) {
				$nfeCupomFiscalReferenciado = $listaNfeCupomFiscalReferenciado[$i];
				$gerenteConexao->entityManager->remove($nfeCupomFiscalReferenciado);
			}

		}

		$listaNfeDetalhe = $objeto->getListaNfeDetalhe();
		if ($listaNfeDetalhe != null) {
			for ($i = 0; $i < count($listaNfeDetalhe); $i++) {
				$nfeDetalhe = $listaNfeDetalhe[$i];
				$gerenteConexao->entityManager->remove($nfeDetalhe);
			}

		}

		$listaNfeNfReferenciada = $objeto->getListaNfeNfReferenciada();
		if ($listaNfeNfReferenciada != null) {
			for ($i = 0; $i < count($listaNfeNfReferenciada); $i++) {
				$nfeNfReferenciada = $listaNfeNfReferenciada[$i];
				$gerenteConexao->entityManager->remove($nfeNfReferenciada);
			}

		}

		$listaNfeProcessoReferenciado = $objeto->getListaNfeProcessoReferenciado();
		if ($listaNfeProcessoReferenciado != null) {
			for ($i = 0; $i < count($listaNfeProcessoReferenciado); $i++) {
				$nfeProcessoReferenciado = $listaNfeProcessoReferenciado[$i];
				$gerenteConexao->entityManager->remove($nfeProcessoReferenciado);
			}

		}

		$listaNfeProdRuralReferenciada = $objeto->getListaNfeProdRuralReferenciada();
		if ($listaNfeProdRuralReferenciada != null) {
			for ($i = 0; $i < count($listaNfeProdRuralReferenciada); $i++) {
				$nfeProdRuralReferenciada = $listaNfeProdRuralReferenciada[$i];
				$gerenteConexao->entityManager->remove($nfeProdRuralReferenciada);
			}

		}

		$listaNfeReferenciada = $objeto->getListaNfeReferenciada();
		if ($listaNfeReferenciada != null) {
			for ($i = 0; $i < count($listaNfeReferenciada); $i++) {
				$nfeReferenciada = $listaNfeReferenciada[$i];
				$gerenteConexao->entityManager->remove($nfeReferenciada);
			}

		}

	}

    public static function calcularTotais(NfeCabecalho $pNfeCabecalho)
    {
		// inicia variáveis
		$totalProdutos = 0;
		$valorFrete = 0;
		$valorSeguro = 0;
		$valorOutrasDespesas = 0;
		$desconto = 0;
		$baseCalculoIcms = 0;
		$valorIcms = 0;
		$baseCalculoIcmsSt = 0;
		$valorIcmsSt = 0;
		$valorIpi = 0;
		$valorPis = 0;
		$valorCofins = 0;
		// 
		$totalServicos = 0;
		$baseCalculoIssqn = 0;
		$valorIssqn = 0;
		$valorPisIssqn = 0;
		$valorCofinsIssqn = 0;

		//  Pega a empresa
        $gerenteConexao = GerenteConexao::getInstance();
        $empresa = $gerenteConexao->entityManager->find('Empresa', '1');

		//  Se houver CFOP cadastrado na Operação Fiscal, a nota é de serviços
		if ($pNfeCabecalho->getTributOperacaoFiscal()->getCfop() > 0)
		{
			for ($i = 0; $i < count($pNfeCabecalho->getListaNfeDetalhe()); $i++) {
				$nfeDetalhe = $pNfeCabecalho->getListaNfeDetalhe()[$i];
	
				$totalServicos += $nfeDetalhe->getValorTotal();
				$valorFrete += $nfeDetalhe->getValorFrete();
				$valorSeguro += $nfeDetalhe->getValorSeguro();
				$valorOutrasDespesas += $nfeDetalhe->getValorOutrasDespesas();
				$desconto += $nfeDetalhe->getValorDesconto();
				$baseCalculoIssqn += $nfeDetalhe->getNfeDetalheImpostoIssqn()->getBaseCalculoIssqn();
				$valorIssqn += $nfeDetalhe->getNfeDetalheImpostoIssqn()->getValorIssqn();
				$valorPisIssqn += $nfeDetalhe->getNfeDetalheImpostoPis()->getValorPis();
				$valorCofinsIssqn = $valorCofinsIssqn + $valorPisIssqn + $nfeDetalhe->getNfeDetalheImpostoCofins()->getValorCofins();
			}
			// 
			$valorNotaFiscal = $totalServicos + $valorPis + $valorCofins + $valorOutrasDespesas - $desconto;
			$pNfeCabecalho->getValorServicos = $totalServicos;
		}
		else
		{
			$calculoNFe = new CalculoNFe();
			if ($empresa->getCrt() != "")
				$calculoNFe->crtEmissor = $empresa->getCrt();
			$calculoNFe->ufEmissor = $empresa->getCodigoIbgeUf();
			if ($pNfeCabecalho->getNfeDestinatario()->getCnpj() != "")
				$calculoNFe->tipoCliente = "J";
			else
				$calculoNFe->tipoCliente = "F";
			$calculoNFe->ufCliente = $pNfeCabecalho->getNfeDestinatario()->getUf();

			for ($i = 0; $i < count($pNfeCabecalho->getListaNfeDetalhe()); $i++) {
				$nfeDetalhe = $pNfeCabecalho->getListaNfeDetalhe()[$i];

				NfeCabecalhoService::processarCalculosNoItem($calculoNFe, $nfeDetalhe);

				$totalProdutos += $nfeDetalhe->getValorTotal();
				$valorFrete += $nfeDetalhe->getValorFrete();
				$valorSeguro += $nfeDetalhe->getValorSeguro();
				$valorOutrasDespesas += $nfeDetalhe->getValorOutrasDespesas();
				$desconto += $nfeDetalhe->getValorDesconto();
				$baseCalculoIcms += $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBcIcms();
				$valorIcms += $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcms();
				$baseCalculoIcmsSt += $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBaseCalculoIcmsSt();
				$valorIcmsSt += $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcmsSt();
				$valorIpi += $nfeDetalhe->getNfeDetalheImpostoIpi()->getValorIpi();
				$valorPis += $nfeDetalhe->getNfeDetalheImpostoPis()->getValorPis();
				$valorCofins += $nfeDetalhe->getNfeDetalheImpostoCofins()->getValorCofins();
			}
			// 
			$valorNotaFiscal = $totalProdutos + $valorIcmsSt + $valorPis + $valorCofins + $valorIpi + $valorOutrasDespesas - $desconto;
		}

		$pNfeCabecalho->setValorTotalProdutos($totalProdutos);
		$pNfeCabecalho->setValorFrete($valorFrete);
		$pNfeCabecalho->setValorSeguro($valorSeguro);
		$pNfeCabecalho->setValorDespesasAcessorias($valorOutrasDespesas);
		$pNfeCabecalho->setValorDesconto($desconto);
		$pNfeCabecalho->setBaseCalculoIcms($baseCalculoIcms);
		$pNfeCabecalho->setValorIcms($valorIcms);
		$pNfeCabecalho->setBaseCalculoIcmsSt($baseCalculoIcmsSt);
		$pNfeCabecalho->setValorIcmsSt($valorIcmsSt);
		$pNfeCabecalho->setValorIpi($valorIpi);
		$pNfeCabecalho->setValorPis($valorPis);
		$pNfeCabecalho->setValorCofins($valorCofins);
		// 
		$pNfeCabecalho->setBaseCalculoIssqn($baseCalculoIssqn);
		$pNfeCabecalho->setValorIssqn($valorIssqn);
		$pNfeCabecalho->setValorPisIssqn($valorPisIssqn);
		$pNfeCabecalho->setValorCofinsIssqn($valorCofinsIssqn);
		// 
		$pNfeCabecalho->setValorTotal($valorNotaFiscal);
		
    }

	public static function processarCalculosNoItem(CalculoNFe $pCalculoNFe, NfeDetalhe $pNfeDetalhe)
	{
		$pCalculoNFe->valorBrutoProdutos = $pNfeDetalhe->getValorBrutoProduto();
		$pCalculoNFe->valorFrete = $pNfeDetalhe->getValorFrete();
		$pCalculoNFe->valorSeguro = $pNfeDetalhe->getValorSeguro();
		$pCalculoNFe->valorOutrasDespesas = $pNfeDetalhe->getValorOutrasDespesas();
		$pCalculoNFe->valorDesconto = $pNfeDetalhe->getValorDesconto();
		$pCalculoNFe->cstIcms = $pNfeDetalhe->getNfeDetalheImpostoIcms()->getCstIcms();
		$pCalculoNFe->csosn = $pNfeDetalhe->getNfeDetalheImpostoIcms()->getCsosn();
		$pCalculoNFe->modalidadeBcIcms = $pNfeDetalhe->getNfeDetalheImpostoIcms()->getModalidadeBcIcms();
		$pCalculoNFe->taxaReducaoBcIcms = $pNfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualReducaoBcIcms();
		$pCalculoNFe->aliquotaIcms = $pNfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcms();
		$pCalculoNFe->aliquotaIcmsInter = $pNfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcms();
		$pCalculoNFe->modalidadeBcIcmsSt = $pNfeDetalhe->getNfeDetalheImpostoIcms()->getModalidadeBcIcmsSt();
		$pCalculoNFe->percentualMvaIcmsSt = $pNfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualMvaIcmsSt();
		$pCalculoNFe->reducaoBcIcmsSt = $pNfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualReducaoBcIcmsSt();
		$pCalculoNFe->aliquotaIcmsSt = $pNfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcmsSt();
		$pCalculoNFe->aliquotaCreditoIcmsSn = $pNfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaCreditoIcmsSn();
		$pCalculoNFe->cstIpi = $pNfeDetalhe->getNfeDetalheImpostoIpi()->getCstIpi();
		$pCalculoNFe->aliquotaIpi = $pNfeDetalhe->getNfeDetalheImpostoIpi()->getAliquotaIpi();
		$pCalculoNFe->cstPis = $pNfeDetalhe->getNfeDetalheImpostoPis()->getCstPis();
		$pCalculoNFe->aliquotaPis = $pNfeDetalhe->getNfeDetalheImpostoPis()->getAliquotaPisPercentual();
		$pCalculoNFe->aliquotaPisReais = $pNfeDetalhe->getNfeDetalheImpostoPis()->getAliquotaPisReais();
		$pCalculoNFe->cstCofins = $pNfeDetalhe->getNfeDetalheImpostoCofins()->getCstCofins();
		$pCalculoNFe->aliquotaCofins = $pNfeDetalhe->getNfeDetalheImpostoCofins()->getAliquotaCofinsPercentual();
		$pCalculoNFe->aliquotaCofinsReais = $pNfeDetalhe->getNfeDetalheImpostoCofins()->getAliquotaCofinsReais();

		NfeCalculoService::calcular($pCalculoNFe);

		//  Valores ICMS 
		$pNfeDetalhe->getNfeDetalheImpostoIcms()->setValorBcIcms($pCalculoNFe->baseCalculoIcms);
		$pNfeDetalhe->getNfeDetalheImpostoIcms()->setPercentualReducaoBcIcmsSt($pCalculoNFe->reducaoBcIcmsSt);
		$pNfeDetalhe->getNfeDetalheImpostoIcms()->setValorIcms($pCalculoNFe->valorIcms);
		//  valores de ICMS ST
		$pNfeDetalhe->getNfeDetalheImpostoIcms()->setValorBaseCalculoIcmsSt($pCalculoNFe->baseCalculoIcmsSt);
		$pNfeDetalhe->getNfeDetalheImpostoIcms()->setValorIcmsSt($pCalculoNFe->valorIcmsSt);
		//  credito de icmssn
		$pNfeDetalhe->getNfeDetalheImpostoIcms()->setValorCreditoIcmsSn($pCalculoNFe->valorCreditoIcmsSn);

		//  Valores IPI 
		$pNfeDetalhe->getNfeDetalheImpostoIpi()->setValorBaseCalculoIpi($pCalculoNFe->baseCalculoIpi);
		$pNfeDetalhe->getNfeDetalheImpostoIpi()->setValorIpi($pCalculoNFe->valorIpi);

		//  Valores PIS 
		$pNfeDetalhe->getNfeDetalheImpostoPis()->setValorBaseCalculoPis($pCalculoNFe->baseCalculoPis);
		$pNfeDetalhe->getNfeDetalheImpostoPis()->setValorPis($pCalculoNFe->valorPis);

		//  Valores COFINS 
		$pNfeDetalhe->getNfeDetalheImpostoCofins()->setBaseCalculoCofins($pCalculoNFe->baseCalculoCofins);
		$pNfeDetalhe->getNfeDetalheImpostoCofins()->setValorCofins($pCalculoNFe->valorCofins);
	}	


    public static function TransmitirNfe(NfeCabecalho $pNfeCabecalho)
    {
		//  primeiro passo - gerar o arquivo INI com a NF-e
		NfeCabecalhoService::gerarArquivoIniNFe($pNfeCabecalho);
		//  segundo passo - criar o arquivo de entrada com o comando - ex: NFE.CriarEnviarNFe("C:\T2Ti\NFe\ini\000002006.ini", "001", , , , , , "1")
		NfeCabecalhoService::gerarArquivoEntradaNFe($pNfeCabecalho);
		//  terceiro passo - capturar o retorno do arquivo SAI
		return NfeCabecalhoService::pegarRetornoSaidaNFe($pNfeCabecalho);
	}

    public static function gerarArquivoEntradaNFe(NfeCabecalho $pNfeCabecalho)
    {
		//  apaga o arquivo 'SAI.TXT'
		unlink("c:\\ACBrMonitor\\sai.txt");

		//  cria o arquivo 'ENT.TXT'
		$nomeArquivoEntrada = "c:\\ACBrMonitor\\ENT.TXT";
		$arquivoEntrada = fopen($nomeArquivoEntrada, "w");
		fwrite($arquivoEntrada, "NFE.CriarEnviarNFe(\"C:\\T2Ti\\NFe\\ini\\" . $pNfeCabecalho->getNumero() . ".ini\", \"001\", , , , , , \"1\")");
		fclose($arquivoEntrada);
	}

    public static function pegarRetornoSaidaNFe(NfeCabecalho $pNfeCabecalho)
    {
		while (!file_exists("C:\\ACBrMonitor\\sai.txt"))
		{
			//  qual a melhor forma de esperar que um arquivo seja criado?
			//  e se o arquivo nunca for criado, como tratar esse problema?
		}

		return "Nota Fiscal Emitida com Sucesso";

		/// Exercício
		/// Carregue como retorno todo o conteudo da seção [Retorno] do arquivo 'sai.txt'
	}

    public static function gerarArquivoIniNFe(NfeCabecalho $pNfeCabecalho)
    {
		$nomeArquivoIni = "c:\\t2ti\\nfe\\ini\\" . $pNfeCabecalho->getNumero() . ".ini";
		// cria o arquivo
		$arquivo = fopen($nomeArquivoIni, "w");
		fclose($arquivo);

		// carrega o arquivo ini num array
		$NFeIni = parse_ini_file($nomeArquivoIni, true);

		//  Pega a empresa
        $gerenteConexao = GerenteConexao::getInstance();
		$empresa = $gerenteConexao->entityManager->find('Empresa', '1');
		$empresa->enderecoPrincipal = $empresa->getListaEmpresaEndereco()[0]; //TODO: configure o sistema para pegar o endereço principal
		
		// *******************************************************************************************
		//   [infNFe]
		// *******************************************************************************************
		Biblioteca::iniWriteString("infNFe", "versao", "4.00", $NFeIni);

		// *******************************************************************************************
		//   [Identificacao]
		// *******************************************************************************************
		Biblioteca::iniWriteString("Identificacao", "cNF", $pNfeCabecalho->getCodigoNumerico(), $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "natOp", $pNfeCabecalho->getNaturezaOperacao(), $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "mod", "55", $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "serie", "001", $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "nNF", $pNfeCabecalho->getNumero(), $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "dhEmi", '23/06/2020 02:00:00', $NFeIni); // TODO: gere a data no formato esperado
		Biblioteca::iniWriteString("Identificacao", "dhSaiEnt", "", $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "tpNF", $pNfeCabecalho->getTipoOperacao(), $NFeIni);    // 0=Entrada; 1=Saída
		Biblioteca::iniWriteString("Identificacao", "idDest", $pNfeCabecalho->getLocalDestino(), $NFeIni);  //  1=Operação interna; 2=Operação interestadual; 3=Operação com exterior->get
		Biblioteca::iniWriteString("Identificacao", "tpImp", $pNfeCabecalho->getFormatoImpressaoDanfe(), $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "tpEmis", $pNfeCabecalho->getTipoEmissao(), $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "finNFe", $pNfeCabecalho->getFinalidadeEmissao(), $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "indFinal", $pNfeCabecalho->getConsumidorOperacao(), $NFeIni); // 0=Normal; 1=Consumidor final;
		Biblioteca::iniWriteString("Identificacao", "indPres", $pNfeCabecalho->getConsumidorPresenca(), $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "procEmi", $pNfeCabecalho->getProcessoEmissao(), $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "verProc", $pNfeCabecalho->getVersaoProcessoEmissao(), $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "dhCont", "", $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "xJust", "", $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "tpAmb", "2", $NFeIni); //  altera para '1' quando em produção ou trazer de tabela ADM

		// *******************************************************************************************
		//   [Emitente]
		// *******************************************************************************************
		Biblioteca::iniWriteString("Emitente", "CNPJCPF", $empresa->getCnpj(), $NFeIni);
		Biblioteca::iniWriteString("Emitente", "xNome", $empresa->getRazaoSocial(), $NFeIni);
		Biblioteca::iniWriteString("Emitente", "xFant", $empresa->getNomeFantasia(), $NFeIni);
		Biblioteca::iniWriteString("Emitente", "IE", $empresa->getInscricaoEstadual(), $NFeIni);
		Biblioteca::iniWriteString("Emitente", "IEST", "", $NFeIni);
		Biblioteca::iniWriteString("Emitente", "IM", $empresa->getInscricaoMunicipal(), $NFeIni);
		Biblioteca::iniWriteString("Emitente", "CNAE", $empresa->getCodigoCnaePrincipal(), $NFeIni);
		Biblioteca::iniWriteString("Emitente", "CRT", $empresa->getCrt(), $NFeIni);
		Biblioteca::iniWriteString("Emitente", "xLgr", $empresa->enderecoPrincipal->getLogradouro(), $NFeIni);
		Biblioteca::iniWriteString("Emitente", "nro", $empresa->enderecoPrincipal->getNumero(), $NFeIni);
		Biblioteca::iniWriteString("Emitente", "xCpl", $empresa->enderecoPrincipal->getComplemento(), $NFeIni);
		Biblioteca::iniWriteString("Emitente", "xBairro", $empresa->enderecoPrincipal->getBairro(), $NFeIni);
		Biblioteca::iniWriteString("Emitente", "cMun", $empresa->getCodigoIbgeCidade(), $NFeIni);
		Biblioteca::iniWriteString("Emitente", "xMun", $empresa->enderecoPrincipal->getCidade(), $NFeIni);
		Biblioteca::iniWriteString("Emitente", "UF", $empresa->enderecoPrincipal->getUf(), $NFeIni);
		Biblioteca::iniWriteString("Emitente", "CEP", $empresa->enderecoPrincipal->getCep(), $NFeIni);
		Biblioteca::iniWriteString("Emitente", "cPais", "1058", $NFeIni);
		Biblioteca::iniWriteString("Emitente", "xPais", "BRASIL", $NFeIni);
		Biblioteca::iniWriteString("Emitente", "Fone", "", $NFeIni);
		Biblioteca::iniWriteString("Emitente", "cUF", $empresa->getCodigoIbgeUf(), $NFeIni);
		Biblioteca::iniWriteString("Emitente", "cMunFG", "", $NFeIni);

		// *******************************************************************************************
		//   [Destinatario]
		// *******************************************************************************************
		if ($pNfeCabecalho->getNfeDestinatario()->getCnpj() != "")
			Biblioteca::iniWriteString("Destinatario", "CNPJCPF", $pNfeCabecalho->getNfeDestinatario()->getCnpj(), $NFeIni);
		else
			Biblioteca::iniWriteString("Destinatario", "CNPJCPF", $pNfeCabecalho->getNfeDestinatario()->getCpf(), $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "xNome", $pNfeCabecalho->getNfeDestinatario()->getNome(), $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "indIEDest", $pNfeCabecalho->getNfeDestinatario()->getIndicadorIe(), $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "IE", $pNfeCabecalho->getNfeDestinatario()->getInscricaoEstadual(), $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "email", $pNfeCabecalho->getNfeDestinatario()->getEmail(), $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "xLgr", $pNfeCabecalho->getNfeDestinatario()->getLogradouro(), $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "nro", $pNfeCabecalho->getNfeDestinatario()->getNumero(), $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "xCpl", $pNfeCabecalho->getNfeDestinatario()->getComplemento(), $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "xBairro", $pNfeCabecalho->getNfeDestinatario()->getBairro(), $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "cMun", $pNfeCabecalho->getNfeDestinatario()->getCodigoMunicipio(), $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "xMun", $pNfeCabecalho->getNfeDestinatario()->getNomeMunicipio(), $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "UF", $pNfeCabecalho->getNfeDestinatario()->getUf(), $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "CEP", $pNfeCabecalho->getNfeDestinatario()->getCep(), $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "cPais", $pNfeCabecalho->getNfeDestinatario()->getCodigoPais(), $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "xPais", $pNfeCabecalho->getNfeDestinatario()->getNomePais(), $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "Fone", "", $NFeIni);

		// *******************************************************************************************
		//   Detalhes - Produtos e Impostos
		// *******************************************************************************************
		for ($i = 0; $i < count($pNfeCabecalho->getListaNfeDetalhe()); $i++) {
			$nfeDetalhe = $pNfeCabecalho->getListaNfeDetalhe()[$i];
	
			$tamanhoI = strlen(strval($i));
			$incrementoBloco = str_repeat("0", 3 - $tamanhoI) . strval($i+1);  

			// / [Produto]
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "cProd", $nfeDetalhe->getGtin(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "cEAN", $nfeDetalhe->getGtin(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "xProd", $nfeDetalhe->getNomeProduto(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "ncm", $nfeDetalhe->getNcm(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "CEST", $nfeDetalhe->getCest(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "EXTIPI", "", $NFeIni);// $nfeDetalhe->getExtipi(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "CFOP", $nfeDetalhe->getCfop(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "uCom", $nfeDetalhe->getUnidadeComercial(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "qCom", $nfeDetalhe->getQuantidadeComercial(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "vUnCom", $nfeDetalhe->getValorUnitarioComercial(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "vProd", $nfeDetalhe->getValorTotal(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "cEANTrib", $nfeDetalhe->getGtinUnidadeTributavel(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "uTrib", $nfeDetalhe->getUnidadeTributavel(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "qTrib", $nfeDetalhe->getQuantidadeTributavel(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "vUnTrib", $nfeDetalhe->getValorUnitarioTributavel(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "vFrete", $nfeDetalhe->getValorFrete(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "vSeg", $nfeDetalhe->getValorSeguro(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "vDesc", $nfeDetalhe->getValorDesconto(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "vOutro", $nfeDetalhe->getValorOutrasDespesas(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "indTot", $nfeDetalhe->getEntraTotal(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "xPed", $pNfeCabecalho->getCompraPedido(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "nItemPed", $nfeDetalhe->getItemPedidoCompra(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "nFCI", $nfeDetalhe->getNumeroFci(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "nRECOPI", $nfeDetalhe->getNumeroRecopi(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "pDevol", $nfeDetalhe->getPercentualDevolvido(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "vIPIDevol", $nfeDetalhe->getValorIpiDevolvido(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "vTotTrib", $nfeDetalhe->getValorTotalTributos(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "infAdProd", $nfeDetalhe->getInformacoesAdicionais(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "indEscala", $nfeDetalhe->getIndicadorEscalaRelevante(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "CNPJFab", $nfeDetalhe->getCnpjFabricante(), $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "cBenef", $nfeDetalhe->getCodigoBeneficioFiscal(), $NFeIni);

			//  Detalhes -- Impostos 
			//  Se houver CFOP cadastrado na Operação Fiscal, a nota é de serviços
			if ($pNfeCabecalho->getTributOperacaoFiscal()->getCfop() > 0)
			{
				// / [ISSQN]
				Biblioteca::iniWriteString("ISSQN" . $incrementoBloco, "vBC", $nfeDetalhe->getNfeDetalheImpostoIssqn()->getBaseCalculoIssqn(), $NFeIni);
				Biblioteca::iniWriteString("ISSQN" . $incrementoBloco, "vAliq", $nfeDetalhe->getNfeDetalheImpostoIssqn()->getAliquotaIssqn(), $NFeIni);
				Biblioteca::iniWriteString("ISSQN" . $incrementoBloco, "vISSQN", $nfeDetalhe->getNfeDetalheImpostoIssqn()->getValorIssqn(), $NFeIni);
				Biblioteca::iniWriteString("ISSQN" . $incrementoBloco, "cMunFG", $nfeDetalhe->getNfeDetalheImpostoIssqn()->getMunicipioIssqn(), $NFeIni);
				Biblioteca::iniWriteString("ISSQN" . $incrementoBloco, "cListServ", $nfeDetalhe->getNfeDetalheImpostoIssqn()->getItemListaServicos(), $NFeIni);
			}
			else
			{
				// / [ICMS]
				if ($empresa->getCrt() == "1")  // 1-Simples Nacional
				{
					Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "CSOSN", $nfeDetalhe->getNfeDetalheImpostoIcms()->getCsosn(), $NFeIni);

					//  csosn 101
					if ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCsosn() == "101")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->getNfeDetalheImpostoIcms()->getOrigemMercadoria(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pCredSN", $nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaCreditoIcmsSn(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vCredICMSSN", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorCreditoIcmsSn(), $NFeIni);
					}

					//  csosn 102, 103, 300, 400
					else if (($nfeDetalhe->getNfeDetalheImpostoIcms()->getCsosn() == "102")
							|| ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCsosn() == "103")
							|| ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCsosn() == "300")
							|| ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCsosn() == "400"))
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->getNfeDetalheImpostoIcms()->getOrigemMercadoria(), $NFeIni);
					}

					//  csosn 201
					else if ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCsosn() == "201")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->getNfeDetalheImpostoIcms()->getOrigemMercadoria(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getModalidadeBcIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pMVAST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualMvaIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualReducaoBcIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBaseCalculoIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMSST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMSST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pCredSN", $nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaCreditoIcmsSn(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vCredICMSSN", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorCreditoIcmsSn(), $NFeIni);
					}

					//  csosn 202, 203
					else if (($nfeDetalhe->getNfeDetalheImpostoIcms()->getCsosn() == "202")
							|| ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCsosn() == "203"))
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->getNfeDetalheImpostoIcms()->getOrigemMercadoria(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getModalidadeBcIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pMVAST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualMvaIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualReducaoBcIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBaseCalculoIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMSST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMSST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcmsSt(), $NFeIni);
					}

					//  csosn 500
					else if ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCsosn() == "500")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->getNfeDetalheImpostoIcms()->getOrigemMercadoria(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBCSTRet", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBcIcmsStRetido(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMSSTRet", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcmsStRetido(), $NFeIni);
					}

					//  csosn 900
					else if ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCsosn() == "900")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->getNfeDetalheImpostoIcms()->getOrigemMercadoria(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getModalidadeBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualReducaoBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getModalidadeBcIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pMVAST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualMvaIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualReducaoBcIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBaseCalculoIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMSST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMSST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pCredSN", $nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaCreditoIcmsSn(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vCredICMSSN", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorCreditoIcmsSn(), $NFeIni);
					}
				}

				else
				{
					Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "CST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getCstIcms(), $NFeIni);

					//  00 Tributada integralmente
					if ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCstIcms() == "00")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->getNfeDetalheImpostoIcms()->getOrigemMercadoria(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getModalidadeBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcms(), $NFeIni);
					}

					//  10 Tributada e com cobranca do ICMS por ST
					else if ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCstIcms() == "10")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->getNfeDetalheImpostoIcms()->getOrigemMercadoria(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getModalidadeBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getModalidadeBcIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pMVAST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualMvaIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualReducaoBcIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBaseCalculoIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMSST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMSST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcmsSt(), $NFeIni);
					}

					//  20 Tributada com reducao de base de calculo
					else if ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCstIcms() == "20")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->getNfeDetalheImpostoIcms()->getOrigemMercadoria(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getModalidadeBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualReducaoBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcms(), $NFeIni);
					}

					//  30 Isenta ou nao tributada e com cobranca do ICMS por ST
					else if ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCstIcms() == "30")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->getNfeDetalheImpostoIcms()->getOrigemMercadoria(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getModalidadeBcIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pMVAST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualMvaIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualReducaoBcIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBaseCalculoIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMSST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMSST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcmsSt(), $NFeIni);
					}

					//  40 Isenta
					else if ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCstIcms() == "40")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->getNfeDetalheImpostoIcms()->getOrigemMercadoria(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "motDesICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getMotivoDesoneracaoIcms(), $NFeIni);
					}

					//  41 Nao tributada
					else if ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCstIcms() == "41")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->getNfeDetalheImpostoIcms()->getOrigemMercadoria(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "motDesICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getMotivoDesoneracaoIcms(), $NFeIni);
					}

					//  50 Suspencao
					else if ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCstIcms() == "50")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->getNfeDetalheImpostoIcms()->getOrigemMercadoria(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "motDesICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getMotivoDesoneracaoIcms(), $NFeIni);
					}

					//  51 Diferimento preenchimento do ICMS depende da UF
					else if ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCstIcms() == "51")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->getNfeDetalheImpostoIcms()->getOrigemMercadoria(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getModalidadeBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualReducaoBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcms(), $NFeIni);
					}

					//  60 ICMS cobrado anteriormente por ST
					else if ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCstIcms() == "60")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->getNfeDetalheImpostoIcms()->getOrigemMercadoria(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBCSTRet", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBcIcmsStRetido(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMSSTRet", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcmsStRetido(), $NFeIni);
					}

					//  70 ICMS com reducao de base de calculo e cobranca de ICMS por ST
					else if ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCstIcms() == "70")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->getNfeDetalheImpostoIcms()->getOrigemMercadoria(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getModalidadeBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualReducaoBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getModalidadeBcIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pMVAST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualMvaIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualReducaoBcIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBaseCalculoIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMSST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMSST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcmsSt(), $NFeIni);
					}

					//  90 Outros
					else if ($nfeDetalhe->getNfeDetalheImpostoIcms()->getCstIcms() == "90")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->getNfeDetalheImpostoIcms()->getOrigemMercadoria(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getModalidadeBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBC", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualReducaoBcIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcms(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getModalidadeBcIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pMVAST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualMvaIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getPercentualReducaoBcIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBCST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorBaseCalculoIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMSST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getAliquotaIcmsSt(), $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMSST", $nfeDetalhe->getNfeDetalheImpostoIcms()->getValorIcmsSt(), $NFeIni);
					}
					/*
						Cabe a cada participante implementar o seguinte:
						ICMSPart partilha do ICMS entre a UF de Origem e UF de Destino->get->get
						ICMSST Repasse de ICMS ST retido anteriormente em ope->get interestadual->get->get->get
					*/
				}

				// / [IPI]
				Biblioteca::iniWriteString("IPI" . $incrementoBloco, "CST", $nfeDetalhe->getNfeDetalheImpostoIpi()->getCstIpi(), $NFeIni);
				Biblioteca::iniWriteString("IPI" . $incrementoBloco, "vBC", $nfeDetalhe->getNfeDetalheImpostoIpi()->getValorBaseCalculoIpi(), $NFeIni);
				Biblioteca::iniWriteString("IPI" . $incrementoBloco, "pIPI", $nfeDetalhe->getNfeDetalheImpostoIpi()->getAliquotaIpi(), $NFeIni);
				Biblioteca::iniWriteString("IPI" . $incrementoBloco, "vIPI", $nfeDetalhe->getNfeDetalheImpostoIpi()->getValorIpi(), $NFeIni);

				// / [PIS]
				Biblioteca::iniWriteString("PIS" . $incrementoBloco, "CST", $nfeDetalhe->getNfeDetalheImpostoPis()->getCstPis(), $NFeIni);
				Biblioteca::iniWriteString("PIS" . $incrementoBloco, "vBC", $nfeDetalhe->getNfeDetalheImpostoPis()->getValorBaseCalculoPis(), $NFeIni);
				if ($nfeDetalhe->getNfeDetalheImpostoPis()->getCstPis() == "01")
					Biblioteca::iniWriteString("PIS" . $incrementoBloco, "pPIS", $nfeDetalhe->getNfeDetalheImpostoPis()->getAliquotaPisPercentual(), $NFeIni);
				else if ($nfeDetalhe->getNfeDetalheImpostoPis()->getCstPis() == "02")
					Biblioteca::iniWriteString("PIS" . $incrementoBloco, "pPIS", $nfeDetalhe->getNfeDetalheImpostoPis()->getAliquotaPisReais(), $NFeIni);
				Biblioteca::iniWriteString("PIS" . $incrementoBloco, "vPIS", $nfeDetalhe->getNfeDetalheImpostoPis()->getValorPis(), $NFeIni);

				// / [COFINS]
				Biblioteca::iniWriteString("COFINS" . $incrementoBloco, "CST", $nfeDetalhe->getNfeDetalheImpostoCofins()->getCstCofins(), $NFeIni);
				Biblioteca::iniWriteString("COFINS" . $incrementoBloco, "vBC", $nfeDetalhe->getNfeDetalheImpostoCofins()->getBaseCalculoCofins(), $NFeIni);
				if ($nfeDetalhe->getNfeDetalheImpostoCofins()->getCstCofins() == "01")
					Biblioteca::iniWriteString("COFINS" . $incrementoBloco, "pCOFINS", $nfeDetalhe->getNfeDetalheImpostoCofins()->getAliquotaCofinsPercentual(), $NFeIni);
				else if ($nfeDetalhe->getNfeDetalheImpostoCofins()->getCstCofins() == "02")
					Biblioteca::iniWriteString("COFINS" . $incrementoBloco, "pCOFINS", $nfeDetalhe->getNfeDetalheImpostoCofins()->getAliquotaCofinsReais(), $NFeIni);
				Biblioteca::iniWriteString("COFINS" . $incrementoBloco, "vCOFINS", $nfeDetalhe->getNfeDetalheImpostoCofins()->getValorCofins(), $NFeIni);

				// / [II]
				//if (!$nfeDetalhe->getNfeDetalheImpostoIi->getEquals(null))
				//{
				//	Biblioteca::iniWriteString("II" . $incrementoBloco, "vBC", $nfeDetalhe->getNfeDetalheImpostoIi->getValorBcIi(), $NFeIni);
				//	Biblioteca::iniWriteString("II" . $incrementoBloco, "vDespAdu", $nfeDetalhe->getNfeDetalheImpostoIi->getValorDespesasAduaneiras(), $NFeIni);
				//	Biblioteca::iniWriteString("II" . $incrementoBloco, "vII", $nfeDetalhe->getNfeDetalheImpostoIi->getValorImpostoImportacao(), $NFeIni);
				//	Biblioteca::iniWriteString("II" . $incrementoBloco, "vIOF", $nfeDetalhe->getNfeDetalheImpostoIi->getValorIof(), $NFeIni);
				//}

			}
		}

		// *******************************************************************************************
		//   [Total]
		// *******************************************************************************************
		Biblioteca::iniWriteString("Total", "vNF", $pNfeCabecalho->getValorTotal(), $NFeIni);
		Biblioteca::iniWriteString("Total", "vBC", $pNfeCabecalho->getBaseCalculoIcms(), $NFeIni);
		Biblioteca::iniWriteString("Total", "vICMS", $pNfeCabecalho->getValorIcms(), $NFeIni);
		Biblioteca::iniWriteString("Total", "vBCST", $pNfeCabecalho->getBaseCalculoIcmsSt(), $NFeIni);
		Biblioteca::iniWriteString("Total", "vST", $pNfeCabecalho->getValorIcmsSt(), $NFeIni);
		Biblioteca::iniWriteString("Total", "vProd", $pNfeCabecalho->getValorTotalProdutos(), $NFeIni);
		Biblioteca::iniWriteString("Total", "vFrete", $pNfeCabecalho->getValorFrete(), $NFeIni);
		Biblioteca::iniWriteString("Total", "vSeg", $pNfeCabecalho->getValorSeguro(), $NFeIni);
		Biblioteca::iniWriteString("Total", "vDesc", $pNfeCabecalho->getValorDesconto(), $NFeIni);
		Biblioteca::iniWriteString("Total", "vII", $pNfeCabecalho->getValorImpostoImportacao(), $NFeIni);
		Biblioteca::iniWriteString("Total", "vIPI", $pNfeCabecalho->getValorIpi(), $NFeIni);
		Biblioteca::iniWriteString("Total", "vPIS", $pNfeCabecalho->getValorPis(), $NFeIni);
		Biblioteca::iniWriteString("Total", "vCOFINS", $pNfeCabecalho->getValorCofins(), $NFeIni);
		Biblioteca::iniWriteString("Total", "vOutro", $pNfeCabecalho->getValorDespesasAcessorias(), $NFeIni);
		Biblioteca::iniWriteString("Total", "vNF", $pNfeCabecalho->getValorTotal(), $NFeIni);

		// *******************************************************************************************
		//   [ISSQNtot]
		// *******************************************************************************************
		Biblioteca::iniWriteString("ISSQNtot", "vServ", $pNfeCabecalho->getValorServicos(), $NFeIni);
		Biblioteca::iniWriteString("ISSQNtot", "vBC", $pNfeCabecalho->getBaseCalculoIssqn(), $NFeIni);
		Biblioteca::iniWriteString("ISSQNtot", "vISS", $pNfeCabecalho->getValorIssqn(), $NFeIni);
		Biblioteca::iniWriteString("ISSQNtot", "vPIS", $pNfeCabecalho->getValorPisIssqn(), $NFeIni);
		Biblioteca::iniWriteString("ISSQNtot", "vCOFINS", $pNfeCabecalho->getValorCofinsIssqn(), $NFeIni);

		// *******************************************************************************************
		//   [retTrib]
		// *******************************************************************************************
		Biblioteca::iniWriteString("retTrib", "vRetPIS", $pNfeCabecalho->getValorRetidoPis(), $NFeIni);
		Biblioteca::iniWriteString("retTrib", "vRetCOFINS", $pNfeCabecalho->getValorRetidoCofins(), $NFeIni);
		Biblioteca::iniWriteString("retTrib", "vRetCSLL", $pNfeCabecalho->getValorRetidoCsll(), $NFeIni);
		Biblioteca::iniWriteString("retTrib", "vBCIRRF", $pNfeCabecalho->getBaseCalculoIrrf(), $NFeIni);
		Biblioteca::iniWriteString("retTrib", "vIRRF", $pNfeCabecalho->getValorRetidoIrrf(), $NFeIni);
		Biblioteca::iniWriteString("retTrib", "vBCRetPrev", $pNfeCabecalho->getBaseCalculoPrevidencia(), $NFeIni);
		Biblioteca::iniWriteString("retTrib", "vRetPrev", $pNfeCabecalho->getValorRetidoPrevidencia(), $NFeIni);

		// *******************************************************************************************
		//   [PAG]
		// *******************************************************************************************
		Biblioteca::iniWriteString("PAG001", "tpag", "01", $NFeIni);
		Biblioteca::iniWriteString("PAG001", "vPag", $pNfeCabecalho->getValorTotal(), $NFeIni);
		Biblioteca::iniWriteString("PAG001", "indPag", "0", $NFeIni);
		Biblioteca::iniWriteString("PAG001", "vTroco", "0", $NFeIni);

		// *******************************************************************************************
		//   [DadosAdicionais]
		// *******************************************************************************************
		Biblioteca::iniWriteString("DadosAdicionais", "infAdFisco", "", $NFeIni);
		Biblioteca::iniWriteString("DadosAdicionais", "infCpl", "", $NFeIni);
		
		// grava arquivo INI
		Biblioteca::writeIniFile($nomeArquivoIni, $NFeIni);

		// remove aspas
		// TODO: ver se é possível gravar os dados no arquivo INI sem as aspas
		$arquivoComAspas = file_get_contents($nomeArquivoIni);
		$arquivoSemAspas = str_replace('"', '', $arquivoComAspas);
		file_put_contents($nomeArquivoIni, $arquivoSemAspas);
	}


}