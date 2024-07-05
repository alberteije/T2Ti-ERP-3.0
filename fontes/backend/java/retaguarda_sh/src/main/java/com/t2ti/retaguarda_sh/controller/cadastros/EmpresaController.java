/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [EMPRESA] 
                                                                                
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
package com.t2ti.retaguarda_sh.controller.cadastros;

import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.t2ti.retaguarda_sh.exception.ExcecaoGenericaServidorException;
import com.t2ti.retaguarda_sh.exception.RecursoNaoEncontradoException;
import com.t2ti.retaguarda_sh.model.cadastros.Empresa; // PDV - deve ser migrado para novo modelo
import com.t2ti.retaguarda_sh.model.cadastros.EmpresaModel; // ERP - já no novo modelo
import com.t2ti.retaguarda_sh.service.cadastros.EmpresaService;
import com.t2ti.retaguarda_sh.util.Biblioteca;

@RestController
@RequestMapping(value = "/empresa", produces = "application/json;charset=UTF-8")
public class EmpresaController {

	@Autowired
	private EmpresaService service;
	
	@PostMapping
	public String atualizar(@RequestBody String corpoRequisicao) {
		ObjectMapper objectMapper = new ObjectMapper();
		try {
	        Empresa empresa = objectMapper.readValue(Biblioteca.decifrar(corpoRequisicao), Empresa.class);
	        empresa = service.atualizar(empresa);
	        String retorno = objectMapper.writeValueAsString(empresa);	        
	        return Biblioteca.cifrar(retorno);
		} catch (Exception e) {
			throw new ExcecaoGenericaServidorException("Erro no Servidor [Atualizar Empresa] - Exceção: " + e.getMessage());
		}
	}	
	
	@PostMapping(value = "/registra-empresa")
	public String registrarEmpresa(@RequestBody String corpoRequisicao) {
		ObjectMapper objectMapper = new ObjectMapper();
		try {
	        Empresa empresa = objectMapper.readValue(Biblioteca.decifrar(corpoRequisicao), Empresa.class);
			empresa = service.registrar(empresa);
	        String retorno = objectMapper.writeValueAsString(empresa);	        
	        return Biblioteca.cifrar(retorno);
		} catch (Exception e) {
			throw new ExcecaoGenericaServidorException("Erro no Servidor [Registrar Empresa] - Exceção: " + e.getMessage());
		}
	}

	@PostMapping(value = "/registra-empresa-erp")
	public String registrarEmpresaEep(@RequestBody String corpoRequisicao) {
		ObjectMapper objectMapper = new ObjectMapper();
		try {
	        EmpresaModel empresa = objectMapper.readValue(Biblioteca.decifrar(corpoRequisicao), EmpresaModel.class);
			empresa = service.registrarEmpresaErp(empresa);
	        String retorno = objectMapper.writeValueAsString(empresa);	        
	        return Biblioteca.cifrar(retorno);
		} catch (Exception e) {
			throw new ExcecaoGenericaServidorException("Erro no Servidor [Registrar Empresa] - Exceção: " + e.getMessage());
		}
	}

	@PostMapping(value = "/envia-email-confirmacao")
	public String enviarEmailConfirmacao(@RequestBody String corpoRequisicao) {
		ObjectMapper objectMapper = new ObjectMapper();
		try {
	        Empresa empresa = objectMapper.readValue(Biblioteca.decifrar(corpoRequisicao), Empresa.class);
			empresa = service.enviarEmailConfirmacao(empresa);
	        String retorno = objectMapper.writeValueAsString(empresa);	        
	        return Biblioteca.cifrar(retorno);
		} catch (Exception e) {
			throw new ExcecaoGenericaServidorException("Erro no Servidor [Enviar Email Confirmacao] - Exceção: " + e.getMessage());
		}
	}	
	
	@PostMapping(value = "/confere-codigo-confirmacao")
	public String conferirCodigoConfirmacao(@RequestBody String corpoRequisicao, @RequestHeader("codigo-confirmacao") String codigoConfirmacao) {
		ObjectMapper objectMapper = new ObjectMapper();
		try {
	        Empresa empresa = objectMapper.readValue(Biblioteca.decifrar(corpoRequisicao), Empresa.class);
			empresa = service.conferirCodigoConfirmacao(empresa, Biblioteca.decifrar(codigoConfirmacao));
	        String retorno = objectMapper.writeValueAsString(empresa);	        
	        return Biblioteca.cifrar(retorno);
		} catch (Exception e) {
			throw new ExcecaoGenericaServidorException("Erro no Servidor [Enviar Email Confirmacao] - Exceção: " + e.getMessage());
		}
	}

//	@GetMapping
//	public List<Empresa> consultarLista(@RequestParam(required = false) String filter) {
//		try {
//			if (filter == null) {
//				return service.consultarLista();
//			} else {
//				// define o filtro
//				Filtro filtro = new Filtro(filter);
//				return service.consultarLista(filtro);				
//			}
//		} catch (Exception e) {
//			throw new ExcecaoGenericaServidorException("Erro no Servidor [Consultar Lista Empresa] - Exceção: " + e.getMessage());
//		}
//	}

	@GetMapping("/cnpj/{cnpj}")
	public EmpresaModel getEmpresaPorCnpj(@PathVariable String cnpj) {
		try {
			String filtro = "CNPJ = '" + cnpj + "'";		
			return service.consultarObjetoModelFiltro(filtro);
		} catch (NoSuchElementException e) {
			throw new RecursoNaoEncontradoException("Registro não localizado [Consultar Objeto Empresa].");
		} catch (Exception e) {
			throw new ExcecaoGenericaServidorException(
					"Erro no Servidor [Consultar Objeto Empresa] - Exceção: " + e.getMessage());
		}
	}
	
//	@PutMapping("/{id}")
//	public Empresa alterar(@RequestBody Empresa objJson, @PathVariable Integer id) {	
//		try {			
//			if (!objJson.getId().equals(id)) {
//				throw new RequisicaoRuimException("Objeto inválido [Alterar Empresa] - ID do objeto difere do ID da URL.");
//			}
//
//			Empresa objeto = service.consultarObjeto(objJson.getId());
//			if (objeto != null) {
//				return service.salvar(objJson);				
//			} else
//			{
//				throw new RequisicaoRuimException("Objeto com ID inválido [Alterar Empresa].");				
//			}
//		} catch (Exception e) {
//			throw new ExcecaoGenericaServidorException("Erro no Servidor [Alterar Empresa] - Exceção: " + e.getMessage());
//		}
//	}
//	
//	@DeleteMapping("/{id}")
//	public void excluir(@PathVariable Integer id) {
//		try {
//			service.excluir(id);
//		} catch (Exception e) {
//			throw new ExcecaoGenericaServidorException("Erro no Servidor [Excluir Empresa] - Exceção: " + e.getMessage());
//		}
//	}
	
}