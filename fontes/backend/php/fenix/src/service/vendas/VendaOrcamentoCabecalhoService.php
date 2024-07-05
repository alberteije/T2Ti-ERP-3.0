<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Service relacionado à tabela [VENDA_ORCAMENTO_CABECALHO] 
                                                                                
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

class VendaOrcamentoCabecalhoService extends ServiceBase
{
    public static function consultarLista()
    {
		return VendaOrcamentoCabecalho::select()->limit(QUANTIDADE_POR_PAGINA)->get();
    }

    public static function consultarListaFiltroValor($filtro)
    {
		return VendaOrcamentoCabecalho::whereRaw($filtro->where)->get();
    }

    public static function consultarObjeto(int $id)
    {
		return VendaOrcamentoCabecalho::find($id);
    }

	public static function inserir($objJson, $objEntidade)
	{
	    DB::transaction(function () use ($objJson, $objEntidade) {
	        $objEntidade->save();
	        VendaOrcamentoCabecalhoService::atualizarFilhos($objJson, $objEntidade);
	    });
	}

	public static function alterar($objJson, $objBanco)
	{
	    DB::transaction(function () use ($objJson, $objBanco) {
	        $objBanco->save();
	        VendaOrcamentoCabecalhoService::excluirFilhos($objBanco);
	        VendaOrcamentoCabecalhoService::atualizarFilhos($objJson, $objBanco);
	    });
	}
	
	public static function atualizarFilhos($objJson, $objPersistencia)
	{

		// atualizar listaVendaOrcamentoDetalhe
		$listaVendaOrcamentoDetalheJson = $objJson->listaVendaOrcamentoDetalhe;
		if ($listaVendaOrcamentoDetalheJson != null) {
		    for ($i = 0; $i < count($listaVendaOrcamentoDetalheJson); $i++) {
		        $vendaOrcamentoDetalhe = new VendaOrcamentoDetalhe();
		        $vendaOrcamentoDetalhe->mapear($listaVendaOrcamentoDetalheJson[$i]);
		        $objPersistencia->listaVendaOrcamentoDetalhe()->save($vendaOrcamentoDetalhe);
		    }
		}

	}
	
	public static function excluir($objeto)
	{
	    DB::transaction(function () use ($objeto) {
	        VendaOrcamentoCabecalhoService::excluirFilhos($objeto);
	        parent::excluir($objeto);
	    });
	}
		
	public static function excluirFilhos($objeto)
	{
		VendaOrcamentoDetalhe::where('ID_VENDA_ORCAMENTO_CABECALHO', $objeto->getIdAttribute())->delete();
	}
	
}