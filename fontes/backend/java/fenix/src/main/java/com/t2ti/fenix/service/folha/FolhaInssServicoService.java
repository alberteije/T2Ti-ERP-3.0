/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FOLHA_INSS_SERVICO] 
                                                                                
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
package com.t2ti.fenix.service.folha;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t2ti.fenix.model.folha.FolhaInssServico;
import com.t2ti.fenix.repository.folha.FolhaInssServicoRepository;
import com.t2ti.fenix.model.transiente.Filtro;

@Service
public class FolhaInssServicoService {

	@Autowired
	private FolhaInssServicoRepository repository;
	
	@PersistenceContext
    private EntityManager entityManager;	
	
	public List<FolhaInssServico> consultarLista() {
		return repository.findAll();
	}

	@SuppressWarnings("unchecked")
	public List<FolhaInssServico> consultarLista(Filtro filtro) {
		String sql = "select * from FOLHA_INSS_SERVICO where " + filtro.getWhere();
		Query query = entityManager.createNativeQuery(sql, FolhaInssServico.class);
		return query.getResultList();
	}
	
	public FolhaInssServico consultarObjeto(Integer id) {
		return repository.findById(id).get();
	}
	
	public FolhaInssServico salvar(FolhaInssServico objeto) {
		return repository.save(objeto);
	}
		
	public void excluir(Integer id) {
		FolhaInssServico objeto = consultarObjeto(id);
		repository.delete(objeto);
	}
	
}