/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service responsável por validar os dados do usuário, gerar o token 
e validar o token.
                                                                                
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
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { Usuario } from './../cadastros/usuario/usuario.entity';

@Injectable()
export class LoginService extends TypeOrmCrudService<Usuario>{

    private key: string = "#Sua-chave-de-32-caracteres-aqui";

    constructor(
        @InjectRepository(Usuario) repository) { super(repository); }

    async login(usuario: Usuario) {
        const crypto = require('crypto');
        let md5Senha = crypto.createHash('md5').update(usuario.login + usuario.senha).digest('hex');

        let user = await this.findOne({ where: { login: usuario.login, senha: md5Senha } });

        if (user != null) {
            return this.gerarJwt(usuario.login);
        }
        throw new UnauthorizedException();
    }

    async gerarJwt(login: string) {
        const jwt = require('jsonwebtoken');

        return jwt.sign({ sub: login }, this.key);
    }

    verificarToken(token: string): boolean {
        try {
            const jwt = require('jsonwebtoken');
            let decoded = jwt.verify(token, this.key);
    
            if (decoded != null) {
                return true;
            }
        } catch (error) {
            return false;
        }
        return false;
    }
}