<?php
//error_reporting(E_ALL);
// set_error_handler(function ($severity, $message, $file, $line) {
//     if (error_reporting()& $severity) {
//         switch ($severity) {
//             case E_ERROR: // 1 //
//                 throw new \ErrorException($message, 0, $severity, $file, $line);
//             case E_WARNING: // 2 //
//                 break;
//             case E_PARSE: // 4 //
//                 throw new \ErrorException($message, 0, $severity, $file, $line);
//             case E_NOTICE: // 8 //
//                 break;
//             case E_CORE_ERROR: // 16 //
//                 throw new \ErrorException($message, 0, $severity, $file, $line);
//             case E_CORE_WARNING: // 32 //
//                 break;
//             case E_COMPILE_ERROR: // 64 //
//                 throw new \ErrorException($message, 0, $severity, $file, $line);
//             case E_COMPILE_WARNING: // 128 //
//                 throw new \ErrorException($message, 0, $severity, $file, $line);
//             case E_USER_ERROR: // 256 //
//                 throw new \ErrorException($message, 0, $severity, $file, $line);
//             case E_USER_WARNING: // 512 //
//                 throw new \ErrorException($message, 0, $severity, $file, $line);
//             case E_USER_NOTICE: // 1024 //
//                 throw new \ErrorException($message, 0, $severity, $file, $line);
//             case E_STRICT: // 2048 //
//                 throw new \ErrorException($message, 0, $severity, $file, $line);
//             case E_RECOVERABLE_ERROR: // 4096 //
//                 throw new \ErrorException($message, 0, $severity, $file, $line);
//             case E_DEPRECATED: // 8192 //
//                 throw new \ErrorException($message, 0, $severity, $file, $line);
//             case E_USER_DEPRECATED: // 16384 //
//                 throw new \ErrorException($message, 0, $severity, $file, $line);
//         }
//     }
// });

// variáveis para o resquest e o response
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface;
use Psr\Http\Server\MiddlewareInterface;

// para instanciar o Slim
use Slim\Factory\AppFactory;
// controle de rotas
use Slim\Routing\RouteContext;

//use Illuminate\Database\Capsule\Manager as Capsule;
require './vendor/autoload.php';

// inserir a conexão com o banco de dados
//require './src/config/db.php';
//require_once('./src/config/eloquent.php');

// instancia o Slim
$app = AppFactory::create();

// #region CORS
// // fonte: http://www.slimframework.com/docs/v4/cookbook/enable-cors.html
// $app->addBodyParsingMiddleware();

// // This middleware will append the response header Access-Control-Allow-Methods with all allowed methods
// $app->add(function (Request $request, RequestHandlerInterface $handler): Response {
//     $routeContext = RouteContext::fromRequest($request);
//     $routingResults = $routeContext->getRoutingResults();
//     $methods = $routingResults->getAllowedMethods();
//     $requestHeaders = $request->getHeaderLine('Access-Control-Request-Headers');

//     $response = $handler->handle($request);

//     $response = $response->withHeader('Access-Control-Allow-Origin', '*');
//     // $response = $response->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
//     $response = $response->withHeader('Access-Control-Allow-Methods', implode(',', $methods));
//     $response = $response->withHeader('Access-Control-Allow-Headers', $requestHeaders);

//     // Optional: Allow Ajax CORS requests with Authorization header
//     // $response = $response->withHeader('Access-Control-Allow-Credentials', 'true');

//     return $response;
// });

// // The RoutingMiddleware should be added after our CORS middleware so routing is performed first
// $app->addRoutingMiddleware();
// #endregion CORS

// usa o projeto como Sub-Directory sem precisar de Virtual Host
$app->setBasePath('/fenix');


// rotal inicial padrão para testes
$app->get('/', function (Request $request, Response $response, array $args) {

    // $gerenteConexao = GerenteConexaoE::getInstance();
    // $listaConsulta = $gerenteConexao->entityManager::table('banco')->where('id', '>', 0)->get();	
    // $retorno = json_encode($listaConsulta);
    // $response->getBody()->write($retorno);
    // return $response->withHeader('Content-Type', 'application/json');

    $response->getBody()->write("Servidor T2Ti ERP Fenix funcionando!");
    return $response;
});

// require once
require_once('./src/util/Biblioteca.php');
require_once('./src/util/Constantes.php');
//require_once('./src/config/doctrine.php');
require_once('./src/controller/Controllers.php');
require_once('./src/service/Services.php');
require_once('./src/model/Models.php');
require_once('./src/lib/Libs.php');
require_once('./rotas.php');

// para executar a aplicação - sem isso as rotas não vão funcionar
$app->run();