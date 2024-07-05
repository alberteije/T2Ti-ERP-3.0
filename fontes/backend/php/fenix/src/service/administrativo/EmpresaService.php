<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Service relacionado à tabela [EMPRESA] 
                                                                                
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

class EmpresaService extends ServiceBase
{
    public static function consultarLista()
    {
		return Empresa::select()->limit(QUANTIDADE_POR_PAGINA)->get();
    }

    public static function consultarListaFiltroValor($filtro)
    {
		return Empresa::whereRaw($filtro->where)->get();
    }

    public static function consultarObjeto(int $id)
    {
		return Empresa::find($id);
    }

	public static function inserir($objJson, $objEntidade)
	{
	    DB::transaction(function () use ($objJson, $objEntidade) {
	        $objEntidade->save();
	        EmpresaService::atualizarFilhos($objJson, $objEntidade);
	    });
	}

	public static function alterar($objJson, $objBanco)
	{
	    DB::transaction(function () use ($objJson, $objBanco) {
	        $objBanco->save();
	        EmpresaService::excluirFilhos($objBanco);
	        EmpresaService::atualizarFilhos($objJson, $objBanco);
	    });
	}
	
	public static function atualizarFilhos($objJson, $objPersistencia)
	{

		// atualizar listaEmpresaContato
		$listaEmpresaContatoJson = $objJson->listaEmpresaContato;
		if ($listaEmpresaContatoJson != null) {
		    for ($i = 0; $i < count($listaEmpresaContatoJson); $i++) {
		        $empresaContato = new EmpresaContato();
		        $empresaContato->mapear($listaEmpresaContatoJson[$i]);
		        $objPersistencia->listaEmpresaContato()->save($empresaContato);
		    }
		}

		// atualizar listaEmpresaEndereco
		$listaEmpresaEnderecoJson = $objJson->listaEmpresaEndereco;
		if ($listaEmpresaEnderecoJson != null) {
		    for ($i = 0; $i < count($listaEmpresaEnderecoJson); $i++) {
		        $empresaEndereco = new EmpresaEndereco();
		        $empresaEndereco->mapear($listaEmpresaEnderecoJson[$i]);
		        $objPersistencia->listaEmpresaEndereco()->save($empresaEndereco);
		    }
		}

		// atualizar listaEmpresaTelefone
		$listaEmpresaTelefoneJson = $objJson->listaEmpresaTelefone;
		if ($listaEmpresaTelefoneJson != null) {
		    for ($i = 0; $i < count($listaEmpresaTelefoneJson); $i++) {
		        $empresaTelefone = new EmpresaTelefone();
		        $empresaTelefone->mapear($listaEmpresaTelefoneJson[$i]);
		        $objPersistencia->listaEmpresaTelefone()->save($empresaTelefone);
		    }
		}

	}
	
	public static function excluir($objeto)
	{
	    DB::transaction(function () use ($objeto) {
	        EmpresaService::excluirFilhos($objeto);
	        parent::excluir($objeto);
	    });
	}
		
	public static function excluirFilhos($objeto)
	{
		EmpresaContato::where('ID_EMPRESA', $objeto->getIdAttribute())->delete();
		EmpresaEndereco::where('ID_EMPRESA', $objeto->getIdAttribute())->delete();
		EmpresaTelefone::where('ID_EMPRESA', $objeto->getIdAttribute())->delete();
	}
	
}