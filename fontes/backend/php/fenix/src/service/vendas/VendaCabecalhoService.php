<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Service relacionado à tabela [VENDA_CABECALHO] 
                                                                                
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

class VendaCabecalhoService extends ServiceBase
{
    public static function consultarLista()
    {
		return VendaCabecalho::select()->limit(QUANTIDADE_POR_PAGINA)->get();
    }

    public static function consultarListaFiltroValor($filtro)
    {
		return VendaCabecalho::whereRaw($filtro->where)->get();
    }

    public static function consultarObjeto(int $id)
    {
		return VendaCabecalho::find($id);
    }

	public static function inserir($objJson, $objEntidade)
	{
	    DB::transaction(function () use ($objJson, $objEntidade) {
	        $objEntidade->save();
	        VendaCabecalhoService::atualizarFilhos($objJson, $objEntidade);
	    });
	}

	public static function alterar($objJson, $objBanco)
	{
	    DB::transaction(function () use ($objJson, $objBanco) {
	        $objBanco->save();
	        VendaCabecalhoService::excluirFilhos($objBanco);
	        VendaCabecalhoService::atualizarFilhos($objJson, $objBanco);
	    });
	}
	
	public static function atualizarFilhos($objJson, $objPersistencia)
	{

		// atualizar listaVendaComissao
		$listaVendaComissaoJson = $objJson->listaVendaComissao;
		if ($listaVendaComissaoJson != null) {
		    for ($i = 0; $i < count($listaVendaComissaoJson); $i++) {
		        $vendaComissao = new VendaComissao();
		        $vendaComissao->mapear($listaVendaComissaoJson[$i]);
		        $objPersistencia->listaVendaComissao()->save($vendaComissao);
		    }
		}

		// atualizar listaVendaDetalhe
		$listaVendaDetalheJson = $objJson->listaVendaDetalhe;
		if ($listaVendaDetalheJson != null) {
		    for ($i = 0; $i < count($listaVendaDetalheJson); $i++) {
		        $vendaDetalhe = new VendaDetalhe();
		        $vendaDetalhe->mapear($listaVendaDetalheJson[$i]);
		        $objPersistencia->listaVendaDetalhe()->save($vendaDetalhe);
		    }
		}

	}
	
	public static function excluir($objeto)
	{
	    DB::transaction(function () use ($objeto) {
	        VendaCabecalhoService::excluirFilhos($objeto);
	        parent::excluir($objeto);
	    });
	}
		
	public static function excluirFilhos($objeto)
	{
		VendaComissao::where('ID_VENDA_CABECALHO', $objeto->getIdAttribute())->delete();
		VendaDetalhe::where('ID_VENDA_CABECALHO', $objeto->getIdAttribute())->delete();
	}
	
}