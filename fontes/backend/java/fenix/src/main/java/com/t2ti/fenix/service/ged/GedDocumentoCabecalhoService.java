/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [GED_DOCUMENTO_CABECALHO] 
                                                                                
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
package com.t2ti.fenix.service.ged;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t2ti.fenix.model.ged.GedDocumentoCabecalho;
import com.t2ti.fenix.repository.ged.GedDocumentoCabecalhoRepository;
import com.t2ti.fenix.util.Biblioteca;
import com.t2ti.fenix.model.transiente.Filtro;

@Service
public class GedDocumentoCabecalhoService {

	@Autowired
	private GedDocumentoCabecalhoRepository repository;
	
	@PersistenceContext
    private EntityManager entityManager;	
	
	public List<GedDocumentoCabecalho> consultarLista() {
		return repository.findAll();
	}

	@SuppressWarnings("unchecked")
	public List<GedDocumentoCabecalho> consultarLista(Filtro filtro) {
		String sql = "select * from GED_DOCUMENTO_CABECALHO where " + filtro.getWhere();
		Query query = entityManager.createNativeQuery(sql, GedDocumentoCabecalho.class);
		return query.getResultList();
		
	}
	
	public GedDocumentoCabecalho consultarObjeto(Integer id) {
		return repository.findById(id).get();
	}
	
	public GedDocumentoCabecalho salvar(GedDocumentoCabecalho objeto) {
		return repository.save(objeto);
	}
		
	public void excluir(Integer id) {
		GedDocumentoCabecalho objeto = consultarObjeto(id);
		repository.delete(objeto);
	}
	
	public void atualizarDetalhe(String pNomeArquivo, byte[] pArquivo) {
		try {
			String nomeArquivoMD5 = Biblioteca.md5String(pNomeArquivo);
			
            File nomeArquivoCompleto = new File("c:\\t2ti\\ged\\" + nomeArquivoMD5 + ".jpg");
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(nomeArquivoCompleto));
            stream.write(pArquivo);
            stream.close();			
            
            // Exercício - observe o algoritmo abaixo e implemente
            /*
            01-verifique se o usuário mandou um detalhe com um cabeçalho que ainda não foi persistido
              01.1-se este for o caso, persista o cabeçalho
            02-verifique qual operação no detalhe foi solicitada pelo usuário
              02.1-se for 'gravar detalhe'
                02.1.1-verifique se é uma inserção
                  02.1.1.1 - insira um novo registro em ged_documento_detalhe
                  02.1.1.2 - insira um registro em ged_versao_documento com ação=I
                    --- calcule o hash do arquivo e grave no campo HASH_ARQUIVO
                02.1.2-verifique se é uma alteração
                  02.1.2.1 - altere o registro em ged_documento_detalhe
                  02.1.2.2 - insira um registro em ged_versao_documento com ação=A
                    --- calcule o hash do arquivo e grave no campo HASH_ARQUIVO
              02.2-se for 'excluir detalhe'
                02.2.1 - altere o registro em ged_documento_detalhe informando a data da exclusão
                02.2.2 - insira um registro em ged_versao_documento com ação=E
                    --- calcule o hash do arquivo e grave no campo HASH_ARQUIVO
            03-verifique se o detalhe veio com o campo 'assinado="S"'
              03.1-neste caso utilize o OpenSSL para assinar o arquivo
            */
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
}