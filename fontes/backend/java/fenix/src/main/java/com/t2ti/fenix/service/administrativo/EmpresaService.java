/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [EMPRESA] 
                                                                                
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
package com.t2ti.fenix.service.administrativo;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t2ti.fenix.model.administrativo.Empresa;
import com.t2ti.fenix.repository.administrativo.EmpresaRepository;
import com.t2ti.fenix.model.transiente.Filtro;

@Service
public class EmpresaService {

	@Autowired
	private EmpresaRepository repository;
	
	@PersistenceContext
    private EntityManager entityManager;	
	
	public List<Empresa> consultarLista() {
		return repository.findAll();
	}

	@SuppressWarnings("unchecked")
	public List<Empresa> consultarLista(Filtro filtro) {
		String sql = "select * from EMPRESA where " + filtro.getWhere();
		Query query = entityManager.createNativeQuery(sql, Empresa.class);
		return query.getResultList();
	}
	
	public Empresa consultarObjeto(Integer id) {
		return repository.findById(id).get();
	}
	
	public Empresa salvar(Empresa objeto) {
		return repository.save(objeto);
	}
		
	public void excluir(Integer id) {
		Empresa objeto = consultarObjeto(id);
		repository.delete(objeto);
	}
	
}