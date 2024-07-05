package com.t2ti.retaguarda_sh.service.cadastros;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.t2ti.retaguarda_sh.exception.GenericException;
import com.t2ti.retaguarda_sh.model.cadastros.ErpTipoPlanoModel;
import com.t2ti.retaguarda_sh.model.transiente.Filtro;
import com.t2ti.retaguarda_sh.repository.cadastros.ErpTipoPlanoRepository;


@Service
public class ErpTipoPlanoService {

	@Autowired
	private ErpTipoPlanoRepository repository;
	@PersistenceContext
	private EntityManager entityManager;

	public List<ErpTipoPlanoModel> getList() {
		return repository.findAll();
	}

	@SuppressWarnings("unchecked")
	public List<ErpTipoPlanoModel> getList(Filtro filter) {
		String sql = "select * from erp_tipo_plano where " + filter.getWhere();
		Query query = entityManager.createNativeQuery(sql, ErpTipoPlanoModel.class);
		return query.getResultList();
	}

	public ErpTipoPlanoModel getObject(Integer id) {
		return repository.findById(id).get();
	}

	public ErpTipoPlanoModel save(ErpTipoPlanoModel obj) {
		ErpTipoPlanoModel erpTipoPlanoModel = repository.save(obj);
		return erpTipoPlanoModel;
	}

	
	@Transactional
	public void delete(Integer id) {
		ErpTipoPlanoModel obj = getObject(id);
		entityManager.joinTransaction();
		try {
			repository.delete(obj);
		} catch (Exception e) {
			throw new GenericException("Error [Delete ErpTipoPlano] - Exception: " + e.getMessage());
		}
	}

}