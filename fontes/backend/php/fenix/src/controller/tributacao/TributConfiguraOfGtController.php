<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [TRIBUT_CONFIGURA_OF_GT] 
                                                                                
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
class TributConfiguraOfGtController extends ControllerBase
{

    public function consultarLista($request, $response, $args)
    {
        try {
            if (count($request->getQueryParams()) > 0) {
                $filtro = new Filtro($request->getQueryParams()['filter']);
                $listaConsulta = TributConfiguraOfGtService::consultarListaFiltroValor($filtro);
            } else {
                $listaConsulta = TributConfiguraOfGtService::consultarLista();
            }
            $retorno = json_encode($listaConsulta);
            $response->getBody()->write($retorno);
            return $response->withHeader('Content-Type', 'application/json');
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Consultar Lista TributConfiguraOfGt]', $e);
        }
    }

    public function consultarObjeto($request, $response, $args)
    {
        try {
            $objeto = TributConfiguraOfGtService::consultarObjeto($args['id']);

            if ($objeto == null) {
                return parent::tratarErro($response, 404, 'Registro não localizado [Consultar Objeto TributConfiguraOfGt]', null);
            } else {
                $retorno = json_encode($objeto);
                $response->getBody()->write($retorno);
                return $response
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Consultar Objeto TributConfiguraOfGt]', $e);
        }
    }

    public function inserir($request, $response, $args)
    {
        try {
            // pegar o objeto da requisição
            $objJson = json_decode($request->getBody());

            // valida o objeto
            $objEntidade = new TributConfiguraOfGt($objJson);
            if (!isset($objJson)) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Incluir TributConfiguraOfGt] - objeto não enviado.', null);
            }
			$objEntidade->setTributGrupoTributario(TributGrupoTributarioService::consultarObjeto($objJson->tributGrupoTributario->id));
			$objEntidade->setTributOperacaoFiscal(TributOperacaoFiscalService::consultarObjeto($objJson->tributOperacaoFiscal->id));
            TributConfiguraOfGtService::salvar($objEntidade);
			
            $retorno = json_encode($objEntidade);
            $response->getBody()->write($retorno);

            return $response
                ->withStatus(201)
                ->withHeader('Content-Type', 'application/json');
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Inserir TributConfiguraOfGt]', $e);
        }
    }

    public function alterar($request, $response, $args)
    {
        // pegar o objeto da requisição
        $objJson = json_decode($request->getBody());

        // valida objeto
        $objEntidade = new TributConfiguraOfGt($objJson);
        $mensagemErro = $objEntidade->validarObjetoRequisicao($objJson, $args['id']);
        if ($mensagemErro != '') {
            return parent::tratarErro($response, 400, $mensagemErro, null);
        }

        try {
            $objBanco = TributConfiguraOfGtService::consultarObjeto($objJson->id);

            if ($objBanco == null) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Alterar TributConfiguraOfGt]', null);
            } else {
				TributConfiguraOfGtService::excluirFilhos($objBanco);
				$objBanco->mapear($objEntidade);
				
				$tributCofins = $objEntidade->getTributCofins();
				if ($tributCofins != null) {
					$tributCofins->setTributConfiguraOfGt($objBanco);
					$objBanco->setTributCofins($tributCofins);
				}

				$tributIpi = $objEntidade->getTributIpi();
				if ($tributIpi != null) {
					$tributIpi->setTributConfiguraOfGt($objBanco);
					$objBanco->setTributIpi($tributIpi);
				}

				$tributPis = $objEntidade->getTributPis();
				if ($tributPis != null) {
					$tributPis->setTributConfiguraOfGt($objBanco);
					$objBanco->setTributPis($tributPis);
				}

				$listaTributIcmsUf = $objEntidade->getListaTributIcmsUf();
				if ($listaTributIcmsUf != null) {
					$objBanco->setListaTributIcmsUf($listaTributIcmsUf);
				}

				$objBanco->setTributGrupoTributario(TributGrupoTributarioService::consultarObjeto($objJson->tributGrupoTributario->id));
				$objBanco->setTributOperacaoFiscal(TributOperacaoFiscalService::consultarObjeto($objJson->tributOperacaoFiscal->id));
				TributConfiguraOfGtService::salvar($objBanco);
				
                $retorno = json_encode($objBanco);
                $response->getBody()->write($retorno);
                return $response
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Objeto inválido [Alterar TributConfiguraOfGt]', $e);
        }
    }

    public function excluir($request, $response, $args)
    {
        try {
            $objBanco = TributConfiguraOfGtService::consultarObjeto($args['id']);

            if ($objBanco == null) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Excluir TributConfiguraOfGt]', null);
            } else {
                TributConfiguraOfGtService::excluir($objBanco);

                return $response
                    ->withStatus(200)
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Objeto inválido [Excluir TributConfiguraOfGt]', $e);
        }
    }
    public function consultarTributacao($request, $response, $args)
    {
        try {
            $idTributGrupoTributario = $request->getHeaders()['idtributgrupotributario'][0];
            $idTributOperacaoFiscal = $request->getHeaders()['idtributoperacaofiscal'][0];

            $objeto = TributConfiguraOfGtService::consultarTributacao($idTributGrupoTributario, $idTributOperacaoFiscal);

            if ($objeto == null) {
                return parent::tratarErro($response, 404, 'Registro não localizado [Consultar Tributação]', null);
            } else {
                $retorno = json_encode($objeto);
                $response->getBody()->write($retorno);
                return $response
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Consultar Tributação]', $e);
        }
    }
}
