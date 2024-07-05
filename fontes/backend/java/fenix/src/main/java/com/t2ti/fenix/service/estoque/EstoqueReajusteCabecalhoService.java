/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [ESTOQUE_REAJUSTE_CABECALHO] 
                                                                                
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
package com.t2ti.fenix.service.estoque;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t2ti.fenix.model.cadastros.Produto;
import com.t2ti.fenix.model.estoque.EstoqueReajusteCabecalho;
import com.t2ti.fenix.model.estoque.EstoqueReajusteDetalhe;
import com.t2ti.fenix.model.transiente.Filtro;
import com.t2ti.fenix.repository.estoque.EstoqueReajusteCabecalhoRepository;
import com.t2ti.fenix.service.cadastros.ProdutoService;

@Service
public class EstoqueReajusteCabecalhoService {

	@Autowired
	private EstoqueReajusteCabecalhoRepository repository;
	
	@PersistenceContext
    private EntityManager entityManager;	
	
	@Autowired
	private ProdutoService produtoService;
	
	public List<EstoqueReajusteCabecalho> consultarLista() {
		return repository.findAll();
	}

	@SuppressWarnings("unchecked")
	public List<EstoqueReajusteCabecalho> consultarLista(Filtro filtro) {
		String sql = "select * from ESTOQUE_REAJUSTE_CABECALHO where " + filtro.getWhere();
		Query query = entityManager.createNativeQuery(sql, EstoqueReajusteCabecalho.class);
		return query.getResultList();
		
	}
	
	public EstoqueReajusteCabecalho consultarObjeto(Integer id) {
		return repository.findById(id).get();
	}
	
	public EstoqueReajusteCabecalho salvar(EstoqueReajusteCabecalho objeto) {
		EstoqueReajusteCabecalho retorno = repository.save(objeto);
	
		// reajusta o preço do produto
		for (EstoqueReajusteDetalhe detalhe : objeto.getListaEstoqueReajusteDetalhe()) {
			Produto produto = produtoService.consultarObjeto(detalhe.getProduto().getId());
			produto.setValorVenda(detalhe.getValorReajuste());
			produtoService.salvar(produto);
		}
		
		return retorno;
	}
		
	public void formarPreco(EstoqueReajusteCabecalho objeto) {
	
		// reajusta o preço do produto
		for (EstoqueReajusteDetalhe detalhe : objeto.getListaEstoqueReajusteDetalhe()) {
			Produto produto = produtoService.consultarObjeto(detalhe.getProduto().getId());
			produto.setValorVenda(detalhe.getValorReajuste());
			produtoService.salvar(produto);
		}
		
	}
	
	public void excluir(Integer id) {
		EstoqueReajusteCabecalho objeto = consultarObjeto(id);
		repository.delete(objeto);
	}
	
}