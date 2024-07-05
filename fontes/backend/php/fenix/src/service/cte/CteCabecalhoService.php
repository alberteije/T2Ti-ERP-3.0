<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Service relacionado à tabela [CTE_CABECALHO] 
                                                                                
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

class CteCabecalhoService extends ServiceBase
{
    public static function consultarLista()
    {
		return CteCabecalho::select()->limit(QUANTIDADE_POR_PAGINA)->get();
    }

    public static function consultarListaFiltroValor($filtro)
    {
		return CteCabecalho::whereRaw($filtro->where)->get();
    }

    public static function consultarObjeto(int $id)
    {
		return CteCabecalho::find($id);
    }

	public static function inserir($objJson, $objEntidade)
	{
	    DB::transaction(function () use ($objJson, $objEntidade) {
	        $objEntidade->save();
	        CteCabecalhoService::atualizarFilhos($objJson, $objEntidade);
	    });
	}

	public static function alterar($objJson, $objBanco)
	{
	    DB::transaction(function () use ($objJson, $objBanco) {
	        $objBanco->save();
	        CteCabecalhoService::excluirFilhos($objBanco);
	        CteCabecalhoService::atualizarFilhos($objJson, $objBanco);
	    });
	}
	
	public static function atualizarFilhos($objJson, $objPersistencia)
	{
		// atualizar cteDestinatario
		if (isset($objJson->cteDestinatario)) {
		    $cteDestinatario = new CteDestinatario();
		    $cteDestinatario->mapear($objJson->cteDestinatario);
		    $objPersistencia->cteDestinatario()->save($cteDestinatario);
		}

		// atualizar cteLocalEntrega
		if (isset($objJson->cteLocalEntrega)) {
		    $cteLocalEntrega = new CteLocalEntrega();
		    $cteLocalEntrega->mapear($objJson->cteLocalEntrega);
		    $objPersistencia->cteLocalEntrega()->save($cteLocalEntrega);
		}

		// atualizar cteRemetente
		if (isset($objJson->cteRemetente)) {
		    $cteRemetente = new CteRemetente();
		    $cteRemetente->mapear($objJson->cteRemetente);
		    $objPersistencia->cteRemetente()->save($cteRemetente);
		}

		// atualizar cteRodoviario
		if (isset($objJson->cteRodoviario)) {
		    $cteRodoviario = new CteRodoviario();
		    $cteRodoviario->mapear($objJson->cteRodoviario);
		    $objPersistencia->cteRodoviario()->save($cteRodoviario);
		}

		// atualizar cteTomador
		if (isset($objJson->cteTomador)) {
		    $cteTomador = new CteTomador();
		    $cteTomador->mapear($objJson->cteTomador);
		    $objPersistencia->cteTomador()->save($cteTomador);
		}


		// atualizar listaCteCarga
		$listaCteCargaJson = $objJson->listaCteCarga;
		if ($listaCteCargaJson != null) {
		    for ($i = 0; $i < count($listaCteCargaJson); $i++) {
		        $cteCarga = new CteCarga();
		        $cteCarga->mapear($listaCteCargaJson[$i]);
		        $objPersistencia->listaCteCarga()->save($cteCarga);
		    }
		}

	}
	
	public static function excluir($objeto)
	{
	    DB::transaction(function () use ($objeto) {
	        CteCabecalhoService::excluirFilhos($objeto);
	        parent::excluir($objeto);
	    });
	}
		
	public static function excluirFilhos($objeto)
	{
		CteCarga::where('ID_CTE_CABECALHO', $objeto->getIdAttribute())->delete();
		CteDestinatario::where('ID_CTE_CABECALHO', $objeto->getIdAttribute())->delete();
		CteLocalEntrega::where('ID_CTE_CABECALHO', $objeto->getIdAttribute())->delete();
		CteRemetente::where('ID_CTE_CABECALHO', $objeto->getIdAttribute())->delete();
		CteRodoviario::where('ID_CTE_CABECALHO', $objeto->getIdAttribute())->delete();
		CteTomador::where('ID_CTE_CABECALHO', $objeto->getIdAttribute())->delete();
	}
	
}