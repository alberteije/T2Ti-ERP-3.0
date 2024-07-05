/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PONTO_BANCO_HORAS_UTILIZACAO] 
                                                                                
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
package com.t2ti.fenix.service.ponto;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t2ti.fenix.model.ponto.PontoBancoHorasUtilizacao;
import com.t2ti.fenix.repository.ponto.PontoBancoHorasUtilizacaoRepository;
import com.t2ti.fenix.model.transiente.Filtro;

@Service
public class PontoBancoHorasUtilizacaoService {

	@Autowired
	private PontoBancoHorasUtilizacaoRepository repository;
	
	@PersistenceContext
    private EntityManager entityManager;	
	
	public List<PontoBancoHorasUtilizacao> consultarLista() {
		return repository.findAll();
	}

	@SuppressWarnings("unchecked")
	public List<PontoBancoHorasUtilizacao> consultarLista(Filtro filtro) {
		String sql = "select * from PONTO_BANCO_HORAS_UTILIZACAO where " + filtro.getWhere();
		Query query = entityManager.createNativeQuery(sql, PontoBancoHorasUtilizacao.class);
		return query.getResultList();
	}
	
	public PontoBancoHorasUtilizacao consultarObjeto(Integer id) {
		return repository.findById(id).get();
	}
	
	public PontoBancoHorasUtilizacao salvar(PontoBancoHorasUtilizacao objeto) {
		return repository.save(objeto);
	}
		
	public void excluir(Integer id) {
		PontoBancoHorasUtilizacao objeto = consultarObjeto(id);
		repository.delete(objeto);
	}
	
}