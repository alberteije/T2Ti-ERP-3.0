<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [FIN_LANCAMENTO_PAGAR] 
                                                                                
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
class FinLancamentoPagarController extends ControllerBase
{

    public function consultarLista($request, $response, $args)
    {
        try {
            if (count($request->getQueryParams()) > 0) {
                $filtro = new Filtro($request->getQueryParams()['filter']);
                $listaConsulta = FinLancamentoPagarService::consultarListaFiltroValor($filtro);
            } else {
                $listaConsulta = FinLancamentoPagarService::consultarLista();
            }
            $retorno = json_encode($listaConsulta);
            $response->getBody()->write($retorno);
            return $response->withHeader('Content-Type', 'application/json');
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Consultar Lista FinLancamentoPagar]', $e);
        }
    }

    public function consultarObjeto($request, $response, $args)
    {
        try {
            $objeto = FinLancamentoPagarService::consultarObjeto($args['id']);

            if ($objeto == null) {
                return parent::tratarErro($response, 404, 'Registro não localizado [Consultar Objeto FinLancamentoPagar]', null);
            } else {
                $retorno = json_encode($objeto);
                $response->getBody()->write($retorno);
                return $response
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Consultar Objeto FinLancamentoPagar]', $e);
        }
    }

    public function inserir($request, $response, $args)
    {
        try {
            // pegar o objeto da requisição
            $objJson = json_decode($request->getBody());

            // valida o objeto
            $objEntidade = new FinLancamentoPagar($objJson);
            if (!isset($objJson)) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Incluir FinLancamentoPagar] - objeto não enviado.', null);
            }
			$objEntidade->setFinDocumentoOrigem(FinDocumentoOrigemService::consultarObjeto($objJson->finDocumentoOrigem->id));
			$objEntidade->setFinNaturezaFinanceira(FinNaturezaFinanceiraService::consultarObjeto($objJson->finNaturezaFinanceira->id));
			$objEntidade->setFornecedor(FornecedorService::consultarObjeto($objJson->fornecedor->id));
            $objEntidade->setBancoContaCaixa(BancoContaCaixaService::consultarObjeto($objJson->bancoContaCaixa->id));
            
            for ($i = 0; $i < count($objEntidade->getListaFinParcelaPagar()); $i++) {
                $parcela = $objEntidade->getListaFinParcelaPagar()[$i];
                $parcela->setFinStatusParcela(FinStatusParcelaService::consultarObjeto(1));
            }

            FinLancamentoPagarService::salvar($objEntidade);
			
            $retorno = json_encode($objEntidade);
            $response->getBody()->write($retorno);

            return $response
                ->withStatus(201)
                ->withHeader('Content-Type', 'application/json');
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Inserir FinLancamentoPagar]', $e);
        }
    }

    public function alterar($request, $response, $args)
    {
        // pegar o objeto da requisição
        $objJson = json_decode($request->getBody());

        // valida objeto
        $objEntidade = new FinLancamentoPagar($objJson);
        $mensagemErro = $objEntidade->validarObjetoRequisicao($objJson, $args['id']);
        if ($mensagemErro != '') {
            return parent::tratarErro($response, 400, $mensagemErro, null);
        }

        try {
            $objBanco = FinLancamentoPagarService::consultarObjeto($objJson->id);

            if ($objBanco == null) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Alterar FinLancamentoPagar]', null);
            } else {
				FinLancamentoPagarService::excluirFilhos($objBanco);
				$objBanco->mapear($objEntidade);
				
				$listaFinParcelaPagar = $objEntidade->getListaFinParcelaPagar();
				if ($listaFinParcelaPagar != null) {
					$objBanco->setListaFinParcelaPagar($listaFinParcelaPagar);
				}

				$objBanco->setFinDocumentoOrigem(FinDocumentoOrigemService::consultarObjeto($objJson->finDocumentoOrigem->id));
				$objBanco->setFinNaturezaFinanceira(FinNaturezaFinanceiraService::consultarObjeto($objJson->finNaturezaFinanceira->id));
				$objBanco->setFornecedor(FornecedorService::consultarObjeto($objJson->fornecedor->id));
				$objBanco->setBancoContaCaixa(BancoContaCaixaService::consultarObjeto($objJson->bancoContaCaixa->id));
				FinLancamentoPagarService::salvar($objBanco);
				
                $retorno = json_encode($objBanco);
                $response->getBody()->write($retorno);
                return $response
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Objeto inválido [Alterar FinLancamentoPagar]', $e);
        }
    }

    public function excluir($request, $response, $args)
    {
        try {
            $objBanco = FinLancamentoPagarService::consultarObjeto($args['id']);

            if ($objBanco == null) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Excluir FinLancamentoPagar]', null);
            } else {
                FinLancamentoPagarService::excluir($objBanco);

                return $response
                    ->withStatus(200)
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Objeto inválido [Excluir FinLancamentoPagar]', $e);
        }
    }
}
