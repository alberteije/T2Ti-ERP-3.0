<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [VENDA_CABECALHO] 
                                                                                
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
class VendaCabecalhoController extends ControllerBase
{

    public function consultarLista($request, $response, $args)
    {
        try {
            if (count($request->getQueryParams()) > 0) {
                $filtro = new Filtro($request->getQueryParams()['filter']);
                $listaConsulta = VendaCabecalhoService::consultarListaFiltroValor($filtro);
            } else {
                $listaConsulta = VendaCabecalhoService::consultarLista();
            }
            $retorno = json_encode($listaConsulta);
            $response->getBody()->write($retorno);
            return $response->withHeader('Content-Type', 'application/json');
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Consultar Lista VendaCabecalho]', $e);
        }
    }

    public function consultarObjeto($request, $response, $args)
    {
        try {
            $objeto = VendaCabecalhoService::consultarObjeto($args['id']);

            if ($objeto == null) {
                return parent::tratarErro($response, 404, 'Registro não localizado [Consultar Objeto VendaCabecalho]', null);
            } else {
                $retorno = json_encode($objeto);
                $response->getBody()->write($retorno);
                return $response
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Consultar Objeto VendaCabecalho]', $e);
        }
    }

    public function inserir($request, $response, $args)
    {
        try {
            // pegar o objeto da requisição
            $objJson = json_decode($request->getBody());

            // valida o objeto
            $objEntidade = new VendaCabecalho($objJson);
            if (!isset($objJson)) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Incluir VendaCabecalho] - objeto não enviado.', null);
            }
			$objEntidade->setVendaOrcamentoCabecalho(VendaOrcamentoCabecalhoService::consultarObjeto($objJson->vendaOrcamentoCabecalho->id));
			$objEntidade->setVendaCondicoesPagamento(VendaCondicoesPagamentoService::consultarObjeto($objJson->vendaCondicoesPagamento->id));
			$objEntidade->setNotaFiscalTipo(NotaFiscalTipoService::consultarObjeto($objJson->notaFiscalTipo->id));
			$objEntidade->setCliente(ClienteService::consultarObjeto($objJson->cliente->id));
			$objEntidade->setTransportadora(TransportadoraService::consultarObjeto($objJson->transportadora->id));
			$objEntidade->setVendedor(VendedorService::consultarObjeto($objJson->vendedor->id));
            VendaCabecalhoService::salvar($objEntidade);
			
            $retorno = json_encode($objEntidade);
            $response->getBody()->write($retorno);

            return $response
                ->withStatus(201)
                ->withHeader('Content-Type', 'application/json');
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Inserir VendaCabecalho]', $e);
        }
    }

    public function alterar($request, $response, $args)
    {
        // pegar o objeto da requisição
        $objJson = json_decode($request->getBody());

        // valida objeto
        $objEntidade = new VendaCabecalho($objJson);
        $mensagemErro = $objEntidade->validarObjetoRequisicao($objJson, $args['id']);
        if ($mensagemErro != '') {
            return parent::tratarErro($response, 400, $mensagemErro, null);
        }

        try {
            $objBanco = VendaCabecalhoService::consultarObjeto($objJson->id);

            if ($objBanco == null) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Alterar VendaCabecalho]', null);
            } else {
				VendaCabecalhoService::excluirFilhos($objBanco);
				$objBanco->mapear($objEntidade);
				
				$listaVendaComissao = $objEntidade->getListaVendaComissao();
				if ($listaVendaComissao != null) {
					$objBanco->setListaVendaComissao($listaVendaComissao);
				}

				$listaVendaDetalhe = $objEntidade->getListaVendaDetalhe();
				if ($listaVendaDetalhe != null) {
					$objBanco->setListaVendaDetalhe($listaVendaDetalhe);
				}

				$objBanco->setVendaOrcamentoCabecalho(VendaOrcamentoCabecalhoService::consultarObjeto($objJson->vendaOrcamentoCabecalho->id));
				$objBanco->setVendaCondicoesPagamento(VendaCondicoesPagamentoService::consultarObjeto($objJson->vendaCondicoesPagamento->id));
				$objBanco->setNotaFiscalTipo(NotaFiscalTipoService::consultarObjeto($objJson->notaFiscalTipo->id));
				$objBanco->setCliente(ClienteService::consultarObjeto($objJson->cliente->id));
				$objBanco->setTransportadora(TransportadoraService::consultarObjeto($objJson->transportadora->id));
				$objBanco->setVendedor(VendedorService::consultarObjeto($objJson->vendedor->id));
				VendaCabecalhoService::salvar($objBanco);
				
                $retorno = json_encode($objBanco);
                $response->getBody()->write($retorno);
                return $response
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Objeto inválido [Alterar VendaCabecalho]', $e);
        }
    }

    public function excluir($request, $response, $args)
    {
        try {
            $objBanco = VendaCabecalhoService::consultarObjeto($args['id']);

            if ($objBanco == null) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Excluir VendaCabecalho]', null);
            } else {
                VendaCabecalhoService::excluir($objBanco);

                return $response
                    ->withStatus(200)
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Objeto inválido [Excluir VendaCabecalho]', $e);
        }
    }
}