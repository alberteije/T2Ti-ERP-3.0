<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [NFE_CABECALHO] 
                                                                                
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
use Slim\Psr7\Stream;

class NfeCabecalhoController extends ControllerBase
{

    public function consultarLista($request, $response, $args)
    {
        try {
            if (count($request->getQueryParams()) > 0) {
                $filtro = new Filtro($request->getQueryParams()['filter']);
                $listaConsulta = NfeCabecalhoService::consultarListaFiltroValor($filtro);
            } else {
                $listaConsulta = NfeCabecalhoService::consultarLista();
            }
            $retorno = json_encode($listaConsulta);
            $response->getBody()->write($retorno);
            return $response->withHeader('Content-Type', 'application/json');
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Consultar Lista NfeCabecalho]', $e);
        }
    }

    public function consultarObjeto($request, $response, $args)
    {
        try {
            $objeto = NfeCabecalhoService::consultarObjeto($args['id']);

            if ($objeto == null) {
                return parent::tratarErro($response, 404, 'Registro não localizado [Consultar Objeto NfeCabecalho]', null);
            } else {
                $retorno = json_encode($objeto);
                $response->getBody()->write($retorno);
                return $response
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Consultar Objeto NfeCabecalho]', $e);
        }
    }

    public function inserir($request, $response, $args)
    {
        try {
            // pegar o objeto da requisição
            $objJson = json_decode($request->getBody());

            // valida o objeto
            $objEntidade = new NfeCabecalho($objJson);
            if (!isset($objJson)) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Incluir NfeCabecalho] - objeto não enviado.', null);
            }
			$objEntidade->setVendedor(VendedorService::consultarObjeto($objJson->vendedor->id));
			$objEntidade->setFornecedor(FornecedorService::consultarObjeto($objJson->fornecedor->id));
			$objEntidade->setCliente(ClienteService::consultarObjeto($objJson->cliente->id));
			$objEntidade->setTributOperacaoFiscal(TributOperacaoFiscalService::consultarObjeto($objJson->tributOperacaoFiscal->id));
			$objEntidade->setVendaCabecalho(VendaCabecalhoService::consultarObjeto($objJson->vendaCabecalho->id));
            NfeCabecalhoService::salvar($objEntidade);
			
            $retorno = json_encode($objEntidade);
            $response->getBody()->write($retorno);

            return $response
                ->withStatus(201)
                ->withHeader('Content-Type', 'application/json');
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Inserir NfeCabecalho]', $e);
        }
    }

    public function alterar($request, $response, $args)
    {
        // pegar o objeto da requisição
        $objJson = json_decode($request->getBody());

        // valida objeto
        $objEntidade = new NfeCabecalho($objJson);
        $mensagemErro = $objEntidade->validarObjetoRequisicao($objJson, $args['id']);
        if ($mensagemErro != '') {
            return parent::tratarErro($response, 400, $mensagemErro, null);
        }

        try {
            $objBanco = NfeCabecalhoService::consultarObjeto($objJson->id);

            if ($objBanco == null) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Alterar NfeCabecalho]', null);
            } else {
				NfeCabecalhoService::excluirFilhos($objBanco);
				$objBanco->mapear($objEntidade);
				
				$nfeCana = $objEntidade->getNfeCana();
				if ($nfeCana != null) {
					$nfeCana->setNfeCabecalho($objBanco);
					$objBanco->setNfeCana($nfeCana);
				}

				$nfeDestinatario = $objEntidade->getNfeDestinatario();
				if ($nfeDestinatario != null) {
					$nfeDestinatario->setNfeCabecalho($objBanco);
					$objBanco->setNfeDestinatario($nfeDestinatario);
				}

				$nfeEmitente = $objEntidade->getNfeEmitente();
				if ($nfeEmitente != null) {
					$nfeEmitente->setNfeCabecalho($objBanco);
					$objBanco->setNfeEmitente($nfeEmitente);
				}

				$nfeFatura = $objEntidade->getNfeFatura();
				if ($nfeFatura != null) {
					$nfeFatura->setNfeCabecalho($objBanco);
					$objBanco->setNfeFatura($nfeFatura);
				}

				$nfeInformacaoPagamento = $objEntidade->getNfeInformacaoPagamento();
				if ($nfeInformacaoPagamento != null) {
					$nfeInformacaoPagamento->setNfeCabecalho($objBanco);
					$objBanco->setNfeInformacaoPagamento($nfeInformacaoPagamento);
				}

				$nfeLocalEntrega = $objEntidade->getNfeLocalEntrega();
				if ($nfeLocalEntrega != null) {
					$nfeLocalEntrega->setNfeCabecalho($objBanco);
					$objBanco->setNfeLocalEntrega($nfeLocalEntrega);
				}

				$nfeLocalRetirada = $objEntidade->getNfeLocalRetirada();
				if ($nfeLocalRetirada != null) {
					$nfeLocalRetirada->setNfeCabecalho($objBanco);
					$objBanco->setNfeLocalRetirada($nfeLocalRetirada);
				}

				$nfeResponsavelTecnico = $objEntidade->getNfeResponsavelTecnico();
				if ($nfeResponsavelTecnico != null) {
					$nfeResponsavelTecnico->setNfeCabecalho($objBanco);
					$objBanco->setNfeResponsavelTecnico($nfeResponsavelTecnico);
				}

				$nfeTransporte = $objEntidade->getNfeTransporte();
				if ($nfeTransporte != null) {
					$nfeTransporte->setNfeCabecalho($objBanco);
					$objBanco->setNfeTransporte($nfeTransporte);
				}

				$listaNfeAcessoXml = $objEntidade->getListaNfeAcessoXml();
				if ($listaNfeAcessoXml != null) {
					$objBanco->setListaNfeAcessoXml($listaNfeAcessoXml);
				}

				$listaNfeCteReferenciado = $objEntidade->getListaNfeCteReferenciado();
				if ($listaNfeCteReferenciado != null) {
					$objBanco->setListaNfeCteReferenciado($listaNfeCteReferenciado);
				}

				$listaNfeCupomFiscalReferenciado = $objEntidade->getListaNfeCupomFiscalReferenciado();
				if ($listaNfeCupomFiscalReferenciado != null) {
					$objBanco->setListaNfeCupomFiscalReferenciado($listaNfeCupomFiscalReferenciado);
				}

				$listaNfeDetalhe = $objEntidade->getListaNfeDetalhe();
				if ($listaNfeDetalhe != null) {
					$objBanco->setListaNfeDetalhe($listaNfeDetalhe);
				}

				$listaNfeNfReferenciada = $objEntidade->getListaNfeNfReferenciada();
				if ($listaNfeNfReferenciada != null) {
					$objBanco->setListaNfeNfReferenciada($listaNfeNfReferenciada);
				}

				$listaNfeProcessoReferenciado = $objEntidade->getListaNfeProcessoReferenciado();
				if ($listaNfeProcessoReferenciado != null) {
					$objBanco->setListaNfeProcessoReferenciado($listaNfeProcessoReferenciado);
				}

				$listaNfeProdRuralReferenciada = $objEntidade->getListaNfeProdRuralReferenciada();
				if ($listaNfeProdRuralReferenciada != null) {
					$objBanco->setListaNfeProdRuralReferenciada($listaNfeProdRuralReferenciada);
				}

				$listaNfeReferenciada = $objEntidade->getListaNfeReferenciada();
				if ($listaNfeReferenciada != null) {
					$objBanco->setListaNfeReferenciada($listaNfeReferenciada);
				}

				$objBanco->setVendedor(VendedorService::consultarObjeto($objJson->vendedor->id));
				$objBanco->setFornecedor(FornecedorService::consultarObjeto($objJson->fornecedor->id));
				$objBanco->setCliente(ClienteService::consultarObjeto($objJson->cliente->id));
				$objBanco->setTributOperacaoFiscal(TributOperacaoFiscalService::consultarObjeto($objJson->tributOperacaoFiscal->id));
				$objBanco->setVendaCabecalho(VendaCabecalhoService::consultarObjeto($objJson->vendaCabecalho->id));
				NfeCabecalhoService::salvar($objBanco);
				
                $retorno = json_encode($objBanco);
                $response->getBody()->write($retorno);
                return $response
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Objeto inválido [Alterar NfeCabecalho]', $e);
        }
    }

    public function excluir($request, $response, $args)
    {
        try {
            $objBanco = NfeCabecalhoService::consultarObjeto($args['id']);

            if ($objBanco == null) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Excluir NfeCabecalho]', null);
            } else {
                NfeCabecalhoService::excluir($objBanco);

                return $response
                    ->withStatus(200)
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Objeto inválido [Excluir NfeCabecalho]', $e);
        }
    }
	
	
    public function calcularTotais($request, $response, $args)
    {
        try {
            // pegar o objeto da requisição
            $objJson = json_decode($request->getBody());

            // valida o objeto
            $objEntidade = new NfeCabecalho($objJson);
            if (!isset($objJson)) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Calcular Totais NfeCabecalho] - objeto não enviado.', null);
            }

            NfeCabecalhoService::calcularTotais($objEntidade);
			
            $retorno = json_encode($objEntidade);
            $response->getBody()->write($retorno);

            return $response
                ->withStatus(200)
                ->withHeader('Content-Type', 'application/json');
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Calcular Totais NfeCabecalho]', $e);
        }
    }

    public function transmitirNfe($request, $response, $args)
    {
        try {
            // pegar o objeto da requisição
            $objJson = json_decode($request->getBody());

            // valida o objeto
            $objEntidade = new NfeCabecalho($objJson);
            if (!isset($objJson)) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Transmitir NF-e] - objeto não enviado.', null);
            }

            $retorno = NfeCabecalhoService::transmitirNfe($objEntidade);
            $response->getBody()->write($retorno);

            return $response
                ->withStatus(200)
                ->withHeader('Content-Type', 'application/json');
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Transmitir NF-e]', $e);
        }
    }

    public function gerarPdfNfe($request, $response, $args)
    {
        try {
			$file = "C:\\ACBrMonitor\\PDF\\10793118000178\\NFe\\202006\\NFe\\53200610793118000178550010000020111900020116-nfe.pdf";
            $fh = fopen($file, 'rb');
            $stream = new Stream($fh); 

            return $response
                        ->withHeader('Content-Type', 'application/pdf')
                        ->withHeader('Content-Description', 'File Transfer')
                        ->withHeader('Content-Transfer-Encoding', 'binary')
                        //->withHeader('Content-Disposition', 'attachment; filename="' . basename($file) . '"') - use se quiser forçar o download
                        ->withHeader('Expires', '0')
                        ->withHeader('Cache-Control', 'must-revalidate, post-check=0, pre-check=0')
                        ->withHeader('Pragma', 'public')
                        ->withBody($stream); 

		} catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Gerar PDF NF-e]', $e);
        }
    }
	
}
