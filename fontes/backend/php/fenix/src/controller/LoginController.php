<?php

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface as RequestHandler;
use Slim\Psr7\Response;

use Firebase\JWT\BeforeValidException;
use Firebase\JWT\ExpiredException;
use Firebase\JWT\JWT;
use Firebase\JWT\SignatureInvalidException;

class LoginController extends ControllerBase
{

    private static $key = "#Sua-Chave-de-32-caracteres-aqui";
    private static $alg = array('HS256');

    // metodo chamado pelo Slim antes de processar as requisições das rotas que o MiddleWare foi adicionado
    public function __invoke(Request $request, RequestHandler $handler): Response
    {
        $token = null;
        $header = $request->getHeader("authorization");
        if (count($header) == 1) {
            $token = substr($header[0], 7); // busca o token no header da requisição
        }

        if (isset($token)) {
            if ($this->verificaToken($token)) {
                return $handler->handle($request); // se o token for válido processa a requisição
            }
        }
        
        // caso o token seja inválido retorna um http 401.
        $response = new Response();
        return parent::tratarErro($response, 401, 'Unauthorized', null);
    }

    // realiza a autenticação do usuário => rota '/fenix/login'
    public function login($request, $response, $args) {
        try {
            // pegar o objeto da requisição
            $usuario = json_decode($request->getBody());
            // valida o objeto
            if (!isset($usuario)) {
                return parent::tratarErro($response, 400, 'Objeto inválido [Login] - objeto não enviado.', null);
            }

            $usuario->administrador = null;
            $usuario->dataCadastro = null;

            $objEntidade = new Usuario($usuario);
            
            $login = $objEntidade->getLogin();
            $senha = $objEntidade->getSenha();
            $md5Senha = md5($login . $senha);

            $filtro = new Filtro(null);
            $filtro->where = " t.login = '$login' AND t.senha = '$md5Senha' ";
            
            $retornoConsulta = UsuarioService::consultarListaFiltroValor($filtro);

            if (empty($retornoConsulta)) {
                // se os dados do usuário estiverem INcorretos retorna um http 401.
                return parent::tratarErro($response, 401, 'Usuário e/ou senha inválidos!', null);
            } else {

                // se os dados do usuário estiverem corretos gera o token e retorna no cabeçalho da requisição.
                $token = $this->geraToken($objEntidade->getLogin());

				$response->getBody()->write('{"token": "' . $token . '"}');

                return $response
                    ->withHeader('Content-Type', 'application/json')
					->withStatus(200);
			}
        } catch (Exception $e) {
            return parent::tratarErro($response, 500, 'Erro no Servidor [Login]', $e);
        }
    }

    private function geraToken(string $subject): string
    {
        $token = array(
            "sub" => $subject
        );

        return JWT::encode($token, self::$key);
    }

    private function verificaToken(string $token): bool
    {
        if ($token != null) {
            try {
                JWT::decode($token, self::$key, self::$alg);

                return true;
            } catch (UnexpectedValueException | SignatureInvalidException | BeforeValidException | ExpiredException $e) {
                return false;
            }
        }
        return false;
    }
    
}