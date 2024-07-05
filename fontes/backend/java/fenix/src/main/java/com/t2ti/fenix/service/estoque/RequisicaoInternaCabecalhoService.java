/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [REQUISICAO_INTERNA_CABECALHO] 
                                                                                
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

import com.t2ti.fenix.model.estoque.RequisicaoInternaCabecalho;
import com.t2ti.fenix.model.estoque.RequisicaoInternaDetalhe;
import com.t2ti.fenix.model.transiente.Filtro;
import com.t2ti.fenix.repository.estoque.RequisicaoInternaCabecalhoRepository;

@Service
public class RequisicaoInternaCabecalhoService {

	@Autowired
	private ControleEstoqueService controleEstoqueService;
	
	@Autowired
	private RequisicaoInternaCabecalhoRepository repository;
	
	@PersistenceContext
    private EntityManager entityManager;	
	
	public List<RequisicaoInternaCabecalho> consultarLista() {
		return repository.findAll();
	}

	@SuppressWarnings("unchecked")
	public List<RequisicaoInternaCabecalho> consultarLista(Filtro filtro) {
		String sql = "select * from REQUISICAO_INTERNA_CABECALHO where " + filtro.getWhere();
		Query query = entityManager.createNativeQuery(sql, RequisicaoInternaCabecalho.class);
		return query.getResultList();
		
	}
	
	public RequisicaoInternaCabecalho consultarObjeto(Integer id) {
		return repository.findById(id).get();
	}
	
	public RequisicaoInternaCabecalho salvar(RequisicaoInternaCabecalho objeto) throws Exception {
		RequisicaoInternaCabecalho requisicaoCabOld = repository.getOne(objeto.getId());
		entityManager.detach(requisicaoCabOld);
				
		RequisicaoInternaCabecalho retorno = repository.save(objeto);
		
	    // Atualizar Estoque
		if (requisicaoCabOld != null) {
			
			for (RequisicaoInternaDetalhe detalhe : objeto.getListaRequisicaoInternaDetalhe()) {
			
				/*
		          Tava Aberta OU Indeferida E foi Deferida - Drecementa Estoque
		          Tava Aberta E foi Indeferida - não faz nada
		          Tava Deferida E foi Indeferida OU Aberta - Incrementa Estoque
		          Tava Indeferida e foi Aberta - não faz nada
				*/
				if ( 
						 (requisicaoCabOld.getSituacao().equals("A") || requisicaoCabOld.getSituacao().equals("I"))
					 	 &&
						 (objeto.getSituacao().equals("D"))
				   ) 
				{ 
					controleEstoqueService.atualizarEstoque(detalhe.getProduto(), detalhe.getQuantidade(), "D");
				} else if 
					( 
						 (requisicaoCabOld.getSituacao().equals("D"))
					 	 &&
						 (objeto.getSituacao().equals("I") || objeto.getSituacao().equals("A"))
					) 	
				{
					controleEstoqueService.atualizarEstoque(detalhe.getProduto(), detalhe.getQuantidade(), "I");				
				}			
			}
		
		}	
		
		return retorno;
	}
		
	public void excluir(Integer id) {
		RequisicaoInternaCabecalho objeto = consultarObjeto(id);
		repository.delete(objeto);
	}
	
}