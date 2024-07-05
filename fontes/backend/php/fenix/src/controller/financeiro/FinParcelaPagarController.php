<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [FIN_PARCELA_PAGAR] 
                                                                                
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
class FinParcelaPagarController extends ControllerBase
{

    public function consultarLista($request, $response, $args)
    {
        try {
            if (count($request->getQueryParams()) > 0) {
                $filtro = new Filtro($request->getQueryParams()['filter']);
                $listaConsulta = FinParcelaPagarService::consultarListaFiltroValor($filtro);
            } else {
                $listaConsulta = FinParcelaPagarService::consultarLista();
            }
            $retorno = json_encode($listaConsulta);
            $response->getBody()->write($retorno);
            return $response->withHeader('Content-Type', 'application/json');
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Consultar Lista FinParcelaPagar]', $e);
        }
    }

    public function consultarObjeto($request, $response, $args)
    {
        try {
            $objeto = FinParcelaPagarService::consultarObjeto($args['id']);

            if ($objeto == null) {
                return parent::tratarErro($response, 404, 'Registro não localizado [Consultar Objeto FinParcelaPagar]', null);
            } else {
                $retorno = json_encode($objeto);
                $response->getBody()->write($retorno);
                return $response
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Consultar Objeto FinParcelaPagar]', $e);
        }
    }

    public function inserir($request, $response, $args)
    {
        try {
            // pegar o objeto da requisição
            $objJson = json_decode($request->getBody());

            // valida o objeto
            $objEntidade = new FinParcelaPagar($objJson);
            if (!isset($objJson)) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Incluir FinParcelaPagar] - objeto não enviado.', null);
            }
			$objEntidade->setFinStatusParcela(FinStatusParcelaService::consultarObjeto($objJson->finStatusParcela->id));
			$objEntidade->setFinTipoPagamento(FinTipoPagamentoService::consultarObjeto($objJson->finTipoPagamento->id));
			$objEntidade->setFinChequeEmitido(FinChequeEmitidoService::consultarObjeto($objJson->finChequeEmitido->id));
            FinParcelaPagarService::salvar($objEntidade);
			
            $retorno = json_encode($objEntidade);
            $response->getBody()->write($retorno);

            return $response
                ->withStatus(201)
                ->withHeader('Content-Type', 'application/json');
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Inserir FinParcelaPagar]', $e);
        }
    }

    public function alterar($request, $response, $args)
    {
        // pegar o objeto da requisição
        $objJson = json_decode($request->getBody());

        // valida objeto
        $objEntidade = new FinParcelaPagar($objJson);
        $mensagemErro = $objEntidade->validarObjetoRequisicao($objJson, $args['id']);
        if ($mensagemErro != '') {
            return parent::tratarErro($response, 400, $mensagemErro, null);
        }

        try {
            $objBanco = FinParcelaPagarService::consultarObjeto($objJson->id);

            if ($objBanco == null) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Alterar FinParcelaPagar]', null);
            } else {
				
				$objBanco->mapear($objEntidade);
				
				$objBanco->setFinLancamentoPagar(FinLancamentoPagarService::consultarObjeto($objJson->idFinLancamentoPagar));
				$objBanco->setFinStatusParcela(FinStatusParcelaService::consultarObjeto($objJson->finStatusParcela->id));
				$objBanco->setFinTipoPagamento(FinTipoPagamentoService::consultarObjeto($objJson->finTipoPagamento->id));
				//$objBanco->setFinChequeEmitido(FinChequeEmitidoService::consultarObjeto($objJson->finChequeEmitido->id));
				FinParcelaPagarService::salvar($objBanco);
				
                $retorno = json_encode($objBanco);
                $response->getBody()->write($retorno);
                return $response
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Objeto inválido [Alterar FinParcelaPagar]', $e);
        }
    }

    public function excluir($request, $response, $args)
    {
        try {
            $objBanco = FinParcelaPagarService::consultarObjeto($args['id']);

            if ($objBanco == null) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Excluir FinParcelaPagar]', null);
            } else {
                FinParcelaPagarService::excluir($objBanco);

                return $response
                    ->withStatus(200)
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Objeto inválido [Excluir FinParcelaPagar]', $e);
        }
    }
}
