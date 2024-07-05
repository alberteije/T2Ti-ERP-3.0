<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [FIN_LANCAMENTO_RECEBER] 
                                                                                
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
class FinLancamentoReceberController extends ControllerBase
{

    public function consultarLista($request, $response, $args)
    {
        try {
            if (count($request->getQueryParams()) > 0) {
                $filtro = new Filtro($request->getQueryParams()['filter']);
                $listaConsulta = FinLancamentoReceberService::consultarListaFiltroValor($filtro);
            } else {
                $listaConsulta = FinLancamentoReceberService::consultarLista();
            }
            $retorno = json_encode($listaConsulta);
            $response->getBody()->write($retorno);
            return $response->withHeader('Content-Type', 'application/json');
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Consultar Lista FinLancamentoReceber]', $e);
        }
    }

    public function consultarObjeto($request, $response, $args)
    {
        try {
            $objeto = FinLancamentoReceberService::consultarObjeto($args['id']);

            if ($objeto == null) {
                return parent::tratarErro($response, 404, 'Registro não localizado [Consultar Objeto FinLancamentoReceber]', null);
            } else {
                $retorno = json_encode($objeto);
                $response->getBody()->write($retorno);
                return $response
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Consultar Objeto FinLancamentoReceber]', $e);
        }
    }

    public function inserir($request, $response, $args)
    {
        try {
            // pegar o objeto da requisição
            $objJson = json_decode($request->getBody());

            // valida o objeto
            $objEntidade = new FinLancamentoReceber($objJson);
            if (!isset($objJson)) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Incluir FinLancamentoReceber] - objeto não enviado.', null);
            }
			$objEntidade->setFinDocumentoOrigem(FinDocumentoOrigemService::consultarObjeto($objJson->finDocumentoOrigem->id));
			$objEntidade->setFinNaturezaFinanceira(FinNaturezaFinanceiraService::consultarObjeto($objJson->finNaturezaFinanceira->id));
			$objEntidade->setCliente(ClienteService::consultarObjeto($objJson->cliente->id));
			$objEntidade->setBancoContaCaixa(BancoContaCaixaService::consultarObjeto($objJson->bancoContaCaixa->id));
            FinLancamentoReceberService::salvar($objEntidade);
			
            $retorno = json_encode($objEntidade);
            $response->getBody()->write($retorno);

            return $response
                ->withStatus(201)
                ->withHeader('Content-Type', 'application/json');
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Inserir FinLancamentoReceber]', $e);
        }
    }

    public function alterar($request, $response, $args)
    {
        // pegar o objeto da requisição
        $objJson = json_decode($request->getBody());

        // valida objeto
        $objEntidade = new FinLancamentoReceber($objJson);
        $mensagemErro = $objEntidade->validarObjetoRequisicao($objJson, $args['id']);
        if ($mensagemErro != '') {
            return parent::tratarErro($response, 400, $mensagemErro, null);
        }

        try {
            $objBanco = FinLancamentoReceberService::consultarObjeto($objJson->id);

            if ($objBanco == null) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Alterar FinLancamentoReceber]', null);
            } else {
				FinLancamentoReceberService::excluirFilhos($objBanco);
				$objBanco->mapear($objEntidade);
				
				$listaFinParcelaReceber = $objEntidade->getListaFinParcelaReceber();
				if ($listaFinParcelaReceber != null) {
					$objBanco->setListaFinParcelaReceber($listaFinParcelaReceber);
				}

				$objBanco->setFinDocumentoOrigem(FinDocumentoOrigemService::consultarObjeto($objJson->finDocumentoOrigem->id));
				$objBanco->setFinNaturezaFinanceira(FinNaturezaFinanceiraService::consultarObjeto($objJson->finNaturezaFinanceira->id));
				$objBanco->setCliente(ClienteService::consultarObjeto($objJson->cliente->id));
				$objBanco->setBancoContaCaixa(BancoContaCaixaService::consultarObjeto($objJson->bancoContaCaixa->id));
				FinLancamentoReceberService::salvar($objBanco);
				
                $retorno = json_encode($objBanco);
                $response->getBody()->write($retorno);
                return $response
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Objeto inválido [Alterar FinLancamentoReceber]', $e);
        }
    }

    public function excluir($request, $response, $args)
    {
        try {
            $objBanco = FinLancamentoReceberService::consultarObjeto($args['id']);

            if ($objBanco == null) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Excluir FinLancamentoReceber]', null);
            } else {
                FinLancamentoReceberService::excluir($objBanco);

                return $response
                    ->withStatus(200)
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Objeto inválido [Excluir FinLancamentoReceber]', $e);
        }
    }
	
    public function gerarBoleto($request, $response, $args)
    {
        try {
            // pegar o objeto da requisição
            $objJson = json_decode($request->getBody());

            // valida o objeto
            $objEntidade = new FinLancamentoReceber($objJson);
            if (!isset($objJson)) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Gerar Boleto] - objeto não enviado.', null);
            }

            $retorno = FinLancamentoReceberService::gerarBoleto($objEntidade);
						
			//$file = "C:\\ACBrMonitor\\PDF\\10793118000178\\NFe\\202006\\NFe\\53200610793118000178550010000020111900020116-nfe.pdf";
            $fh = fopen($retorno, 'rb');
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
            return parent::tratarErro($response, 500, 'Erro no Servidor [Gerar Boleto]', $e);
        }
    }
	
}
