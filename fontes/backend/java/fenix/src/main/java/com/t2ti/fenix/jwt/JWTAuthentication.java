/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Classe responsável por autenticar o usuário.
                                                                                
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
package com.t2ti.fenix.jwt;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.exc.MismatchedInputException;
import com.t2ti.fenix.exception.FalhaAutenticacaoException;
import com.t2ti.fenix.model.cadastros.Usuario;

public class JWTAuthentication extends AbstractAuthenticationProcessingFilter {

	public JWTAuthentication(String defaultFilterProcessesUrl, AuthenticationManager authManager) {
		super(defaultFilterProcessesUrl);
		// define o gerenciador de autenticação
		setAuthenticationManager(authManager);
	}

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
			throws AuthenticationException, IOException, ServletException {

		try {
			// pega o json no corpo da requisição e converte para a classe Usuario
			// se ocorrer erro na conversão do objeto será lançada a exceção MismatchedInputException 
			Usuario usuario = new ObjectMapper().readValue(request.getInputStream(), Usuario.class);

			// verifica se o login e senha estão corretos. A senha armazenada no banco de
			// dados é o MD5 da concatenação do login e senha do usuário.
			return getAuthenticationManager().authenticate(new UsernamePasswordAuthenticationToken(usuario.getLogin(),
					usuario.getLogin() + usuario.getSenha(), new ArrayList<>()));
			
		} catch (MismatchedInputException e) {
			throw new FalhaAutenticacaoException("Bad Request");
		}
	}

	/*
	 * Método executado caso o login e senha do usuário estejam corretos.
	 * 
	 */
	@Override
	protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain,
			Authentication authResult) throws IOException, ServletException {

		// retorna no cabeçalho da resposta o token para que seja utilizado nas
		// próximas requisições.
		// response.setHeader("cache-control", JWTManager.geraToken(authResult.getName()));
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");		
		response.getWriter().write("{ \"token\": \"" + JWTManager.geraToken(authResult.getName()) + "\" }" );
		response.getWriter().flush();
		response.getWriter().close();		
	}

	/*
	 * Método executado caso o login e senha do usuário estejam INcorretos.
	 * 
	 */
	@Override
	protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException failed) throws IOException, ServletException {

		// retorna o status 401 com a respectiva mensagem de erro
		response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Usuário e/ou senha inválidos");
	}
}
