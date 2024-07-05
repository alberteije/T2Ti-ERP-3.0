package com.t2ti.retaguarda_sh.controller.cadastros;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.t2ti.retaguarda_sh.exception.BadRequestException;
import com.t2ti.retaguarda_sh.exception.GenericException;
import com.t2ti.retaguarda_sh.exception.ResourseNotFoundException;
import com.t2ti.retaguarda_sh.model.cadastros.ErpTipoPlanoModel;
import com.t2ti.retaguarda_sh.model.transiente.Filtro;
import com.t2ti.retaguarda_sh.service.cadastros.ErpTipoPlanoService;

@RestController
@RequestMapping(value = "/erp-tipo-plano", produces = "application/json;charset=UTF-8")
public class ErpTipoPlanoController {

	@Autowired
	private ErpTipoPlanoService service;
	
	@GetMapping
	public List<ErpTipoPlanoModel> getList(@RequestParam(required = false) String filter) {
		try {
			if (filter == null) {
				return service.getList();
			} else {
				// defines filter
				Filtro objFilter = new Filtro(filter);
				return service.getList(objFilter);				
			}
		} catch (Exception e) {
			throw new GenericException("Error [ErpTipoPlano] - Exception: " + e.getMessage());
		}
	}

	@GetMapping("/{id}")
	public ErpTipoPlanoModel getObject(@PathVariable Integer id) {
		try {
			try {
				return service.getObject(id);
			} catch (NoSuchElementException e) {
				throw new ResourseNotFoundException("[Not Found ErpTipoPlano].");
			}
		} catch (Exception e) {
			throw new GenericException("Error [Not Found ErpTipoPlano] - Exception: " + e.getMessage());
		}
	}
	
	@PostMapping
	public ErpTipoPlanoModel insert(@RequestBody ErpTipoPlanoModel objJson) {
		try {
			return service.save(objJson);
		} catch (Exception e) {
			throw new GenericException("Error [Insert ErpTipoPlano] - Exception: " + e.getMessage());
		}
	}

	@PutMapping
	public ErpTipoPlanoModel update(@RequestBody ErpTipoPlanoModel objJson, @PathVariable Integer id) {	
		try {			
			ErpTipoPlanoModel obj = service.getObject(objJson.getId());
			if (obj != null) {
				return service.save(objJson);				
			} else
			{
				throw new BadRequestException("Invalid Object [Update ErpTipoPlano].");				
			}
		} catch (Exception e) {
			throw new GenericException("Error [Update ErpTipoPlano] - Exception: " + e.getMessage());
		}
	}
	
	@DeleteMapping("/{id}")
	public void delete(@PathVariable Integer id) {
		try {
			service.delete(id);
		} catch (Exception e) {
			throw new GenericException("Error [Delete ErpTipoPlano] - Exception: " + e.getMessage());
		}
	}
	
}