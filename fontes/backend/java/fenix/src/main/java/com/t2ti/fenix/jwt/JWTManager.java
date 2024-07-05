/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Classe responsável por criar e validar os tokens.
                                                                                
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

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.SignatureException;

public class JWTManager {

	private static final SecretKey KEY = new SecretKeySpec("#Sua-Chave-de-32-caracteres-aqui".getBytes(), "HmacSHA256");
	
	public static String geraToken(String subject) {
		
		String token = Jwts.builder()
				.setSubject(subject) // aqui pode ser definido, por exemplo, o login do usuário. Atentar para não expor informações 'sensíveis', pois esses dados não são criptografados. 
				//.setExpiration(new Date(System.currentTimeMillis() + (120 * 60000))) // remova o comentário dessa linha caso deseje adicionar um prazo de expiração do token  
				.signWith(KEY)
				.compact();
		
		return token;
	}
	
	public static String verificaToken(String token) throws Exception {
		if (token != null) {
			try {
			
				return Jwts.parserBuilder()
				.setSigningKey(KEY)
				.build()
				.parseClaimsJws(token)
				.getBody()
				.getSubject(); //retorna o valor definido em subject do método 'geraToken(String subject)`. 

			} catch (SignatureException | ExpiredJwtException e) {
				throw new Exception("Token inválido ou expirado");
			} catch (Exception e) {
				throw new Exception("Erro desconhecido: " + e.getMessage());
			}
		}
		throw new Exception("Necessário informar o token");
	}
	
}
