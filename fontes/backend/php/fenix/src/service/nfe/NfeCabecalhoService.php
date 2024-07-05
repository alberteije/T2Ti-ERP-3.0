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
use Illuminate\Database\Capsule\Manager as DB;

class NfeCabecalhoService extends ServiceBase
{

	private static $caminhoComCnpj = "C:\\ACBrMonitor\\10793118000178\\";
	
    public static function consultarLista()
    {
		return NfeCabecalho::select()->limit(QUANTIDADE_POR_PAGINA)->get();
    }

    public static function consultarListaFiltroValor($filtro)
    {
		return NfeCabecalho::whereRaw($filtro->where)->get();
    }

    public static function consultarObjeto(int $id)
    {
		return NfeCabecalho::find($id);
    }

 	public static function inserir($objJson, $objEntidade)
	{
		self::calcularTotais($objJson);
		$objEntidade->mapear($objJson);
	    DB::transaction(function () use ($objJson, $objEntidade) {
			$nfeNumero = NfeNumeroService::consultarObjeto(1);
			$objEntidade->numero = sprintf("%09d", $nfeNumero->numero);
			$codigoNumerico = sprintf("%07d", $nfeNumero->numero);
			$codigoNumerico = "9" . $codigoNumerico;
			$objEntidade->codigoNumerico = $codigoNumerico;
			$objEntidade->serie = $nfeNumero->serie;
			$objEntidade->versaoProcessoEmissao = "100";			

			$nfeNumero->numero++;
			$nfeNumero->save();

	        $objEntidade->save();	
			NfeCabecalhoService::atualizarFilhos($objJson, $objEntidade);
	    });
	}

	public static function alterar($objJson, $objBanco)
	{
	    DB::transaction(function () use ($objJson, $objBanco) {
	        $objBanco->save();
	        NfeCabecalhoService::excluirFilhos($objBanco);
	        NfeCabecalhoService::atualizarFilhos($objJson, $objBanco);
	    });
	}
	
	public static function atualizarDetalhes($objJson, $objPersistencia)
	{ // atualizar listaNfeDetalhe
		
	}

	public static function atualizarFilhos($objJson, $objPersistencia)
	{
		// atualizar nfeCana
		if (isset($objJson->nfeCana)) {
		    $nfeCana = new NfeCana();
		    $nfeCana->mapear($objJson->nfeCana);
		    $objPersistencia->nfeCana()->save($nfeCana);
		}

		// atualizar nfeDestinatario
		if (isset($objJson->nfeDestinatario)) {
		    $nfeDestinatario = new NfeDestinatario();
		    $nfeDestinatario->mapear($objJson->nfeDestinatario);
		    $objPersistencia->nfeDestinatario()->save($nfeDestinatario);
		}

		// atualizar nfeEmitente
		if (isset($objJson->nfeEmitente)) {
		    $nfeEmitente = new NfeEmitente();
		    $nfeEmitente->mapear($objJson->nfeEmitente);
		    $objPersistencia->nfeEmitente()->save($nfeEmitente);
		}

		// atualizar nfeFatura
		if (isset($objJson->nfeFatura)) {
		    $nfeFatura = new NfeFatura();
		    $nfeFatura->mapear($objJson->nfeFatura);
		    $objPersistencia->nfeFatura()->save($nfeFatura);
		}

		// atualizar nfeInformacaoPagamento
		if (isset($objJson->nfeInformacaoPagamento)) {
		    $nfeInformacaoPagamento = new NfeInformacaoPagamento();
		    $nfeInformacaoPagamento->mapear($objJson->nfeInformacaoPagamento);
		    $objPersistencia->nfeInformacaoPagamento()->save($nfeInformacaoPagamento);
		}

		// atualizar nfeLocalEntrega
		if (isset($objJson->nfeLocalEntrega)) {
		    $nfeLocalEntrega = new NfeLocalEntrega();
		    $nfeLocalEntrega->mapear($objJson->nfeLocalEntrega);
		    $objPersistencia->nfeLocalEntrega()->save($nfeLocalEntrega);
		}

		// atualizar nfeLocalRetirada
		if (isset($objJson->nfeLocalRetirada)) {
		    $nfeLocalRetirada = new NfeLocalRetirada();
		    $nfeLocalRetirada->mapear($objJson->nfeLocalRetirada);
		    $objPersistencia->nfeLocalRetirada()->save($nfeLocalRetirada);
		}

		// atualizar nfeResponsavelTecnico
		if (isset($objJson->nfeResponsavelTecnico)) {
		    $nfeResponsavelTecnico = new NfeResponsavelTecnico();
		    $nfeResponsavelTecnico->mapear($objJson->nfeResponsavelTecnico);
		    $objPersistencia->nfeResponsavelTecnico()->save($nfeResponsavelTecnico);
		}

		// atualizar nfeTransporte
		if (isset($objJson->nfeTransporte)) {
		    $nfeTransporte = new NfeTransporte();
		    $nfeTransporte->mapear($objJson->nfeTransporte);
		    $objPersistencia->nfeTransporte()->save($nfeTransporte);
		}

		// atualizar listaNfeAcessoXml
		$listaNfeAcessoXmlJson = $objJson->listaNfeAcessoXml;
		if ($listaNfeAcessoXmlJson != null) {
		    for ($i = 0; $i < count($listaNfeAcessoXmlJson); $i++) {
		        $nfeAcessoXml = new NfeAcessoXml();
		        $nfeAcessoXml->mapear($listaNfeAcessoXmlJson[$i]);
		        $objPersistencia->listaNfeAcessoXml()->save($nfeAcessoXml);
		    }
		}

		// atualizar listaNfeCteReferenciado
		$listaNfeCteReferenciadoJson = $objJson->listaNfeCteReferenciado;
		if ($listaNfeCteReferenciadoJson != null) {
		    for ($i = 0; $i < count($listaNfeCteReferenciadoJson); $i++) {
		        $nfeCteReferenciado = new NfeCteReferenciado();
		        $nfeCteReferenciado->mapear($listaNfeCteReferenciadoJson[$i]);
		        $objPersistencia->listaNfeCteReferenciado()->save($nfeCteReferenciado);
		    }
		}

		// atualizar listaNfeCupomFiscalReferenciado
		$listaNfeCupomFiscalReferenciadoJson = $objJson->listaNfeCupomFiscalReferenciado;
		if ($listaNfeCupomFiscalReferenciadoJson != null) {
		    for ($i = 0; $i < count($listaNfeCupomFiscalReferenciadoJson); $i++) {
		        $nfeCupomFiscalReferenciado = new NfeCupomFiscalReferenciado();
		        $nfeCupomFiscalReferenciado->mapear($listaNfeCupomFiscalReferenciadoJson[$i]);
		        $objPersistencia->listaNfeCupomFiscalReferenciado()->save($nfeCupomFiscalReferenciado);
		    }
		}

		// atualizar listaNfeNfReferenciada
		$listaNfeNfReferenciadaJson = $objJson->listaNfeNfReferenciada;
		if ($listaNfeNfReferenciadaJson != null) {
		    for ($i = 0; $i < count($listaNfeNfReferenciadaJson); $i++) {
		        $nfeNfReferenciada = new NfeNfReferenciada();
		        $nfeNfReferenciada->mapear($listaNfeNfReferenciadaJson[$i]);
		        $objPersistencia->listaNfeNfReferenciada()->save($nfeNfReferenciada);
		    }
		}

		// atualizar listaNfeProcessoReferenciado
		$listaNfeProcessoReferenciadoJson = $objJson->listaNfeProcessoReferenciado;
		if ($listaNfeProcessoReferenciadoJson != null) {
		    for ($i = 0; $i < count($listaNfeProcessoReferenciadoJson); $i++) {
		        $nfeProcessoReferenciado = new NfeProcessoReferenciado();
		        $nfeProcessoReferenciado->mapear($listaNfeProcessoReferenciadoJson[$i]);
		        $objPersistencia->listaNfeProcessoReferenciado()->save($nfeProcessoReferenciado);
		    }
		}

		// atualizar listaNfeProdRuralReferenciada
		$listaNfeProdRuralReferenciadaJson = $objJson->listaNfeProdRuralReferenciada;
		if ($listaNfeProdRuralReferenciadaJson != null) {
		    for ($i = 0; $i < count($listaNfeProdRuralReferenciadaJson); $i++) {
		        $nfeProdRuralReferenciada = new NfeProdRuralReferenciada();
		        $nfeProdRuralReferenciada->mapear($listaNfeProdRuralReferenciadaJson[$i]);
		        $objPersistencia->listaNfeProdRuralReferenciada()->save($nfeProdRuralReferenciada);
		    }
		}

		// atualizar listaNfeReferenciada
		$listaNfeReferenciadaJson = $objJson->listaNfeReferenciada;
		if ($listaNfeReferenciadaJson != null) {
		    for ($i = 0; $i < count($listaNfeReferenciadaJson); $i++) {
		        $nfeReferenciada = new NfeReferenciada();
		        $nfeReferenciada->mapear($listaNfeReferenciadaJson[$i]);
		        $objPersistencia->listaNfeReferenciada()->save($nfeReferenciada);
		    }
		}


		$listaNfeDetalheJson = $objJson->listaNfeDetalhe;
		if ($listaNfeDetalheJson != null) {
			for ($i = 0; $i < count($listaNfeDetalheJson); $i++) {
				$nfeDetalhe = new NfeDetalhe();
				$nfeDetalhe->mapear($listaNfeDetalheJson[$i]);
				$produto = $nfeDetalhe->produto;
				$nfeDetalhe->produto()->dissociate();
				$objPersistencia->listaNfeDetalhe()->save($nfeDetalhe);

				//ICMS
				$nfeDetalheImpostoIcms = new NfeDetalheImpostoIcms();
				$nfeDetalheImpostoIcms->mapear($listaNfeDetalheJson[$i]->nfeDetalheImpostoIcms);
				$nfeDetalheImpostoIcms->nfeDetalhe()->associate($nfeDetalhe);
				$nfeDetalheImpostoIcms->save();

				//PIS
				$nfeDetalheImpostoPis = new NfeDetalheImpostoPis();
				$nfeDetalheImpostoPis->mapear($listaNfeDetalheJson[$i]->nfeDetalheImpostoPis);
				$nfeDetalheImpostoPis->nfeDetalhe()->associate($nfeDetalhe);
				$nfeDetalheImpostoPis->save();

				//COFINS
				$nfeDetalheImpostoCofins = new NfeDetalheImpostoCofins();
				$nfeDetalheImpostoCofins->mapear($listaNfeDetalheJson[$i]->nfeDetalheImpostoCofins);
				$nfeDetalheImpostoCofins->nfeDetalhe()->associate($nfeDetalhe);
				$nfeDetalheImpostoCofins->save();	
				
				//IPI
				$nfeDetalheImpostoIpi = new NfeDetalheImpostoIpi();
				$nfeDetalheImpostoIpi->mapear($listaNfeDetalheJson[$i]->nfeDetalheImpostoIpi);
				$nfeDetalheImpostoIpi->nfeDetalhe()->associate($nfeDetalhe);
				$nfeDetalheImpostoIpi->save();				

				if ($objJson->tipoOperacao == '0') { // entrada
					ControleEstoqueService::atualizarEstoque($produto, $nfeDetalhe->quantidadeComercial, 'I');
				} else {
					ControleEstoqueService::atualizarEstoque($produto, $nfeDetalhe->quantidadeComercial, 'D');
				}
			}
		}
	}

	public static function excluir($objeto)
	{
	    DB::transaction(function () use ($objeto) {
	        NfeCabecalhoService::excluirFilhos($objeto);
	        parent::excluir($objeto);
	    });
	}
		
	public static function excluirFilhos($objeto)
	{
		NfeAcessoXml::where('ID_NFE_CABECALHO', $objeto->getIdAttribute())->delete();
		NfeCana::where('ID_NFE_CABECALHO', $objeto->getIdAttribute())->delete();
		NfeCteReferenciado::where('ID_NFE_CABECALHO', $objeto->getIdAttribute())->delete();
		NfeCupomFiscalReferenciado::where('ID_NFE_CABECALHO', $objeto->getIdAttribute())->delete();
		NfeDestinatario::where('ID_NFE_CABECALHO', $objeto->getIdAttribute())->delete();
		NfeDetalhe::where('ID_NFE_CABECALHO', $objeto->getIdAttribute())->delete();
		NfeEmitente::where('ID_NFE_CABECALHO', $objeto->getIdAttribute())->delete();
		NfeFatura::where('ID_NFE_CABECALHO', $objeto->getIdAttribute())->delete();
		NfeInformacaoPagamento::where('ID_NFE_CABECALHO', $objeto->getIdAttribute())->delete();
		NfeLocalEntrega::where('ID_NFE_CABECALHO', $objeto->getIdAttribute())->delete();
		NfeLocalRetirada::where('ID_NFE_CABECALHO', $objeto->getIdAttribute())->delete();
		NfeNfReferenciada::where('ID_NFE_CABECALHO', $objeto->getIdAttribute())->delete();
		NfeProcessoReferenciado::where('ID_NFE_CABECALHO', $objeto->getIdAttribute())->delete();
		NfeProdRuralReferenciada::where('ID_NFE_CABECALHO', $objeto->getIdAttribute())->delete();
		NfeReferenciada::where('ID_NFE_CABECALHO', $objeto->getIdAttribute())->delete();
		NfeResponsavelTecnico::where('ID_NFE_CABECALHO', $objeto->getIdAttribute())->delete();
		NfeTransporte::where('ID_NFE_CABECALHO', $objeto->getIdAttribute())->delete();
	}

    public static function calcularTotais($pNfeCabecalho)
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
        // $gerenteConexao = GerenteConexao::instance;
		$empresa = EmpresaService::consultarObjeto(1);// new Empresa;// $gerenteConexao->entityManager->find('Empresa', '1');

		//  Se houver CFOP cadastrado na Operação Fiscal, a nota é de serviços
		if ($pNfeCabecalho->tributOperacaoFiscal->cfop > 0)
		{
			for ($i = 0; $i < count($pNfeCabecalho->listaNfeDetalhe); $i++) {
				$nfeDetalhe = $pNfeCabecalho->listaNfeDetalhe[$i];
	
				$totalServicos += $nfeDetalhe->valorTotal;
				$valorFrete += $nfeDetalhe->valorFrete;
				$valorSeguro += $nfeDetalhe->valorSeguro;
				$valorOutrasDespesas += $nfeDetalhe->valorOutrasDespesas;
				$desconto += $nfeDetalhe->valorDesconto;
				$baseCalculoIssqn += $nfeDetalhe->nfeDetalheImpostoIssqn->baseCalculoIssqn;
				$valorIssqn += $nfeDetalhe->nfeDetalheImpostoIssqn->valorIssqn;
				$valorPisIssqn += $nfeDetalhe->nfeDetalheImpostoPis->valorPis;
				$valorCofinsIssqn = $valorCofinsIssqn + $valorPisIssqn + $nfeDetalhe->nfeDetalheImpostoCofins->valorCofins;
			}
			// 
			$valorNotaFiscal = $totalServicos + $valorPis + $valorCofins + $valorOutrasDespesas - $desconto;
			$pNfeCabecalho->valorServicos = $totalServicos;
		}
		else
		{
			$calculoNFe = new CalculoNFe;
			if ($empresa->crt != "")
				$calculoNFe->crtEmissor = $empresa->crt;
			$calculoNFe->ufEmissor = $empresa->codigoIbgeUf;
			if ($pNfeCabecalho->nfeDestinatario->cnpj != "")
				$calculoNFe->tipoCliente = "J";
			else
				$calculoNFe->tipoCliente = "F";
			$calculoNFe->ufCliente = $pNfeCabecalho->nfeDestinatario->uf;

			for ($i = 0; $i < count($pNfeCabecalho->listaNfeDetalhe); $i++) {
				$nfeDetalhe = $pNfeCabecalho->listaNfeDetalhe[$i];

				NfeCabecalhoService::processarCalculosNoItem($calculoNFe, $nfeDetalhe);

				$totalProdutos += $nfeDetalhe->valorTotal;
				$valorFrete += $nfeDetalhe->valorFrete;
				$valorSeguro += $nfeDetalhe->valorSeguro;
				$valorOutrasDespesas += $nfeDetalhe->valorOutrasDespesas;
				$desconto += $nfeDetalhe->valorDesconto;
				$baseCalculoIcms += $nfeDetalhe->nfeDetalheImpostoIcms->valorBcIcms;
				$valorIcms += $nfeDetalhe->nfeDetalheImpostoIcms->valorIcms;
				$baseCalculoIcmsSt += $nfeDetalhe->nfeDetalheImpostoIcms->valorBaseCalculoIcmsSt;
				$valorIcmsSt += $nfeDetalhe->nfeDetalheImpostoIcms->valorIcmsSt;
				$valorIpi += $nfeDetalhe->nfeDetalheImpostoIpi->valorIpi;
				$valorPis += $nfeDetalhe->nfeDetalheImpostoPis->valorPis;
				$valorCofins += $nfeDetalhe->nfeDetalheImpostoCofins->valorCofins;
			}
			// 
			$valorNotaFiscal = $totalProdutos + $valorIcmsSt + $valorPis + $valorCofins + $valorIpi + $valorOutrasDespesas - $desconto;
		}

		$pNfeCabecalho->valorTotalProdutos = $totalProdutos;
		$pNfeCabecalho->valorFrete = $valorFrete;
		$pNfeCabecalho->valorSeguro = $valorSeguro;
		$pNfeCabecalho->valorDespesasAcessorias = $valorOutrasDespesas;
		$pNfeCabecalho->valorDesconto = $desconto;
		$pNfeCabecalho->baseCalculoIcms = $baseCalculoIcms;
		$pNfeCabecalho->valorIcms = $valorIcms;
		$pNfeCabecalho->baseCalculoIcmsSt = $baseCalculoIcmsSt;
		$pNfeCabecalho->valorIcmsSt = $valorIcmsSt;
		$pNfeCabecalho->valorIpi = $valorIpi;
		$pNfeCabecalho->valorPis = $valorPis;
		$pNfeCabecalho->valorCofins = $valorCofins;
		// 
		$pNfeCabecalho->baseCalculoIssqn = $baseCalculoIssqn;
		$pNfeCabecalho->valorIssqn = $valorIssqn;
		$pNfeCabecalho->valorPisIssqn = $valorPisIssqn;
		$pNfeCabecalho->valorCofinsIssqn = $valorCofinsIssqn;
		// 
		$pNfeCabecalho->valorTotal = $valorNotaFiscal;
		
    }

	public static function processarCalculosNoItem(CalculoNFe $pCalculoNFe, $pNfeDetalhe)
	{
		$pCalculoNFe->valorBrutoProdutos = $pNfeDetalhe->valorBrutoProduto;
		$pCalculoNFe->valorFrete = $pNfeDetalhe->valorFrete;
		$pCalculoNFe->valorSeguro = $pNfeDetalhe->valorSeguro;
		$pCalculoNFe->valorOutrasDespesas = $pNfeDetalhe->valorOutrasDespesas;
		$pCalculoNFe->valorDesconto = $pNfeDetalhe->valorDesconto;
		$pCalculoNFe->cstIcms = $pNfeDetalhe->nfeDetalheImpostoIcms->cstIcms;
		$pCalculoNFe->csosn = $pNfeDetalhe->nfeDetalheImpostoIcms->csosn;
		$pCalculoNFe->modalidadeBcIcms = $pNfeDetalhe->nfeDetalheImpostoIcms->modalidadeBcIcms;
		$pCalculoNFe->taxaReducaoBcIcms = $pNfeDetalhe->nfeDetalheImpostoIcms->percentualReducaoBcIcms;
		$pCalculoNFe->aliquotaIcms = $pNfeDetalhe->nfeDetalheImpostoIcms->aliquotaIcms;
		$pCalculoNFe->aliquotaIcmsInter = $pNfeDetalhe->nfeDetalheImpostoIcms->aliquotaIcms;
		$pCalculoNFe->modalidadeBcIcmsSt = $pNfeDetalhe->nfeDetalheImpostoIcms->modalidadeBcIcmsSt;
		$pCalculoNFe->percentualMvaIcmsSt = $pNfeDetalhe->nfeDetalheImpostoIcms->percentualMvaIcmsSt;
		$pCalculoNFe->reducaoBcIcmsSt = $pNfeDetalhe->nfeDetalheImpostoIcms->percentualReducaoBcIcmsSt;
		$pCalculoNFe->aliquotaIcmsSt = $pNfeDetalhe->nfeDetalheImpostoIcms->aliquotaIcmsSt;
		$pCalculoNFe->aliquotaCreditoIcmsSn = $pNfeDetalhe->nfeDetalheImpostoIcms->aliquotaCreditoIcmsSn;
		$pCalculoNFe->cstIpi = $pNfeDetalhe->nfeDetalheImpostoIpi->cstIpi;
		$pCalculoNFe->aliquotaIpi = $pNfeDetalhe->nfeDetalheImpostoIpi->aliquotaIpi;
		$pCalculoNFe->cstPis = $pNfeDetalhe->nfeDetalheImpostoPis->cstPis;
		$pCalculoNFe->aliquotaPis = $pNfeDetalhe->nfeDetalheImpostoPis->aliquotaPisPercentual;
		$pCalculoNFe->aliquotaPisReais = $pNfeDetalhe->nfeDetalheImpostoPis->aliquotaPisReais;
		$pCalculoNFe->cstCofins = $pNfeDetalhe->nfeDetalheImpostoCofins->cstCofins;
		$pCalculoNFe->aliquotaCofins = $pNfeDetalhe->nfeDetalheImpostoCofins->aliquotaCofinsPercentual;
		$pCalculoNFe->aliquotaCofinsReais = $pNfeDetalhe->nfeDetalheImpostoCofins->aliquotaCofinsReais;

		NfeCalculoService::calcular($pCalculoNFe);

		//  Valores ICMS 
		$pNfeDetalhe->nfeDetalheImpostoIcms->valorBcIcms = $pCalculoNFe->baseCalculoIcms;
		$pNfeDetalhe->nfeDetalheImpostoIcms->percentualReducaoBcIcmsSt = $pCalculoNFe->reducaoBcIcmsSt;
		$pNfeDetalhe->nfeDetalheImpostoIcms->valorIcms = $pCalculoNFe->valorIcms;
		//  valores de ICMS ST
		$pNfeDetalhe->nfeDetalheImpostoIcms->valorBaseCalculoIcmsSt = $pCalculoNFe->baseCalculoIcmsSt;
		$pNfeDetalhe->nfeDetalheImpostoIcms->valorIcmsSt = $pCalculoNFe->valorIcmsSt;
		//  credito de icmssn
		$pNfeDetalhe->nfeDetalheImpostoIcms->valorCreditoIcmsSn = $pCalculoNFe->valorCreditoIcmsSn;

		//  Valores IPI 
		$pNfeDetalhe->nfeDetalheImpostoIpi->valorBaseCalculoIpi = $pCalculoNFe->baseCalculoIpi;
		$pNfeDetalhe->nfeDetalheImpostoIpi->valorIpi = $pCalculoNFe->valorIpi;

		//  Valores PIS 
		$pNfeDetalhe->nfeDetalheImpostoPis->valorBaseCalculoPis = $pCalculoNFe->baseCalculoPis;
		$pNfeDetalhe->nfeDetalheImpostoPis->valorPis = $pCalculoNFe->valorPis;

		//  Valores COFINS 
		$pNfeDetalhe->nfeDetalheImpostoCofins->baseCalculoCofins = $pCalculoNFe->baseCalculoCofins;
		$pNfeDetalhe->nfeDetalheImpostoCofins->valorCofins = $pCalculoNFe->valorCofins;
	}	


    public static function TransmitirNfe(NfeCabecalho $pNfeCabecalho)
    {
		//  primeiro passo - gerar o arquivo INI com a NF-e
		$caminhoArquivoIni = self::gerarArquivoIniNFe($pNfeCabecalho);
		
		// chama o método para criar a nota
		self::criarNFe($caminhoArquivoIni);
		// pega o caminho do XML criado
		$caminhoArquivoXml = self::pegarRetornoSaida("ARQUIVO-XML");
		if (str_contains($caminhoArquivoXml, "ERRO")) {
			return $caminhoArquivoXml;
		}

		// chama o método para criar e enviar a nota
		self::enviarNFe($caminhoArquivoXml);
		$retorno = self::pegarRetornoSaida("Envio");
		if (!str_contains($retorno, "ERRO")) {
			// chama o método para gerar o PDF
        	self::imprimirDanfe($caminhoArquivoXml);
		    // captura o retorno do arquivo SAI
		    $retorno = self::pegarRetornoSaida("ARQUIVO-PDF");

			// se chegou aqui, atualiza a chave de acesso e o status da nota
			$pNfeCabecalho->statusNota = "4";
			$chave = strrev($retorno);
			$chave = substr($chave, strrpos($chave, "-")+1, 44);
			$chave = strrev($chave);
			$pNfeCabecalho->chaveAcesso = $chave;
			$pNfeCabecalho->digitoChaveAcesso = substr($chave, -1);
			
			DB::transaction(function () use ($pNfeCabecalho) {
				$pNfeCabecalho->save();
			});
		}		
		return $retorno;
	}

	public static function gerarPdfDanfe($chave)
	{
		  // pega o caminho do arquivo XML da nota em contingência
		  $caminhoArquivoXml = self::$caminhoComCnpj . "LOG_NFe\\" . $chave . "-nfe.xml";
		  // chama o método para gerar o PDF
		  self::imprimirDanfe($caminhoArquivoXml);
		  // captura o retorno do arquivo SAI
		  return self::pegarRetornoSaida("ARQUIVO-PDF");	
	}  

	public static function criarNFe($caminhoArquivoIniNfce)
	{
	  self::apagarArquivoSaida();
	  self::gerarArquivoEntrada("NFE.CriarNFe(" . $caminhoArquivoIniNfce . ")");
	  self::aguardarArquivoSaida();    
	}
  
	public static function enviarNFe($caminhoArquivoXml)
	{
	  self::apagarArquivoSaida();
	  self::gerarArquivoEntrada("NFE.EnviarNFe(" . $caminhoArquivoXml . ", 001, , , , 1, , )");
	  self::aguardarArquivoSaida();    
	}
  
	public static function imprimirDanfe($caminhoArquivoXml)
	{
	  self::apagarArquivoSaida();
	  self::gerarArquivoEntrada("NFE.ImprimirDANFEPDF(" . $caminhoArquivoXml . ", , , 1,)");
	  self::aguardarArquivoSaida();    
	}

	public static function gerarArquivoEntrada($comando)
	{
	  $nomeArquivoEntrada = self::$caminhoComCnpj . "\\ent.txt";
	  $arquivoEntrada = fopen($nomeArquivoEntrada, "w");
	  fwrite($arquivoEntrada, $comando);
	  fclose($arquivoEntrada);
	}
  
	public static function pegarRetornoSaida($operacao)
	{
	  $retorno = '';
  
	  $nomeArquivoIni = self::$caminhoComCnpj . 'sai.txt';
	  $arquivoCompleto = file_get_contents($nomeArquivoIni);
  
	  $codigoStatus = Biblioteca::IniReadString($operacao, "CStat", $nomeArquivoIni);
	  $motivo = Biblioteca::IniReadString($operacao, "XMotivo", $nomeArquivoIni);
  
	  $caminhoArquivoXml = '';
  
	  if ($operacao === 'ARQUIVO-XML') {
		$caminhoArquivoXml = $arquivoCompleto;
		$caminhoArquivoXml = trim(str_replace('OK: ', '', $caminhoArquivoXml));
		return $caminhoArquivoXml;
	  }
	  if ($operacao === 'ARQUIVO-PDF') {
		$retorno = $arquivoCompleto;
		$retorno = trim(str_replace('OK: Arquivo criado em: ', '', $arquivoCompleto));
		return $retorno;
	  }
	  if ($operacao === 'Envio') {
		$retorno = $motivo;
	  }
	  if ($operacao === 'Cancelamento') {
		$retorno = $motivo;
	  }
	  if ($operacao === 'Consulta') {
		$retorno = $motivo;
	  }
	  if ($operacao === 'Inutilizacao') {
		return $arquivoCompleto;
	  }
  
	  $listaStatus = array("", "100", "102", "135"); // se o status não for um dos que estiverem nessa lista, vamos retornar um erro.
	  if (!in_array($codigoStatus, $listaStatus)) {
		return "[ERRO] - [" . $codigoStatus . "] " . $motivo;
	  }
  
	  return $retorno;
	}
  
	public static function apagarArquivoSaida()
	{
	  unlink(self::$caminhoComCnpj . "\\sai.txt");
	}
  
	public static function aguardarArquivoSaida()
	{
	  sleep(1);
	  $tempoEspera = 0;
	  while (!file_exists(self::$caminhoComCnpj . "\\sai.txt")) {
		sleep(1);
		$tempoEspera = $tempoEspera + 1;
  
		if ($tempoEspera > 30) {
		  return false;
		}
	  }
	  return true;
	}
  
    public static function gerarArquivoIniNFe(NfeCabecalho $pNfeCabecalho)
    {
		$nomeArquivoIni = "c:\\t2ti\\nfe\\ini\\" . $pNfeCabecalho->numero . ".ini";
		// cria o arquivo
		$arquivo = fopen($nomeArquivoIni, "w");
		fclose($arquivo);

		// carrega o arquivo ini num array
		$NFeIni = parse_ini_file($nomeArquivoIni, true);

		//  Pega a empresa
		$empresa = EmpresaService::consultarObjeto(1); 
		$empresa->enderecoPrincipal = $empresa->listaEmpresaEndereco[0]; 
		
		// *******************************************************************************************
		//   [infNFe]
		// *******************************************************************************************
		Biblioteca::iniWriteString("infNFe", "versao", "4.00", $NFeIni);

		// *******************************************************************************************
		//   [Identificacao]
		// *******************************************************************************************
		Biblioteca::iniWriteString("Identificacao", "cNF", $pNfeCabecalho->codigoNumerico, $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "natOp", $pNfeCabecalho->naturezaOperacao, $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "mod", "55", $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "serie", $pNfeCabecalho->serie, $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "nNF", $pNfeCabecalho->numero, $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "dhEmi", date("d-m-Y H:i:s", strtotime($pNfeCabecalho->dataHoraEmissao)), $NFeIni); 
		Biblioteca::iniWriteString("Identificacao", "dhSaiEnt", "", $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "tpNF", $pNfeCabecalho->tipoOperacao, $NFeIni);    // 0=Entrada; 1=Saída
		Biblioteca::iniWriteString("Identificacao", "idDest", $pNfeCabecalho->localDestino, $NFeIni);  //  1=Operação interna; 2=Operação interestadual; 3=Operação com exterior->get
		Biblioteca::iniWriteString("Identificacao", "tpImp", $pNfeCabecalho->formatoImpressaoDanfe, $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "tpEmis", $pNfeCabecalho->tipoEmissao, $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "finNFe", $pNfeCabecalho->finalidadeEmissao, $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "indFinal", $pNfeCabecalho->consumidorOperacao, $NFeIni); // 0=Normal; 1=Consumidor final;
		Biblioteca::iniWriteString("Identificacao", "indPres", $pNfeCabecalho->consumidorPresenca, $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "procEmi", $pNfeCabecalho->processoEmissao, $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "verProc", $pNfeCabecalho->versaoProcessoEmissao, $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "dhCont", "", $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "xJust", "", $NFeIni);
		Biblioteca::iniWriteString("Identificacao", "tpAmb", "2", $NFeIni); //  altera para '1' quando em produção ou trazer de tabela ADM

		// *******************************************************************************************
		//   [Emitente]
		// *******************************************************************************************
		Biblioteca::iniWriteString("Emitente", "CNPJCPF", $empresa->cnpj, $NFeIni);
		Biblioteca::iniWriteString("Emitente", "xNome", $empresa->razaoSocial, $NFeIni);
		Biblioteca::iniWriteString("Emitente", "xFant", $empresa->nomeFantasia, $NFeIni);
		Biblioteca::iniWriteString("Emitente", "IE", $empresa->inscricaoEstadual, $NFeIni);
		Biblioteca::iniWriteString("Emitente", "IEST", "", $NFeIni);
		Biblioteca::iniWriteString("Emitente", "IM", $empresa->inscricaoMunicipal, $NFeIni);
		Biblioteca::iniWriteString("Emitente", "CNAE", $empresa->codigoCnaePrincipal, $NFeIni);
		Biblioteca::iniWriteString("Emitente", "CRT", $empresa->crt, $NFeIni);
		Biblioteca::iniWriteString("Emitente", "xLgr", $empresa->enderecoPrincipal->logradouro, $NFeIni);
		Biblioteca::iniWriteString("Emitente", "nro", $empresa->enderecoPrincipal->numero, $NFeIni);
		Biblioteca::iniWriteString("Emitente", "xCpl", $empresa->enderecoPrincipal->complemento, $NFeIni);
		Biblioteca::iniWriteString("Emitente", "xBairro", $empresa->enderecoPrincipal->bairro, $NFeIni);
		Biblioteca::iniWriteString("Emitente", "cMun", $empresa->codigoIbgeCidade, $NFeIni);
		Biblioteca::iniWriteString("Emitente", "xMun", $empresa->enderecoPrincipal->cidade, $NFeIni);
		Biblioteca::iniWriteString("Emitente", "UF", $empresa->enderecoPrincipal->uf, $NFeIni);
		Biblioteca::iniWriteString("Emitente", "CEP", $empresa->enderecoPrincipal->cep, $NFeIni);
		Biblioteca::iniWriteString("Emitente", "cPais", "1058", $NFeIni);
		Biblioteca::iniWriteString("Emitente", "xPais", "BRASIL", $NFeIni);
		Biblioteca::iniWriteString("Emitente", "Fone", "", $NFeIni);
		Biblioteca::iniWriteString("Emitente", "cUF", $empresa->codigoIbgeUf, $NFeIni);
		Biblioteca::iniWriteString("Emitente", "cMunFG", "", $NFeIni);

		// *******************************************************************************************
		//   [Destinatario]
		// *******************************************************************************************
		if ($pNfeCabecalho->nfeDestinatario->cnpj != "")
			Biblioteca::iniWriteString("Destinatario", "CNPJCPF", $pNfeCabecalho->nfeDestinatario->cnpj, $NFeIni);
		else
			Biblioteca::iniWriteString("Destinatario", "CNPJCPF", $pNfeCabecalho->nfeDestinatario->cpf, $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "xNome", $pNfeCabecalho->nfeDestinatario->nome, $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "indIEDest", $pNfeCabecalho->nfeDestinatario->indicadorIe, $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "IE", $pNfeCabecalho->nfeDestinatario->inscricaoEstadual, $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "email", $pNfeCabecalho->nfeDestinatario->email, $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "xLgr", $pNfeCabecalho->nfeDestinatario->logradouro, $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "nro", $pNfeCabecalho->nfeDestinatario->numero, $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "xCpl", $pNfeCabecalho->nfeDestinatario->complemento, $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "xBairro", $pNfeCabecalho->nfeDestinatario->bairro, $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "cMun", $pNfeCabecalho->nfeDestinatario->codigoMunicipio, $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "xMun", $pNfeCabecalho->nfeDestinatario->nomeMunicipio, $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "UF", $pNfeCabecalho->nfeDestinatario->uf, $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "CEP", $pNfeCabecalho->nfeDestinatario->cep, $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "cPais", $pNfeCabecalho->nfeDestinatario->codigoPais, $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "xPais", $pNfeCabecalho->nfeDestinatario->nomePais, $NFeIni);
		Biblioteca::iniWriteString("Destinatario", "Fone", "", $NFeIni);

		// *******************************************************************************************
		//   Detalhes - Produtos e Impostos
		// *******************************************************************************************
		for ($i = 0; $i < count($pNfeCabecalho->listaNfeDetalhe); $i++) {
			$nfeDetalhe = $pNfeCabecalho->listaNfeDetalhe[$i];
	
			$tamanhoI = strlen(strval($i));
			$incrementoBloco = str_repeat("0", 3 - $tamanhoI) . strval($i+1);  

			// / [Produto]
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "cProd", $nfeDetalhe->gtin, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "cEAN", $nfeDetalhe->gtin, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "xProd", $nfeDetalhe->nomeProduto, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "ncm", $nfeDetalhe->ncm, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "CEST", $nfeDetalhe->cest, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "EXTIPI", "", $NFeIni);// $nfeDetalhe->extipi, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "CFOP", $nfeDetalhe->cfop, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "uCom", $nfeDetalhe->unidadeComercial, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "qCom", $nfeDetalhe->quantidadeComercial, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "vUnCom", $nfeDetalhe->valorUnitarioComercial, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "vProd", $nfeDetalhe->valorTotal, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "cEANTrib", $nfeDetalhe->gtinUnidadeTributavel, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "uTrib", $nfeDetalhe->unidadeTributavel, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "qTrib", $nfeDetalhe->quantidadeTributavel, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "vUnTrib", $nfeDetalhe->valorUnitarioTributavel, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "vFrete", $nfeDetalhe->valorFrete, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "vSeg", $nfeDetalhe->valorSeguro, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "vDesc", $nfeDetalhe->valorDesconto, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "vOutro", $nfeDetalhe->valorOutrasDespesas, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "indTot", $nfeDetalhe->entraTotal, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "xPed", $pNfeCabecalho->compraPedido, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "nItemPed", $nfeDetalhe->itemPedidoCompra, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "nFCI", $nfeDetalhe->numeroFci, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "nRECOPI", $nfeDetalhe->numeroRecopi, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "pDevol", $nfeDetalhe->percentualDevolvido, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "vIPIDevol", $nfeDetalhe->valorIpiDevolvido, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "vTotTrib", $nfeDetalhe->valorTotalTributos, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "infAdProd", $nfeDetalhe->informacoesAdicionais, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "indEscala", $nfeDetalhe->indicadorEscalaRelevante, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "CNPJFab", $nfeDetalhe->cnpjFabricante, $NFeIni);
			Biblioteca::iniWriteString("Produto" . $incrementoBloco, "cBenef", $nfeDetalhe->codigoBeneficioFiscal, $NFeIni);

			//  Detalhes -- Impostos 
			//  Se houver CFOP cadastrado na Operação Fiscal, a nota é de serviços
			if ($pNfeCabecalho->tributOperacaoFiscal->cfop > 0)
			{
				// / [ISSQN]
				Biblioteca::iniWriteString("ISSQN" . $incrementoBloco, "vBC", $nfeDetalhe->nfeDetalheImpostoIssqn->baseCalculoIssqn, $NFeIni);
				Biblioteca::iniWriteString("ISSQN" . $incrementoBloco, "vAliq", $nfeDetalhe->nfeDetalheImpostoIssqn->aliquotaIssqn, $NFeIni);
				Biblioteca::iniWriteString("ISSQN" . $incrementoBloco, "vISSQN", $nfeDetalhe->nfeDetalheImpostoIssqn->valorIssqn, $NFeIni);
				Biblioteca::iniWriteString("ISSQN" . $incrementoBloco, "cMunFG", $nfeDetalhe->nfeDetalheImpostoIssqn->municipioIssqn, $NFeIni);
				Biblioteca::iniWriteString("ISSQN" . $incrementoBloco, "cListServ", $nfeDetalhe->nfeDetalheImpostoIssqn->itemListaServicos, $NFeIni);
			}
			else
			{
				// / [ICMS]
				if ($empresa->crt == "1")  // 1-Simples Nacional
				{
					Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "CSOSN", $nfeDetalhe->nfeDetalheImpostoIcms->csosn, $NFeIni);

					//  csosn 101
					if ($nfeDetalhe->nfeDetalheImpostoIcms->csosn == "101")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->nfeDetalheImpostoIcms->origemMercadoria, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pCredSN", $nfeDetalhe->nfeDetalheImpostoIcms->aliquotaCreditoIcmsSn, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vCredICMSSN", $nfeDetalhe->nfeDetalheImpostoIcms->valorCreditoIcmsSn, $NFeIni);
					}

					//  csosn 102, 103, 300, 400
					else if (($nfeDetalhe->nfeDetalheImpostoIcms->csosn == "102")
							|| ($nfeDetalhe->nfeDetalheImpostoIcms->csosn == "103")
							|| ($nfeDetalhe->nfeDetalheImpostoIcms->csosn == "300")
							|| ($nfeDetalhe->nfeDetalheImpostoIcms->csosn == "400"))
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->nfeDetalheImpostoIcms->origemMercadoria, $NFeIni);
					}

					//  csosn 201
					else if ($nfeDetalhe->nfeDetalheImpostoIcms->csosn == "201")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->nfeDetalheImpostoIcms->origemMercadoria, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBCST", $nfeDetalhe->nfeDetalheImpostoIcms->modalidadeBcIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pMVAST", $nfeDetalhe->nfeDetalheImpostoIcms->percentualMvaIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBCST", $nfeDetalhe->nfeDetalheImpostoIcms->percentualReducaoBcIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBCST", $nfeDetalhe->nfeDetalheImpostoIcms->valorBaseCalculoIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMSST", $nfeDetalhe->nfeDetalheImpostoIcms->aliquotaIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMSST", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pCredSN", $nfeDetalhe->nfeDetalheImpostoIcms->aliquotaCreditoIcmsSn, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vCredICMSSN", $nfeDetalhe->nfeDetalheImpostoIcms->valorCreditoIcmsSn, $NFeIni);
					}

					//  csosn 202, 203
					else if (($nfeDetalhe->nfeDetalheImpostoIcms->csosn == "202")
							|| ($nfeDetalhe->nfeDetalheImpostoIcms->csosn == "203"))
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->nfeDetalheImpostoIcms->origemMercadoria, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBCST", $nfeDetalhe->nfeDetalheImpostoIcms->modalidadeBcIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pMVAST", $nfeDetalhe->nfeDetalheImpostoIcms->percentualMvaIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBCST", $nfeDetalhe->nfeDetalheImpostoIcms->percentualReducaoBcIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBCST", $nfeDetalhe->nfeDetalheImpostoIcms->valorBaseCalculoIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMSST", $nfeDetalhe->nfeDetalheImpostoIcms->aliquotaIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMSST", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcmsSt, $NFeIni);
					}

					//  csosn 500
					else if ($nfeDetalhe->nfeDetalheImpostoIcms->csosn == "500")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->nfeDetalheImpostoIcms->origemMercadoria, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBCSTRet", $nfeDetalhe->nfeDetalheImpostoIcms->valorBcIcmsStRetido, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMSSTRet", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcmsStRetido, $NFeIni);
					}

					//  csosn 900
					else if ($nfeDetalhe->nfeDetalheImpostoIcms->csosn == "900")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->nfeDetalheImpostoIcms->origemMercadoria, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBC", $nfeDetalhe->nfeDetalheImpostoIcms->modalidadeBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBC", $nfeDetalhe->nfeDetalheImpostoIcms->valorBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBC", $nfeDetalhe->nfeDetalheImpostoIcms->percentualReducaoBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMS", $nfeDetalhe->nfeDetalheImpostoIcms->aliquotaIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBCST", $nfeDetalhe->nfeDetalheImpostoIcms->modalidadeBcIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pMVAST", $nfeDetalhe->nfeDetalheImpostoIcms->percentualMvaIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBCST", $nfeDetalhe->nfeDetalheImpostoIcms->percentualReducaoBcIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBCST", $nfeDetalhe->nfeDetalheImpostoIcms->valorBaseCalculoIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMSST", $nfeDetalhe->nfeDetalheImpostoIcms->aliquotaIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMSST", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pCredSN", $nfeDetalhe->nfeDetalheImpostoIcms->aliquotaCreditoIcmsSn, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vCredICMSSN", $nfeDetalhe->nfeDetalheImpostoIcms->valorCreditoIcmsSn, $NFeIni);
					}
				}

				else
				{
					Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "CST", $nfeDetalhe->nfeDetalheImpostoIcms->cstIcms, $NFeIni);

					//  00 Tributada integralmente
					if ($nfeDetalhe->nfeDetalheImpostoIcms->cstIcms == "00")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->nfeDetalheImpostoIcms->origemMercadoria, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBC", $nfeDetalhe->nfeDetalheImpostoIcms->modalidadeBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBC", $nfeDetalhe->nfeDetalheImpostoIcms->valorBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMS", $nfeDetalhe->nfeDetalheImpostoIcms->aliquotaIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcms, $NFeIni);
					}

					//  10 Tributada e com cobranca do ICMS por ST
					else if ($nfeDetalhe->nfeDetalheImpostoIcms->cstIcms == "10")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->nfeDetalheImpostoIcms->origemMercadoria, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBC", $nfeDetalhe->nfeDetalheImpostoIcms->modalidadeBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBC", $nfeDetalhe->nfeDetalheImpostoIcms->valorBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMS", $nfeDetalhe->nfeDetalheImpostoIcms->aliquotaIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBCST", $nfeDetalhe->nfeDetalheImpostoIcms->modalidadeBcIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pMVAST", $nfeDetalhe->nfeDetalheImpostoIcms->percentualMvaIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBCST", $nfeDetalhe->nfeDetalheImpostoIcms->percentualReducaoBcIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBCST", $nfeDetalhe->nfeDetalheImpostoIcms->valorBaseCalculoIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMSST", $nfeDetalhe->nfeDetalheImpostoIcms->aliquotaIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMSST", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcmsSt, $NFeIni);
					}

					//  20 Tributada com reducao de base de calculo
					else if ($nfeDetalhe->nfeDetalheImpostoIcms->cstIcms == "20")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->nfeDetalheImpostoIcms->origemMercadoria, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBC", $nfeDetalhe->nfeDetalheImpostoIcms->modalidadeBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBC", $nfeDetalhe->nfeDetalheImpostoIcms->percentualReducaoBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBC", $nfeDetalhe->nfeDetalheImpostoIcms->valorBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMS", $nfeDetalhe->nfeDetalheImpostoIcms->aliquotaIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcms, $NFeIni);
					}

					//  30 Isenta ou nao tributada e com cobranca do ICMS por ST
					else if ($nfeDetalhe->nfeDetalheImpostoIcms->cstIcms == "30")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->nfeDetalheImpostoIcms->origemMercadoria, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBCST", $nfeDetalhe->nfeDetalheImpostoIcms->modalidadeBcIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pMVAST", $nfeDetalhe->nfeDetalheImpostoIcms->percentualMvaIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBCST", $nfeDetalhe->nfeDetalheImpostoIcms->percentualReducaoBcIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBCST", $nfeDetalhe->nfeDetalheImpostoIcms->valorBaseCalculoIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMSST", $nfeDetalhe->nfeDetalheImpostoIcms->aliquotaIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMSST", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcmsSt, $NFeIni);
					}

					//  40 Isenta
					else if ($nfeDetalhe->nfeDetalheImpostoIcms->cstIcms == "40")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->nfeDetalheImpostoIcms->origemMercadoria, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "motDesICMS", $nfeDetalhe->nfeDetalheImpostoIcms->motivoDesoneracaoIcms, $NFeIni);
					}

					//  41 Nao tributada
					else if ($nfeDetalhe->nfeDetalheImpostoIcms->cstIcms == "41")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->nfeDetalheImpostoIcms->origemMercadoria, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "motDesICMS", $nfeDetalhe->nfeDetalheImpostoIcms->motivoDesoneracaoIcms, $NFeIni);
					}

					//  50 Suspencao
					else if ($nfeDetalhe->nfeDetalheImpostoIcms->cstIcms == "50")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->nfeDetalheImpostoIcms->origemMercadoria, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "motDesICMS", $nfeDetalhe->nfeDetalheImpostoIcms->motivoDesoneracaoIcms, $NFeIni);
					}

					//  51 Diferimento preenchimento do ICMS depende da UF
					else if ($nfeDetalhe->nfeDetalheImpostoIcms->cstIcms == "51")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->nfeDetalheImpostoIcms->origemMercadoria, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBC", $nfeDetalhe->nfeDetalheImpostoIcms->modalidadeBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBC", $nfeDetalhe->nfeDetalheImpostoIcms->percentualReducaoBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBC", $nfeDetalhe->nfeDetalheImpostoIcms->valorBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMS", $nfeDetalhe->nfeDetalheImpostoIcms->aliquotaIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcms, $NFeIni);
					}

					//  60 ICMS cobrado anteriormente por ST
					else if ($nfeDetalhe->nfeDetalheImpostoIcms->cstIcms == "60")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->nfeDetalheImpostoIcms->origemMercadoria, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBCSTRet", $nfeDetalhe->nfeDetalheImpostoIcms->valorBcIcmsStRetido, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMSSTRet", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcmsStRetido, $NFeIni);
					}

					//  70 ICMS com reducao de base de calculo e cobranca de ICMS por ST
					else if ($nfeDetalhe->nfeDetalheImpostoIcms->cstIcms == "70")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->nfeDetalheImpostoIcms->origemMercadoria, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBC", $nfeDetalhe->nfeDetalheImpostoIcms->modalidadeBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBC", $nfeDetalhe->nfeDetalheImpostoIcms->percentualReducaoBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBC", $nfeDetalhe->nfeDetalheImpostoIcms->valorBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMS", $nfeDetalhe->nfeDetalheImpostoIcms->aliquotaIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBCST", $nfeDetalhe->nfeDetalheImpostoIcms->modalidadeBcIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pMVAST", $nfeDetalhe->nfeDetalheImpostoIcms->percentualMvaIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBCST", $nfeDetalhe->nfeDetalheImpostoIcms->percentualReducaoBcIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBCST", $nfeDetalhe->nfeDetalheImpostoIcms->valorBaseCalculoIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMSST", $nfeDetalhe->nfeDetalheImpostoIcms->aliquotaIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMSST", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcmsSt, $NFeIni);
					}

					//  90 Outros
					else if ($nfeDetalhe->nfeDetalheImpostoIcms->cstIcms == "90")
					{
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "orig", $nfeDetalhe->nfeDetalheImpostoIcms->origemMercadoria, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBC", $nfeDetalhe->nfeDetalheImpostoIcms->modalidadeBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBC", $nfeDetalhe->nfeDetalheImpostoIcms->valorBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBC", $nfeDetalhe->nfeDetalheImpostoIcms->percentualReducaoBcIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMS", $nfeDetalhe->nfeDetalheImpostoIcms->aliquotaIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMS", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcms, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "modBCST", $nfeDetalhe->nfeDetalheImpostoIcms->modalidadeBcIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pMVAST", $nfeDetalhe->nfeDetalheImpostoIcms->percentualMvaIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pRedBCST", $nfeDetalhe->nfeDetalheImpostoIcms->percentualReducaoBcIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vBCST", $nfeDetalhe->nfeDetalheImpostoIcms->valorBaseCalculoIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "pICMSST", $nfeDetalhe->nfeDetalheImpostoIcms->aliquotaIcmsSt, $NFeIni);
						Biblioteca::iniWriteString("ICMS" . $incrementoBloco, "vICMSST", $nfeDetalhe->nfeDetalheImpostoIcms->valorIcmsSt, $NFeIni);
					}
					/*
						Cabe a cada participante implementar o seguinte:
						ICMSPart partilha do ICMS entre a UF de Origem e UF de Destino->get->get
						ICMSST Repasse de ICMS ST retido anteriormente em ope->get interestadual->get->get->get
					*/
				}

				// / [IPI]
				Biblioteca::iniWriteString("IPI" . $incrementoBloco, "CST", $nfeDetalhe->nfeDetalheImpostoIpi->cstIpi, $NFeIni);
				Biblioteca::iniWriteString("IPI" . $incrementoBloco, "vBC", $nfeDetalhe->nfeDetalheImpostoIpi->valorBaseCalculoIpi, $NFeIni);
				Biblioteca::iniWriteString("IPI" . $incrementoBloco, "pIPI", $nfeDetalhe->nfeDetalheImpostoIpi->aliquotaIpi, $NFeIni);
				Biblioteca::iniWriteString("IPI" . $incrementoBloco, "vIPI", $nfeDetalhe->nfeDetalheImpostoIpi->valorIpi, $NFeIni);

				// / [PIS]
				Biblioteca::iniWriteString("PIS" . $incrementoBloco, "CST", $nfeDetalhe->nfeDetalheImpostoPis->cstPis, $NFeIni);
				Biblioteca::iniWriteString("PIS" . $incrementoBloco, "vBC", $nfeDetalhe->nfeDetalheImpostoPis->valorBaseCalculoPis, $NFeIni);
				if ($nfeDetalhe->nfeDetalheImpostoPis->cstPis == "01")
					Biblioteca::iniWriteString("PIS" . $incrementoBloco, "pPIS", $nfeDetalhe->nfeDetalheImpostoPis->aliquotaPisPercentual, $NFeIni);
				else if ($nfeDetalhe->nfeDetalheImpostoPis->cstPis == "02")
					Biblioteca::iniWriteString("PIS" . $incrementoBloco, "pPIS", $nfeDetalhe->nfeDetalheImpostoPis->aliquotaPisReais, $NFeIni);
				Biblioteca::iniWriteString("PIS" . $incrementoBloco, "vPIS", $nfeDetalhe->nfeDetalheImpostoPis->valorPis, $NFeIni);

				// / [COFINS]
				Biblioteca::iniWriteString("COFINS" . $incrementoBloco, "CST", $nfeDetalhe->nfeDetalheImpostoCofins->cstCofins, $NFeIni);
				Biblioteca::iniWriteString("COFINS" . $incrementoBloco, "vBC", $nfeDetalhe->nfeDetalheImpostoCofins->baseCalculoCofins, $NFeIni);
				if ($nfeDetalhe->nfeDetalheImpostoCofins->cstCofins == "01")
					Biblioteca::iniWriteString("COFINS" . $incrementoBloco, "pCOFINS", $nfeDetalhe->nfeDetalheImpostoCofins->aliquotaCofinsPercentual, $NFeIni);
				else if ($nfeDetalhe->nfeDetalheImpostoCofins->cstCofins == "02")
					Biblioteca::iniWriteString("COFINS" . $incrementoBloco, "pCOFINS", $nfeDetalhe->nfeDetalheImpostoCofins->aliquotaCofinsReais, $NFeIni);
				Biblioteca::iniWriteString("COFINS" . $incrementoBloco, "vCOFINS", $nfeDetalhe->nfeDetalheImpostoCofins->valorCofins, $NFeIni);

				// / [II]
				//if (!$nfeDetalhe->nfeDetalheImpostoIi->equals(null))
				//{
				//	Biblioteca::iniWriteString("II" . $incrementoBloco, "vBC", $nfeDetalhe->nfeDetalheImpostoIi->valorBcIi, $NFeIni);
				//	Biblioteca::iniWriteString("II" . $incrementoBloco, "vDespAdu", $nfeDetalhe->nfeDetalheImpostoIi->valorDespesasAduaneiras, $NFeIni);
				//	Biblioteca::iniWriteString("II" . $incrementoBloco, "vII", $nfeDetalhe->nfeDetalheImpostoIi->valorImpostoImportacao, $NFeIni);
				//	Biblioteca::iniWriteString("II" . $incrementoBloco, "vIOF", $nfeDetalhe->nfeDetalheImpostoIi->valorIof, $NFeIni);
				//}

			}
		}

		// *******************************************************************************************
		//   [Total]
		// *******************************************************************************************
		Biblioteca::iniWriteString("Total", "vNF", $pNfeCabecalho->valorTotal, $NFeIni);
		Biblioteca::iniWriteString("Total", "vBC", $pNfeCabecalho->baseCalculoIcms, $NFeIni);
		Biblioteca::iniWriteString("Total", "vICMS", $pNfeCabecalho->valorIcms, $NFeIni);
		Biblioteca::iniWriteString("Total", "vBCST", $pNfeCabecalho->baseCalculoIcmsSt, $NFeIni);
		Biblioteca::iniWriteString("Total", "vST", $pNfeCabecalho->valorIcmsSt, $NFeIni);
		Biblioteca::iniWriteString("Total", "vProd", $pNfeCabecalho->valorTotalProdutos, $NFeIni);
		Biblioteca::iniWriteString("Total", "vFrete", $pNfeCabecalho->valorFrete, $NFeIni);
		Biblioteca::iniWriteString("Total", "vSeg", $pNfeCabecalho->valorSeguro, $NFeIni);
		Biblioteca::iniWriteString("Total", "vDesc", $pNfeCabecalho->valorDesconto, $NFeIni);
		Biblioteca::iniWriteString("Total", "vII", $pNfeCabecalho->valorImpostoImportacao, $NFeIni);
		Biblioteca::iniWriteString("Total", "vIPI", $pNfeCabecalho->valorIpi, $NFeIni);
		Biblioteca::iniWriteString("Total", "vPIS", $pNfeCabecalho->valorPis, $NFeIni);
		Biblioteca::iniWriteString("Total", "vCOFINS", $pNfeCabecalho->valorCofins, $NFeIni);
		Biblioteca::iniWriteString("Total", "vOutro", $pNfeCabecalho->valorDespesasAcessorias, $NFeIni);
		Biblioteca::iniWriteString("Total", "vNF", $pNfeCabecalho->valorTotal, $NFeIni);

		// *******************************************************************************************
		//   [ISSQNtot]
		// *******************************************************************************************
		Biblioteca::iniWriteString("ISSQNtot", "vServ", $pNfeCabecalho->valorServicos, $NFeIni);
		Biblioteca::iniWriteString("ISSQNtot", "vBC", $pNfeCabecalho->baseCalculoIssqn, $NFeIni);
		Biblioteca::iniWriteString("ISSQNtot", "vISS", $pNfeCabecalho->valorIssqn, $NFeIni);
		Biblioteca::iniWriteString("ISSQNtot", "vPIS", $pNfeCabecalho->valorPisIssqn, $NFeIni);
		Biblioteca::iniWriteString("ISSQNtot", "vCOFINS", $pNfeCabecalho->valorCofinsIssqn, $NFeIni);

		// *******************************************************************************************
		//   [retTrib]
		// *******************************************************************************************
		Biblioteca::iniWriteString("retTrib", "vRetPIS", $pNfeCabecalho->valorRetidoPis, $NFeIni);
		Biblioteca::iniWriteString("retTrib", "vRetCOFINS", $pNfeCabecalho->valorRetidoCofins, $NFeIni);
		Biblioteca::iniWriteString("retTrib", "vRetCSLL", $pNfeCabecalho->valorRetidoCsll, $NFeIni);
		Biblioteca::iniWriteString("retTrib", "vBCIRRF", $pNfeCabecalho->baseCalculoIrrf, $NFeIni);
		Biblioteca::iniWriteString("retTrib", "vIRRF", $pNfeCabecalho->valorRetidoIrrf, $NFeIni);
		Biblioteca::iniWriteString("retTrib", "vBCRetPrev", $pNfeCabecalho->baseCalculoPrevidencia, $NFeIni);
		Biblioteca::iniWriteString("retTrib", "vRetPrev", $pNfeCabecalho->valorRetidoPrevidencia, $NFeIni);

		// *******************************************************************************************
		//   [PAG]
		// *******************************************************************************************
		Biblioteca::iniWriteString("PAG001", "tpag", "01", $NFeIni);
		Biblioteca::iniWriteString("PAG001", "vPag", $pNfeCabecalho->valorTotal, $NFeIni);
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
		$arquivoComAspas = file_get_contents($nomeArquivoIni);
		$arquivoSemAspas = str_replace('"', '', $arquivoComAspas);
		file_put_contents($nomeArquivoIni, $arquivoSemAspas);

		return $nomeArquivoIni;
	}


}