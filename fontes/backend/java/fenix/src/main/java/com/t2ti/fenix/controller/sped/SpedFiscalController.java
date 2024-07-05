/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à geração do Sped Fiscal - EFD
                                                                                
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
package com.t2ti.fenix.controller.sped;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.t2ti.fenix.exception.ExcecaoGenericaServidorException;
import com.t2ti.fenix.service.sped.SpedFiscalService;

@RestController
@RequestMapping(value = "/sped-fiscal", produces = "application/json;charset=UTF-8")
public class SpedFiscalController {

	@Autowired
	private SpedFiscalService service;
	
	@GetMapping(value = "{filter}", produces = "text/plain")
	public FileSystemResource gerarSpedFiscal(@PathVariable String filter) {
		try {
			String path = service.gerarSpedFiscal(filter);
			return new FileSystemResource(new File(path));
		} catch (Exception e) {
			throw new ExcecaoGenericaServidorException("Erro no Servidor [Gerar SpedFiscal] - Exceção: " + e.getMessage());
		}
	}

	
}