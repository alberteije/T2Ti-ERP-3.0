import { Injectable, NestInterceptor, ExecutionContext, CallHandler, UnauthorizedException } from '@nestjs/common';
import { Observable } from 'rxjs';
import { LoginService } from './login/login.service';

//https://docs.nestjs.com/interceptors

@Injectable()
export class AppInterceptor implements NestInterceptor {

    constructor(private loginService: LoginService) { };

    intercept(context: ExecutionContext, next: CallHandler): Observable<any> {

        const rotasLiberadas = ["/login"]; // array que contém as rotas que podem ser acessadas sem necessidade de envio do JWT.

        if (rotasLiberadas.includes(context.switchToHttp().getRequest().originalUrl)) {
            return next.handle();
        }
    
        let token: string = context.switchToHttp().getRequest().headers['authorization'];

        if (token != null) {
            if (this.loginService.verificarToken(token.replace("Bearer ", ""))) {
                return next.handle();
            } else {
                throw new UnauthorizedException();
            }
        }

        throw new UnauthorizedException();
    }
}