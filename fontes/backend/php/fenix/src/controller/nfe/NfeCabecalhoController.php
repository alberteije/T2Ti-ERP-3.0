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
            if (!isset($objJson)) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Incluir NfeCabecalho] - objeto não enviado.', null);
            }

            $objEntidade = new NfeCabecalho();
			$objEntidade->mapear($objJson);

			NfeCabecalhoService::inserir($objJson, $objEntidade);
			
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
        try {
			// pegar o objeto da requisição
			$objJson = json_decode($request->getBody());

            $objBanco = NfeCabecalhoService::consultarObjeto($objJson->id);

            if ($objBanco == null) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Alterar NfeCabecalho]', null);
            } else {
				$objBanco->mapear($objJson);
				
				NfeCabecalhoService::alterar($objJson, $objBanco);
				
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
            $objEntidade = NfeCabecalhoService::consultarObjeto($objJson->id);
            if (!isset($objJson)) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Transmitir NF-e] - objeto não enviado.', null);
            }

            $retorno = NfeCabecalhoService::transmitirNfe($objEntidade);

            if (!str_contains($retorno, "ERRO")) {
                $fh = fopen($retorno, 'rb');
                $stream = new Stream($fh); 
                return parent::retornarArquivo($response, $stream, 'application/pdf');                
            } else {
                return parent::tratarErro($response, 418, $retorno, null);                
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Transmitir NF-e]', $e);
        }
    }

    public function gerarPdfNfe($request, $response, $args)
    {
        try {
            $chave = $request->getHeaders()['chave'][0];
                        
			$retorno = NfeCabecalhoService::gerarPdfDanfe($chave);

            if (!str_contains($retorno, "ERRO")) {
                $fh = fopen($retorno, 'rb');
                $stream = new Stream($fh); 
                return parent::retornarArquivo($response, $stream, 'application/pdf');                
            } else {
                return parent::tratarErro($response, 418, $retorno, null);                
            }
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Atualizar AcbrMonitor]', $e);
        }
    }
	
}
