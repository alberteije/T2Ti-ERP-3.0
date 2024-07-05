<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Service relacionado à tabela [REQUISICAO_INTERNA_CABECALHO] 

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

class RequisicaoInternaCabecalhoService extends ServiceBase
{
	private $requisicaoCabOld;
	public static function consultarLista()
	{
		return RequisicaoInternaCabecalho::select()->limit(QUANTIDADE_POR_PAGINA)->get();
	}

	public static function consultarListaFiltroValor($filtro)
	{
		return RequisicaoInternaCabecalho::whereRaw($filtro->where)->get();
	}

	public static function consultarObjeto(int $id)
	{
		return RequisicaoInternaCabecalho::find($id);
	}

	public static function inserir($objJson, $objEntidade)
	{
		DB::transaction(function () use ($objJson, $objEntidade) {
			$objEntidade->save();
			RequisicaoInternaCabecalhoService::atualizarFilhos($objJson, $objEntidade, null);
		});
	}

	public static function alterar($objJson, $objBanco)
	{
		$requisicaoCabOld = RequisicaoInternaCabecalhoService::consultarObjeto($objJson->id);
		DB::transaction(function () use ($objJson, $objBanco, $requisicaoCabOld) {
			$objBanco->save();
			RequisicaoInternaCabecalhoService::excluirFilhos($objBanco);
			RequisicaoInternaCabecalhoService::atualizarFilhos($objJson, $objBanco, $requisicaoCabOld);
		});
	}

	public static function atualizarFilhos($objJson, $objPersistencia, $requisicaoCabOld)
	{
		// atualizar listaRequisicaoInternaDetalhe
		$listaRequisicaoInternaDetalheJson = $objJson->listaRequisicaoInternaDetalhe;
		if ($listaRequisicaoInternaDetalheJson != null) {
			for ($i = 0; $i < count($listaRequisicaoInternaDetalheJson); $i++) {
				$requisicaoInternaDetalhe = new RequisicaoInternaDetalhe();
				$requisicaoInternaDetalhe->mapear($listaRequisicaoInternaDetalheJson[$i]);
				$objPersistencia->listaRequisicaoInternaDetalhe()->save($requisicaoInternaDetalhe);

				// Atualizar Estoque
				if ($requisicaoCabOld != null) {
					/*
					Tava Aberta OU Indeferida E foi Deferida - Drecementa Estoque
					Tava Aberta E foi Indeferida - não faz nada
					Tava Deferida E foi Indeferida OU Aberta - Incrementa Estoque
					Tava Indeferida e foi Aberta - não faz nada
					*/
					if (($requisicaoCabOld->situacao == 'A' || $requisicaoCabOld->situacao == 'I') && ($objPersistencia->situacao == 'D')) {
						ControleEstoqueService::atualizarEstoque($requisicaoInternaDetalhe->produto, $requisicaoInternaDetalhe->quantidade, 'D');
					} else if (($requisicaoCabOld->situacao == 'D') && ($objPersistencia->situacao == 'I' || $objPersistencia->situacao == 'A')) {
						ControleEstoqueService::atualizarEstoque($requisicaoInternaDetalhe->produto, $requisicaoInternaDetalhe->quantidade, 'I');
					}

				}
			}
		}

	}

	public static function excluir($objeto)
	{
		DB::transaction(function () use ($objeto) {
			RequisicaoInternaCabecalhoService::excluirFilhos($objeto);
			parent::excluir($objeto);
		});
	}

	public static function excluirFilhos($objeto)
	{
		RequisicaoInternaDetalhe::where('ID_REQUISICAO_INTERNA_CABECALHO', $objeto->getIdAttribute())->delete();
	}

}