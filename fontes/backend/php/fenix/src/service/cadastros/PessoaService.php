<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [PESSOA] 
                                                                                
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
use Illuminate\Database\Capsule\Manager as DB;

class PessoaService extends ServiceBase
{
    public static function consultarLista()
    {
        return Pessoa::select()->limit(QUANTIDADE_POR_PAGINA)->get();
    }

    public static function consultarListaFiltroValor($filtro)
    {        
        return Pessoa::whereRaw($filtro->where)->get();
    }

    public static function consultarObjeto(int $id)
    {
        return Pessoa::find($id);
    }

    public static function inserir($objJson, $objEntidade)
    {
		DB::transaction(function () use ($objJson, $objEntidade) {
			$objEntidade->save();
			PessoaService::atualizarFilhos($objJson, $objEntidade);
		});		
	}

    public static function alterar($objJson, $objBanco)
    {
		DB::transaction(function () use ($objJson, $objBanco) {
			$objBanco->save();
			PessoaService::excluirFilhos($objBanco);
			PessoaService::atualizarFilhos($objJson, $objBanco);
		});		
	}

	public static function atualizarFilhos($objJson, $objPersistencia)
	{
		// atualizar cliente
		if (isset($objJson->cliente)) {
			$cliente = null;
			if ($objJson->cliente->id > 0) {
				$cliente = Cliente::find($objJson->cliente->id);
				$cliente->mapear($objJson->cliente);
			} else {
				$cliente = new Cliente();
				$cliente->mapear($objJson->cliente);				
			}
			$objPersistencia->cliente()->save($cliente);
		}

		// atualizar pessoa física
		if (isset($objJson->pessoaFisica)) {
			$pessoaFisica = new PessoaFisica();
			$pessoaFisica->mapear($objJson->pessoaFisica);			
			$objPersistencia->pessoaFisica()->save($pessoaFisica);
		}

		// atualizar contatos
		$listaPessoaContatoJson = $objJson->listaPessoaContato;
		if ($listaPessoaContatoJson != null) {
			for ($i = 0; $i < count($listaPessoaContatoJson); $i++) {
				$pessoaContato = new PessoaContato();
				$pessoaContato->mapear($listaPessoaContatoJson[$i]);
				$objPersistencia->listaPessoaContato()->save($pessoaContato);
			}
		}
	}

    public static function excluir($objeto)
    {
		DB::transaction(function () use ($objeto) {
			PessoaService::excluirFilhos($objeto);
			PessoaService::excluirFilhosCriticos($objeto);
			parent::excluir($objeto);
		});		
    }

	public static function excluirFilhos($objeto)
	{
		PessoaFisica::where('ID_PESSOA', $objeto->getIdAttribute())->delete();
		// PessoaJuridica::where('ID_PESSOA', $objeto->getIdAttribute())->delete();
		PessoaContato::where('ID_PESSOA', $objeto->getIdAttribute())->delete();
		// PessoaEndereco::where('ID_PESSOA', $objeto->getIdAttribute())->delete();
		// PessoaTelefone::where('ID_PESSOA', $objeto->getIdAttribute())->delete();
	}

	public static function excluirFilhosCriticos($objeto)
	{
		// objetos vinculados 1:1 que tem grande change de causar erros no momento da
		// exclusão, pois são vinculados a várias outras tabelas do ERP		
		// Cliente
		Cliente::where('ID_PESSOA', $objeto->getIdAttribute())->delete();
		// Fornecedor
		// Fornecedor::where('ID_PESSOA', $objeto->getIdAttribute())->delete();
		// Transportadora
		// Transportadora::where('ID_PESSOA', $objeto->getIdAttribute())->delete();
		// Colaborador
		// Colaborador::where('ID_PESSOA', $objeto->getIdAttribute())->delete();
		// Contador
		// Contador::where('ID_PESSOA', $objeto->getIdAttribute())->delete();
	}	
}