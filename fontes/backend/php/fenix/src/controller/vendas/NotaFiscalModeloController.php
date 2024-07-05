<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [NOTA_FISCAL_MODELO] 
                                                                                
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
class NotaFiscalModeloController extends ControllerBase
{

    public function consultarLista($request, $response, $args)
    {
        try {
            if (count($request->getQueryParams()) > 0) {
                $filtro = new Filtro($request->getQueryParams()['filter']);
                $listaConsulta = NotaFiscalModeloService::consultarListaFiltroValor($filtro);
            } else {
                $listaConsulta = NotaFiscalModeloService::consultarLista();
            }
            $retorno = json_encode($listaConsulta);
            $response->getBody()->write($retorno);
            return $response->withHeader('Content-Type', 'application/json');
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Consultar Lista NotaFiscalModelo]', $e);
        }
    }

    public function consultarObjeto($request, $response, $args)
    {
        try {
            $objeto = NotaFiscalModeloService::consultarObjeto($args['id']);

            if ($objeto == null) {
                return parent::tratarErro($response, 404, 'Registro não localizado [Consultar Objeto NotaFiscalModelo]', null);
            } else {
                $retorno = json_encode($objeto);
                $response->getBody()->write($retorno);
                return $response
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Consultar Objeto NotaFiscalModelo]', $e);
        }
    }

    public function inserir($request, $response, $args)
    {
        try {
            // pegar o objeto da requisição
            $objJson = json_decode($request->getBody());

            // valida o objeto
            if (!isset($objJson)) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Incluir NotaFiscalModelo] - objeto não enviado.', null);
            }
            
            $objEntidade = new NotaFiscalModelo();
            $objEntidade->mapear($objJson);
            
            NotaFiscalModeloService::salvar($objEntidade);
			
            $retorno = json_encode($objEntidade);
            $response->getBody()->write($retorno);

            return $response
                ->withStatus(201)
                ->withHeader('Content-Type', 'application/json');
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Inserir NotaFiscalModelo]', $e);
        }
    }

    public function alterar($request, $response, $args)
    {
        try {
            // pegar o objeto da requisição
            $objJson = json_decode($request->getBody());
        
            $objBanco = NotaFiscalModeloService::consultarObjeto($objJson->id);

            if ($objBanco == null) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Alterar NotaFiscalModelo]', null);
            } else {
				
				$objBanco->mapear($objJson);
				
				NotaFiscalModeloService::salvar($objBanco);
				
                $retorno = json_encode($objBanco);
                $response->getBody()->write($retorno);
                return $response
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Objeto inválido [Alterar NotaFiscalModelo]', $e);
        }
    }

    public function excluir($request, $response, $args)
    {
        try {
            $objBanco = NotaFiscalModeloService::consultarObjeto($args['id']);

            if ($objBanco == null) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Excluir NotaFiscalModelo]', null);
            } else {
                NotaFiscalModeloService::excluir($objBanco);

                return $response
                    ->withStatus(200)
                    ->withHeader('Content-Type', 'application/json');
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Objeto inválido [Excluir NotaFiscalModelo]', $e);
        }
    }
}
