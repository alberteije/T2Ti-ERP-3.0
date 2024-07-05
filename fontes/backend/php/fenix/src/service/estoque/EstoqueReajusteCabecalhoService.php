<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Service relacionado à tabela [ESTOQUE_REAJUSTE_CABECALHO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
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

class EstoqueReajusteCabecalhoService extends ServiceBase
{
    public static function consultarLista()
    {
		return EstoqueReajusteCabecalho::select()->limit(QUANTIDADE_POR_PAGINA)->get();
    }

    public static function consultarListaFiltroValor($filtro)
    {
		return EstoqueReajusteCabecalho::whereRaw($filtro->where)->get();
    }

    public static function consultarObjeto(int $id)
    {
		return EstoqueReajusteCabecalho::find($id);
    }

	public static function inserir($objJson, $objEntidade)
	{
	    DB::transaction(function () use ($objJson, $objEntidade) {
	        $objEntidade->save();
	        EstoqueReajusteCabecalhoService::atualizarFilhos($objJson, $objEntidade);
	    });
	}

	public static function alterar($objJson, $objBanco)
	{
	    DB::transaction(function () use ($objJson, $objBanco) {
	        $objBanco->save();
	        EstoqueReajusteCabecalhoService::excluirFilhos($objBanco);
	        EstoqueReajusteCabecalhoService::atualizarFilhos($objJson, $objBanco);
	    });
	}
	
	public static function atualizarFilhos($objJson, $objPersistencia)
	{

		// atualizar listaEstoqueReajusteDetalhe
		$listaEstoqueReajusteDetalheJson = $objJson->listaEstoqueReajusteDetalhe;
		if ($listaEstoqueReajusteDetalheJson != null) {
		    for ($i = 0; $i < count($listaEstoqueReajusteDetalheJson); $i++) {
		        $estoqueReajusteDetalhe = new EstoqueReajusteDetalhe();
		        $estoqueReajusteDetalhe->mapear($listaEstoqueReajusteDetalheJson[$i]);
		        $objPersistencia->listaEstoqueReajusteDetalhe()->save($estoqueReajusteDetalhe);

				// reajusta o preço do produto
				$produto = ProdutoService::consultarObjeto($estoqueReajusteDetalhe->produto->id);
				if ($produto != null) {
					$produto->valorVenda = $estoqueReajusteDetalhe->valorReajuste;
					$produto->save();
				}				
		    }
		}

	}
	
	public static function excluir($objeto)
	{
	    DB::transaction(function () use ($objeto) {
	        EstoqueReajusteCabecalhoService::excluirFilhos($objeto);
	        parent::excluir($objeto);
	    });
	}
		
	public static function excluirFilhos($objeto)
	{
		EstoqueReajusteDetalhe::where('ID_ESTOQUE_REAJUSTE_CABECALHO', $objeto->getIdAttribute())->delete();
	}

	public static function formarPreco($objJson, $objEntidade)
	{
		$listaEstoqueReajusteDetalheJson = $objJson->listaEstoqueReajusteDetalhe;
		if ($listaEstoqueReajusteDetalheJson != null) {
		    for ($i = 0; $i < count($listaEstoqueReajusteDetalheJson); $i++) {
		        $estoqueReajusteDetalhe = new EstoqueReajusteDetalhe();
		        $estoqueReajusteDetalhe->mapear($listaEstoqueReajusteDetalheJson[$i]);

				// reajusta o preço do produto
				$produto = ProdutoService::consultarObjeto($estoqueReajusteDetalhe->produto->id);
				if ($produto != null) {
					$produto->valorVenda = $estoqueReajusteDetalhe->valorReajuste;
					$produto->save();
				}				
		    }
		}
	}
}