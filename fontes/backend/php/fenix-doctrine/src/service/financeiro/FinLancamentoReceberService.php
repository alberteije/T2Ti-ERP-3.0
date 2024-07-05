<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [FIN_LANCAMENTO_RECEBER] 
                                                                                
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

class FinLancamentoReceberService extends ServiceBase
{
    public static function consultarLista()
    {
        $gerenteConexao = GerenteConexao::getInstance();
        $objetoRepository = $gerenteConexao->entityManager->getRepository('FinLancamentoReceber');
        return $objetoRepository->findAll();
    }

    public static function consultarListaFiltroValor($filtro)
    {
        
        $gerenteConexao = GerenteConexao::getInstance();
        $sql = "SELECT t FROM FinLancamentoReceber t WHERE " . $filtro->where;
        $query = $gerenteConexao->entityManager->createQuery($sql);
        
        return $query->getResult();
    }

    public static function consultarObjeto(int $id)
    {
        $gerenteConexao = GerenteConexao::getInstance();
        return $gerenteConexao->entityManager->find('FinLancamentoReceber', $id);
    }

    public static function salvar($objeto)
    {
        parent::salvarBase($objeto);
    }

    public static function excluir($objeto)
    {
		FinLancamentoReceberService::excluirFilhos($objeto);
		parent::excluirBase($objeto);
    }

	public static function excluirFilhos($objeto)
	{
		$gerenteConexao = GerenteConexao::getInstance();
	
		$listaFinParcelaReceber = $objeto->getListaFinParcelaReceber();
		if ($listaFinParcelaReceber != null) {
			for ($i = 0; $i < count($listaFinParcelaReceber); $i++) {
				$finParcelaReceber = $listaFinParcelaReceber[$i];
				$gerenteConexao->entityManager->remove($finParcelaReceber);
			}

		}
	}
	
    public static function gerarBoleto($lancamento)
    {
		// primeiro passo - gerar o arquivo INI com os Titulos
		FinLancamentoReceberService::gerarArquivoIni($lancamento);
		// segundo passo - limpar a lista de boletos
		FinLancamentoReceberService::gerarArquivoEntradaLimparBoletos();
		usleep(200);
		// terceiro passo - criar o arquivo de entrada para o ACBRMonitor
		FinLancamentoReceberService::gerarArquivoEntradaGerarBoletos($lancamento);
		// quarto passo - Pegar o retorno e enviar para o controller
		return FinLancamentoReceberService::pegarRetornoSaida();
	}
	
    public static function gerarArquivoIni($lancamento)
    {
		$nomeArquivoIni = "c:\\t2ti\\boletos\\ini\\" . $lancamento->getId() . ".ini";
		// cria o arquivo
		$arquivo = fopen($nomeArquivoIni, "w");
		fclose($arquivo);

		// carrega o arquivo ini num array
		$arquivoIni = parse_ini_file($nomeArquivoIni, true);

		// Pega a empresa
        $gerenteConexao = GerenteConexao::getInstance();
		$empresa = $gerenteConexao->entityManager->find('Empresa', '1');
		$empresa->enderecoPrincipal = $empresa->getListaEmpresaEndereco()[0]; 
		// Pega a configuração do boleto
		$configuracaoBoleto = $gerenteConexao->entityManager->find('FinConfiguracaoBoleto', '1');
		// Pega o cliente
		$cliente = $gerenteConexao->entityManager->find('ViewPessoaCliente', '2'); 
	
		// *******************************************************************************************
		//   [Cedente]
		// *******************************************************************************************
		Biblioteca::iniWriteString("Cedente", "Nome", $empresa->getRazaoSocial(), $arquivoIni);
		Biblioteca::iniWriteString("Cedente", "CNPJCPF", $empresa->getCnpj(), $arquivoIni);
		Biblioteca::iniWriteString("Cedente", "Logradouro", $empresa->enderecoPrincipal->getLogradouro(), $arquivoIni);
		Biblioteca::iniWriteString("Cedente", "Numero", $empresa->enderecoPrincipal->getNumero(), $arquivoIni);
		Biblioteca::iniWriteString("Cedente", "Bairro", $empresa->enderecoPrincipal->getBairro(), $arquivoIni);
		Biblioteca::iniWriteString("Cedente", "Cidade", $empresa->enderecoPrincipal->getCidade(), $arquivoIni);
		Biblioteca::iniWriteString("Cedente", "CEP", $empresa->enderecoPrincipal->getCep(), $arquivoIni);
		Biblioteca::iniWriteString("Cedente", "Complemento", $empresa->enderecoPrincipal->getComplemento(), $arquivoIni);
		Biblioteca::iniWriteString("Cedente", "UF", $empresa->enderecoPrincipal->getUf(), $arquivoIni);
		Biblioteca::iniWriteString("Cedente", "CodigoCedente", $configuracaoBoleto->getCodigoCedente(), $arquivoIni);
		Biblioteca::iniWriteString("Cedente", "Convenio", $configuracaoBoleto->getCodigoConvenio(), $arquivoIni);

		// *******************************************************************************************
		//   [Conta]
		// *******************************************************************************************
		Biblioteca::iniWriteString("Conta", "Agencia", $configuracaoBoleto->getBancoContaCaixa()->getBancoAgencia()->getNumero(), $arquivoIni);
		Biblioteca::iniWriteString("Conta", "AgenciaDigito", $configuracaoBoleto->getBancoContaCaixa()->getBancoAgencia()->getDigito(), $arquivoIni);
		Biblioteca::iniWriteString("Conta", "Conta", $configuracaoBoleto->getBancoContaCaixa()->getNumero(), $arquivoIni);
		Biblioteca::iniWriteString("Conta", "ContaDigito", $configuracaoBoleto->getBancoContaCaixa()->getNumero(), $arquivoIni);

		// *******************************************************************************************
		//   [Banco]
		// *******************************************************************************************
		Biblioteca::iniWriteString("Banco", "Numero", $configuracaoBoleto->getBancoContaCaixa()->getBancoAgencia()->getBanco()->getCodigo(), $arquivoIni);
		Biblioteca::iniWriteString("Banco", "CNAB", $configuracaoBoleto->getLayoutRemessa(), $arquivoIni);
					
		// *******************************************************************************************
		//   Títulos
		// *******************************************************************************************
		for ($i = 0; $i < count($lancamento->getListaFinParcelaReceber()); $i++) 
		{
			// TODO: emita apenas os títulos que possuem o campo EMITIU_BOLETO marcado como 'S'
			
			$parcela = $lancamento->getListaFinParcelaReceber()[$i];
	
			//$tamanhoI = strlen(strval($i));
			//$incrementoBloco = str_repeat("0", 3 - $tamanhoI) . strval($i+1);  
			$incrementoBloco = strval($i+1);  
			
			Biblioteca::iniWriteString("Titulo" . $incrementoBloco, "NumeroDocumento", $parcela->getBoletoNossoNumero(), $arquivoIni);
			Biblioteca::iniWriteString("Titulo" . $incrementoBloco, "NossoNumero", $parcela->getBoletoNossoNumero(), $arquivoIni);
			Biblioteca::iniWriteString("Titulo" . $incrementoBloco, "Carteira", $configuracaoBoleto->getCarteira(), $arquivoIni);
			Biblioteca::iniWriteString("Titulo" . $incrementoBloco, "LocalPagamento", $configuracaoBoleto->getLocalPagamento(), $arquivoIni);
			Biblioteca::iniWriteString("Titulo" . $incrementoBloco, "Vencimento", $parcela->getDataVencimento(), $arquivoIni);
			Biblioteca::iniWriteString("Titulo" . $incrementoBloco, "DataDocumento", $parcela->getDataVencimento(), $arquivoIni);
			Biblioteca::iniWriteString("Titulo" . $incrementoBloco, "DataProcessamento", date_format(new DateTime(), 'd/m/y'), $arquivoIni);
			Biblioteca::iniWriteString("Titulo" . $incrementoBloco, "Aceite", $configuracaoBoleto->getAceite(), $arquivoIni);
			Biblioteca::iniWriteString("Titulo" . $incrementoBloco, "TotalParcelas", $lancamento->getQuantidadeParcela(), $arquivoIni);
			Biblioteca::iniWriteString("Titulo" . $incrementoBloco, "ValorDesconto", number_format($parcela->getValorDesconto(), 2, ",", ""), $arquivoIni);
			Biblioteca::iniWriteString("Titulo" . $incrementoBloco, "DataDesconto", $parcela->getDescontoAte(), $arquivoIni);
			Biblioteca::iniWriteString("Titulo" . $incrementoBloco, "ValorDocumento", number_format($parcela->getValor(), 2, ",", ""), $arquivoIni);
			Biblioteca::iniWriteString("Titulo" . $incrementoBloco, "Parcela", $parcela->getNumeroParcela(), $arquivoIni);
			Biblioteca::iniWriteString("Titulo" . $incrementoBloco, "PercentualMulta", number_format($parcela->getTaxaMulta(), 2, ",", ""), $arquivoIni);
			Biblioteca::iniWriteString("Titulo" . $incrementoBloco, "Instrucao1", $configuracaoBoleto->getInstrucao01(), $arquivoIni);
			Biblioteca::iniWriteString("Titulo" . $incrementoBloco, "Instrucao2", $configuracaoBoleto->getInstrucao02(), $arquivoIni);
			
			// Sacado
			Biblioteca::iniWriteString("Titulo" . $incrementoBloco, "Sacado.NomeSacado", $cliente->getNome(), $arquivoIni);
			Biblioteca::iniWriteString("Titulo" . $incrementoBloco, "Sacado.CNPJCPF", $cliente->getCpfCnpj(), $arquivoIni);
		}
		
		// grava arquivo INI
		Biblioteca::writeIniFile($nomeArquivoIni, $arquivoIni);

		// remove aspas
		// TODO: ver se é possível gravar os dados no arquivo INI sem as aspas
		$arquivoComAspas = file_get_contents($nomeArquivoIni);
		$arquivoSemAspas = str_replace('"', '', $arquivoComAspas);
		file_put_contents($nomeArquivoIni, $arquivoSemAspas);
	}	
	
    public static function gerarArquivoEntradaLimparBoletos()
    {
		//  apaga o arquivo 'SAI.TXT'
		unlink("c:\\ACBrMonitor\\sai.txt");

		//  cria o arquivo 'ENT.TXT'
		$nomeArquivoEntrada = "c:\\ACBrMonitor\\ENT.TXT";
		$arquivoEntrada = fopen($nomeArquivoEntrada, "w");
		fwrite($arquivoEntrada, "BOLETO.LimparLista");
		fclose($arquivoEntrada);
	}

    public static function gerarArquivoEntradaGerarBoletos($lancamento)
    {
		//  apaga o arquivo 'SAI.TXT'
		unlink("c:\\ACBrMonitor\\sai.txt");

		//  cria o arquivo 'ENT.TXT'
		$nomeArquivoEntrada = "c:\\ACBrMonitor\\ENT.TXT";
		$arquivoEntrada = fopen($nomeArquivoEntrada, "w");
		fwrite($arquivoEntrada, "BOLETO.IncluirTitulos(\"c:\\t2ti\\boletos\\ini\\" . $lancamento->getId() . ".ini\", \"I\"");
		fclose($arquivoEntrada);
	}
	
    public static function pegarRetornoSaida()
    {
		while (!file_exists("C:\\ACBrMonitor\\sai.txt"))
		{
		}

		return "C:\\T2Ti\\Boletos\\PDF\\boleto.pdf";
	}
	
	
}