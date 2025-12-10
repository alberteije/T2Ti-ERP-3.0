{$notes off}
{$WARNINGS OFF}
unit UAPIServer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, EdiController, fphttpserver, fpjson, jsonparser;

type
  TAPIServer = class;

  TRequestHandler = procedure(Sender: TObject; var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse) of object;

  TAPIThread = class(TThread)
  private
    FServer: TFPHTTPServer;
    procedure HandleRequest(Sender: TObject; var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
  protected
    procedure Execute; override;
  public
    constructor Create(APort: Integer);
    destructor Destroy; override;
  end;

  TAPIServer = class
  private
    FThread: TAPIThread;
    FPort: Integer;
    FOnStatus: TNotifyEvent;
  public
    constructor Create(APort: Integer);
    destructor Destroy; override;
    procedure Start;
    procedure Stop;

    property Port: Integer read FPort;
    property OnStatus: TNotifyEvent read FOnStatus write FOnStatus;
  end;

// Handlers das rotas
procedure HandleStatus(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
procedure HandleSpedContabil(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
procedure HandleSpedFiscal(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
procedure HandleSpedContribuicoes(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
procedure HandleSintegra(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
procedure HandleReinf(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
procedure HandleESocial(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);

procedure HandleBoletoGerarRemessa(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
procedure HandleBoletoProcessarRetorno(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);

procedure HandleNotFound(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);

var
  APIServer: TAPIServer;

implementation

uses
  SpedContabilController, SpedFiscalController, SpedContribuicoesController,
  SintegraController, ReinfController, ESocialController;

{ TAPIThread }

constructor TAPIThread.Create(APort: Integer);
begin
  inherited Create(True);
  FreeOnTerminate := False;
  FServer := TFPHTTPServer.Create(nil);
  FServer.Port := APort;
  FServer.Threaded := True;
  FServer.OnRequest := @HandleRequest;
end;

destructor TAPIThread.Destroy;
begin
  FServer.Active := False;
  FServer.Free;
  inherited Destroy;
end;

procedure TAPIThread.Execute;
begin
  try
    FServer.Active := True;
  except
    on E: Exception do
    begin
      // Log do erro
    end;
  end;
end;

procedure TAPIThread.HandleRequest(Sender: TObject; var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
begin
  // Configurar CORS
  AResponse.SetCustomHeader('Access-Control-Allow-Origin', '*');
  AResponse.SetCustomHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  AResponse.SetCustomHeader('Access-Control-Allow-Headers', 'Content-Type');

  // Handlers específicos
  if ARequest.Method = 'OPTIONS' then
  begin
    AResponse.Content := '';
    AResponse.SendResponse;
    Exit;
  end;

  case ARequest.URL of
    '/api/status': HandleStatus(ARequest, AResponse);
    '/api/sped/contabil': HandleSpedContabil(ARequest, AResponse);
    '/api/sped/fiscal': HandleSpedFiscal(ARequest, AResponse);
    '/api/sped/contribuicoes': HandleSpedContribuicoes(ARequest, AResponse);
    '/api/sintegra': HandleSintegra(ARequest, AResponse);
    '/api/reinf': HandleReinf(ARequest, AResponse);
    '/api/esocial': HandleESocial(ARequest, AResponse);
    '/api/boleto/gerar-remessa': HandleBoletoGerarRemessa(ARequest, AResponse);
    '/api/boleto/processar-retorno': HandleBoletoProcessarRetorno(ARequest, AResponse);
  else
    HandleNotFound(ARequest, AResponse);
  end;
end;

{ TAPIServer }

constructor TAPIServer.Create(APort: Integer);
begin
  FPort := APort;
  FThread := TAPIThread.Create(APort);
end;

destructor TAPIServer.Destroy;
begin
  Stop;
  FThread.Free;
  inherited Destroy;
end;

procedure TAPIServer.Start;
begin
  FThread.Start;
  if Assigned(FOnStatus) then
    FOnStatus(Self);
end;

procedure TAPIServer.Stop;
begin
  FThread.Terminate;
  if Assigned(FOnStatus) then
    FOnStatus(Self);
end;

{ Handlers das Rotas }

procedure HandleStatus(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
var
  JSON: TJSONObject;
  Endpoints: TJSONArray;
begin
  JSON := TJSONObject.Create;
  try
    JSON.Add('status', 'online');
    JSON.Add('servidor', 'Gerador de Arquivos Fiscais');
    JSON.Add('dataHora', FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    JSON.Add('versao', '1.0');

    // Lista de endpoints disponíveis
    Endpoints := TJSONArray.Create;
    Endpoints.Add('/api/status (GET)');
    Endpoints.Add('/api/sped/contabil (POST)');
    Endpoints.Add('/api/sped/fiscal (POST)');
    Endpoints.Add('/api/sped/contribuicoes (POST)');
    Endpoints.Add('/api/sintegra (POST)');
    Endpoints.Add('/api/reinf (POST)');
    Endpoints.Add('/api/esocial (POST)');
    Endpoints.Add('/api/boleto/gerar-remessa (POST)');
    Endpoints.Add('/api/boleto/processar-retorno (POST)');

    JSON.Add('endpoints', Endpoints);

    AResponse.Content := JSON.AsJSON;
    AResponse.ContentType := 'application/json';
    AResponse.Code := 200;
  finally
    JSON.Free;
  end;
end;

{
 Para testar no PostMan:
 http://localhost:9000/api/sped/contabil
 json:
 {
    "dataInicial": "2024-01-01",
    "dataFinal": "2024-01-31",
    "formaEscrituracao": "0",
    "versaoLayout": "1",
    "idEmpresa": "1",
    "idContador": "1"
 }
}
procedure HandleSpedContabil(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
var
  JSON, ResponseJSON: TJSONObject;
  Parser: TJSONParser;
  Filtro, ArquivoGerado: String;
  JSONData: TJSONData;
begin
  if ARequest.Method <> 'POST' then
  begin
    AResponse.Content := '{"erro": "Método não permitido"}';
    AResponse.ContentType := 'application/json';
    AResponse.Code := 405;
    Exit;
  end;

  ResponseJSON := TJSONObject.Create;
  try
    try
      // Parse do JSON recebido
      Parser := TJSONParser.Create(ARequest.Content);
      JSONData := Parser.Parse;
      try
        if not (JSONData is TJSONObject) then
          raise Exception.Create('JSON inválido');

        JSON := TJSONObject(JSONData);

        // Verifica se todos os campos existem
        if not (JSON.Find('periodoInicial') <> nil) and
           not (JSON.Find('periodoFinal') <> nil) and
           not (JSON.Find('formaEscrituracao') <> nil) and
           not (JSON.Find('versaoLayout') <> nil) and
           not (JSON.Find('idEmpresa') <> nil) and
           not (JSON.Find('idContador') <> nil) then
          raise Exception.Create('Campos obrigatórios faltando');

        // Converte JSON para string com pipes - SPED Contábil agora com 6 parâmetros
        Filtro := JSON.Get('periodoInicial', '') + '|' +
                  JSON.Get('periodoFinal', '') + '|' +
                  JSON.Get('formaEscrituracao', '') + '|' +
                  JSON.Get('versaoLayout', '') + '|' +
                  JSON.Get('idEmpresa', '') + '|' +
                  JSON.Get('idContador', '');

        // Chama o controller existente
        ArquivoGerado := TSpedContabilController.GerarSpedContabil(Filtro);

        ResponseJSON.Add('sucesso', True);
        ResponseJSON.Add('arquivo', ArquivoGerado);
        ResponseJSON.Add('mensagem', 'SPED Contábil gerado com sucesso');

        AResponse.Content := ResponseJSON.AsJSON;
        AResponse.ContentType := 'application/json';
        AResponse.Code := 200;
      finally
        JSONData.Free;
        Parser.Free;
      end;
    except
      on E: Exception do
      begin
        ResponseJSON.Add('sucesso', False);
        ResponseJSON.Add('erro', E.Message);
        AResponse.Content := ResponseJSON.AsJSON;
        AResponse.ContentType := 'application/json';
        AResponse.Code := 500;
      end;
    end;
  finally
    ResponseJSON.Free;
  end;
end;

{
 Para testar no PostMan:
 http://localhost:9000/api/sped/fiscal
 json:
 {
     "dataInicial": "2024-01-01",
     "dataFinal": "2024-01-31",
     "versaoLeiaute": "0",
     "finalidadeArquivo": "0",
     "perfilApresentacao": "0",
     "idEmpresa": "1",
     "inventario": "0",
     "idContador": "1"
 }
}
procedure HandleSpedFiscal(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
var
  JSON, ResponseJSON: TJSONObject;
  Parser: TJSONParser;
  Filtro, ArquivoGerado: String;
  JSONData: TJSONData;
begin
  if ARequest.Method <> 'POST' then
  begin
    AResponse.Content := '{"erro": "Método não permitido"}';
    AResponse.ContentType := 'application/json';
    AResponse.Code := 405;
    Exit;
  end;

  ResponseJSON := TJSONObject.Create;
  try
    try
      // Parse do JSON recebido
      Parser := TJSONParser.Create(ARequest.Content);
      JSONData := Parser.Parse;
      try
        if not (JSONData is TJSONObject) then
          raise Exception.Create('JSON inválido');

        JSON := TJSONObject(JSONData);

        // Verifica se todos os campos existem
        if not (JSON.Find('periodoInicial') <> nil) and
           not (JSON.Find('periodoFinal') <> nil) and
           not (JSON.Find('versaoLayout') <> nil) and
           not (JSON.Find('finalidadeArquivo') <> nil) and
           not (JSON.Find('perfilApresentacao') <> nil) and
           not (JSON.Find('idEmpresa') <> nil) and
           not (JSON.Find('inventario') <> nil) and
           not (JSON.Find('idContador') <> nil) then
          raise Exception.Create('Campos obrigatórios faltando');

        // Converte JSON para string com pipes - SPED Fiscal tem 8 parâmetros
        Filtro := JSON.Get('periodoInicial', '') + '|' +
                  JSON.Get('periodoFinal', '') + '|' +
                  JSON.Get('versaoLayout', '') + '|' +
                  JSON.Get('finalidadeArquivo', '') + '|' +
                  JSON.Get('perfilApresentacao', '') + '|' +
                  JSON.Get('idEmpresa', '') + '|' +
                  JSON.Get('inventario', '') + '|' +
                  JSON.Get('idContador', '');

        // Chama o controller do SPED Fiscal
        ArquivoGerado := TSpedFiscalController.GerarSpedFiscal(Filtro);

        ResponseJSON.Add('sucesso', True);
        ResponseJSON.Add('arquivo', ArquivoGerado);
        ResponseJSON.Add('mensagem', 'SPED Fiscal gerado com sucesso');

        AResponse.Content := ResponseJSON.AsJSON;
        AResponse.ContentType := 'application/json';
        AResponse.Code := 200;
      finally
        JSONData.Free;
        Parser.Free;
      end;
    except
      on E: Exception do
      begin
        ResponseJSON.Add('sucesso', False);
        ResponseJSON.Add('erro', E.Message);
        AResponse.Content := ResponseJSON.AsJSON;
        AResponse.ContentType := 'application/json';
        AResponse.Code := 500;
      end;
    end;
  finally
    ResponseJSON.Free;
  end;
end;

{
 Para testar no PostMan:
 http://localhost:9000/api/sped/contribuicoes
 json:
 {
     "dataInicial": "2024-01-01",
     "dataFinal": "2024-01-31",
     "versaoLeiaute": "0",
     "tipoEscrituracao": "0",
     "idEmpresa": "1",
     "idContador": "1"
 }
}
procedure HandleSpedContribuicoes(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
var
  JSON, ResponseJSON: TJSONObject;
  Parser: TJSONParser;
  Filtro, ArquivoGerado: String;
  JSONData: TJSONData;
begin
  if ARequest.Method <> 'POST' then
  begin
    AResponse.Content := '{"erro": "Método não permitido"}';
    AResponse.ContentType := 'application/json';
    AResponse.Code := 405;
    Exit;
  end;

  ResponseJSON := TJSONObject.Create;
  try
    try
      // Parse do JSON recebido
      Parser := TJSONParser.Create(ARequest.Content);
      JSONData := Parser.Parse;
      try
        if not (JSONData is TJSONObject) then
          raise Exception.Create('JSON inválido');

        JSON := TJSONObject(JSONData);

        // Verifica se todos os campos existem
        if not (JSON.Find('periodoInicial') <> nil) and
           not (JSON.Find('periodoFinal') <> nil) and
           not (JSON.Find('versaoLayout') <> nil) and
           not (JSON.Find('tipoEscrituracao') <> nil) and
           not (JSON.Find('idEmpresa') <> nil) and
           not (JSON.Find('idContador') <> nil) then
          raise Exception.Create('Campos obrigatórios faltando');

        // Converte JSON para string com pipes - SPED Contribuições tem 6 parâmetros
        Filtro := JSON.Get('periodoInicial', '') + '|' +
                  JSON.Get('periodoFinal', '') + '|' +
                  JSON.Get('versaoLayout', '') + '|' +
                  JSON.Get('tipoEscrituracao', '') + '|' +
                  JSON.Get('idEmpresa', '') + '|' +
                  JSON.Get('idContador', '');

        // Chama o controller do SPED Contribuições
        ArquivoGerado := TSpedContribuicoesController.GerarSpedContribuicoes(Filtro);

        ResponseJSON.Add('sucesso', True);
        ResponseJSON.Add('arquivo', ArquivoGerado);
        ResponseJSON.Add('mensagem', 'SPED Contribuições gerado com sucesso');

        AResponse.Content := ResponseJSON.AsJSON;
        AResponse.ContentType := 'application/json';
        AResponse.Code := 200;
      finally
        JSONData.Free;
        Parser.Free;
      end;
    except
      on E: Exception do
      begin
        ResponseJSON.Add('sucesso', False);
        ResponseJSON.Add('erro', E.Message);
        AResponse.Content := ResponseJSON.AsJSON;
        AResponse.ContentType := 'application/json';
        AResponse.Code := 500;
      end;
    end;
  finally
    ResponseJSON.Free;
  end;
end;

{
 Para testar no PostMan:
 http://localhost:9000/api/sintegra
 json:
 {
     "dataInicial": "2024-01-01",
     "dataFinal": "2024-01-31",
     "codigoConvenio": "1",
     "finalidadeArquivo": "1",
     "naturezaInformacao": "1",
     "idEmpresa": "1",
     "inventario": "0",
     "idContador": "1"
 }
}
procedure HandleSintegra(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
var
  JSON, ResponseJSON: TJSONObject;
  Parser: TJSONParser;
  Filtro, ArquivoGerado: String;
  JSONData: TJSONData;
begin
  if ARequest.Method <> 'POST' then
  begin
    AResponse.Content := '{"erro": "Método não permitido"}';
    AResponse.ContentType := 'application/json';
    AResponse.Code := 405;
    Exit;
  end;

  ResponseJSON := TJSONObject.Create;
  try
    try
      // Parse do JSON recebido
      Parser := TJSONParser.Create(ARequest.Content);
      JSONData := Parser.Parse;
      try
        if not (JSONData is TJSONObject) then
          raise Exception.Create('JSON inválido');

        JSON := TJSONObject(JSONData);

        // Verifica se todos os campos existem
        if not (JSON.Find('periodoInicial') <> nil) and
           not (JSON.Find('periodoFinal') <> nil) and
           not (JSON.Find('codigoConvenio') <> nil) and
           not (JSON.Find('finalidadeArquivo') <> nil) and
           not (JSON.Find('naturezaInformacoes') <> nil) and
           not (JSON.Find('idEmpresa') <> nil) and
           not (JSON.Find('inventario') <> nil) and
           not (JSON.Find('idContador') <> nil) then
          raise Exception.Create('Campos obrigatórios faltando');

        // Converte JSON para string com pipes - Sintegra tem 8 parâmetros
        Filtro := JSON.Get('periodoInicial', '') + '|' +
                  JSON.Get('periodoFinal', '') + '|' +
                  JSON.Get('codigoConvenio', '') + '|' +
                  JSON.Get('finalidadeArquivo', '') + '|' +
                  JSON.Get('naturezaInformacoes', '') + '|' +
                  JSON.Get('idEmpresa', '') + '|' +
                  JSON.Get('inventario', '') + '|' +
                  JSON.Get('idContador', '');

        // Chama o controller do Sintegra
        ArquivoGerado := TSintegraController.GerarSintegra(Filtro);

        ResponseJSON.Add('sucesso', True);
        ResponseJSON.Add('arquivo', ArquivoGerado);
        ResponseJSON.Add('mensagem', 'Sintegra gerado com sucesso');

        AResponse.Content := ResponseJSON.AsJSON;
        AResponse.ContentType := 'application/json';
        AResponse.Code := 200;
      finally
        JSONData.Free;
        Parser.Free;
      end;
    except
      on E: Exception do
      begin
        ResponseJSON.Add('sucesso', False);
        ResponseJSON.Add('erro', E.Message);
        AResponse.Content := ResponseJSON.AsJSON;
        AResponse.ContentType := 'application/json';
        AResponse.Code := 500;
      end;
    end;
  finally
    ResponseJSON.Free;
  end;
end;

{
 Para testar no PostMan:
 http://localhost:9000/api/reinf
 json:
 {
     "dataInicial": "2024-01-01",
     "dataFinal": "2024-01-31",
     "tipoEvento": "0",
     "idEmpresa": "1",
     "ambiente": "2",
     "idContador": "1"
 }

 Observações:
 - ambiente: 1=Produção, 2=Homologação
 - tipoEvento: 0=Todos, 1=Informações Contribuinte, 2=Retenções, 3=Consolidação
}
procedure HandleReinf(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
var
  JSON, ResponseJSON: TJSONObject;
  Parser: TJSONParser;
  Filtro, ArquivoGerado: String;
  JSONData: TJSONData;
begin
  if ARequest.Method <> 'POST' then
  begin
    AResponse.Content := '{"erro": "Método não permitido"}';
    AResponse.ContentType := 'application/json';
    AResponse.Code := 405;
    Exit;
  end;

  ResponseJSON := TJSONObject.Create;
  try
    try
      // Parse do JSON recebido
      Parser := TJSONParser.Create(ARequest.Content);
      JSONData := Parser.Parse;
      try
        if not (JSONData is TJSONObject) then
          raise Exception.Create('JSON inválido');

        JSON := TJSONObject(JSONData);

        // Verifica se todos os campos existem
        if not (JSON.Find('periodoInicial') <> nil) and
           not (JSON.Find('periodoFinal') <> nil) and
           not (JSON.Find('tipoEvento') <> nil) and
           not (JSON.Find('idEmpresa') <> nil) and
           not (JSON.Find('ambiente') <> nil) and
           not (JSON.Find('idContador') <> nil) then
          raise Exception.Create('Campos obrigatórios faltando');

        // Converte JSON para string com pipes - Reinf tem 6 parâmetros
        Filtro := JSON.Get('periodoInicial', '') + '|' +
                  JSON.Get('periodoFinal', '') + '|' +
                  JSON.Get('tipoEvento', '') + '|' +
                  JSON.Get('idEmpresa', '') + '|' +
                  JSON.Get('ambiente', '') + '|' +
                  JSON.Get('idContador', '');

        // Chama o controller do Reinf
        ArquivoGerado := TReinfController.GerarReinf(Filtro);

        ResponseJSON.Add('sucesso', True);
        ResponseJSON.Add('arquivo', ArquivoGerado);
        ResponseJSON.Add('mensagem', 'EFD-Reinf gerado com sucesso');
        ResponseJSON.Add('formato', 'XML');
        ResponseJSON.Add('observacao', 'Arquivo XML gerado. Para transmissão, é necessário certificado digital.');

        AResponse.Content := ResponseJSON.AsJSON;
        AResponse.ContentType := 'application/json';
        AResponse.Code := 200;
      finally
        JSONData.Free;
        Parser.Free;
      end;
    except
      on E: Exception do
      begin
        ResponseJSON.Add('sucesso', False);
        ResponseJSON.Add('erro', E.Message);
        ResponseJSON.Add('observacao', 'Verifique a configuração do certificado digital e os parâmetros enviados.');
        AResponse.Content := ResponseJSON.AsJSON;
        AResponse.ContentType := 'application/json';
        AResponse.Code := 500;
      end;
    end;
  finally
    ResponseJSON.Free;
  end;
end;

{
 Para testar no PostMan:
 http://localhost:9000/api/esocial
 json:
 {
    "dataInicial": "2024-01-01",
    "dataFinal": "2024-01-31",
    "competencia": "2024-01",
    "idEmpresa": "1"
 }
}
procedure HandleESocial(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
var
  JSON, ResponseJSON: TJSONObject;
  Parser: TJSONParser;
  Filtro, ArquivoGerado: String;
  JSONData: TJSONData;
begin
  if ARequest.Method <> 'POST' then
  begin
    AResponse.Content := '{"erro": "Método não permitido"}';
    AResponse.ContentType := 'application/json';
    AResponse.Code := 405;
    Exit;
  end;

  ResponseJSON := TJSONObject.Create;
  Parser := nil;
  JSONData := nil;

  try
    try
      // Parse do JSON recebido
      Parser := TJSONParser.Create(ARequest.Content);
      JSONData := Parser.Parse;

      if not (JSONData is TJSONObject) then
        raise Exception.Create('JSON inválido');

      JSON := TJSONObject(JSONData);

      // Verificação dos campos obrigatórios
      if (JSON.Find('periodoInicial') = nil) or
         (JSON.Find('periodoFinal') = nil) or
         (JSON.Find('competencia') = nil) or
         (JSON.Find('idEmpresa') = nil) then
        raise Exception.Create('Campos obrigatórios faltando: dataInicial, dataFinal, competencia, idEmpresa');

      // Validação adicional dos dados
      if (JSON.Get('periodoInicial', '') = '') or
         (JSON.Get('periodoFinal', '') = '') or
         (JSON.Get('competencia', '') = '') then
        raise Exception.Create('Datas e competência são obrigatórias');

      // Converte JSON para string com pipes
      Filtro := JSON.Get('periodoInicial', '') + '|' +
                JSON.Get('periodoFinal', '') + '|' +
                JSON.Get('competencia', '') + '|' +
                JSON.Get('idEmpresa', '');

      // Chama o controller do eSocial
      ArquivoGerado := TESocialController.GerarESocial(Filtro);

      ResponseJSON.Add('sucesso', True);
      ResponseJSON.Add('arquivo', ArquivoGerado);
      ResponseJSON.Add('mensagem', 'eSocial gerado com sucesso');
      ResponseJSON.Add('formato', 'XML');
      ResponseJSON.Add('eventos_gerados', 'S1000, S1005, S1010, S1020, S1200, S1300');

      AResponse.Content := ResponseJSON.AsJSON;
      AResponse.ContentType := 'application/json';
      AResponse.Code := 200;

    except
      on E: Exception do
      begin
        ResponseJSON.Clear;
        ResponseJSON.Add('sucesso', False);
        ResponseJSON.Add('erro', E.Message);
        ResponseJSON.Add('observacao', 'Verifique os parâmetros enviados e a configuração do eSocial.');
        AResponse.Content := ResponseJSON.AsJSON;
        AResponse.ContentType := 'application/json';
        AResponse.Code := 400;
      end;
    end;
  finally
    if Assigned(JSONData) then
      JSONData.Free;
    if Assigned(Parser) then
      Parser.Free;
    ResponseJSON.Free;
  end;
end;

{
 Para testar no PostMan:
 http://localhost:9000/api/boleto/gerar-remessa
 json:
 {
    "idEmpresa": "1",
    "idContaCaixa": "1",
    "idCliente": "1",
    "filtroParcelas": "EMITIU_BOLETO='S' AND DATA_VENCIMENTO >= '2024-01-01'"
 }
}
procedure HandleBoletoGerarRemessa(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
var
  JSON, ResponseJSON: TJSONObject;
  Parser: TJSONParser;
  Filtro, ArquivoGerado: String;
  JSONData: TJSONData;
begin
  if ARequest.Method <> 'POST' then
  begin
    AResponse.Content := '{"erro": "Método não permitido"}';
    AResponse.ContentType := 'application/json';
    AResponse.Code := 405;
    Exit;
  end;

  ResponseJSON := TJSONObject.Create;
  try
    try
      // Parse do JSON recebido
      Parser := TJSONParser.Create(ARequest.Content);
      JSONData := Parser.Parse;
      try
        if not (JSONData is TJSONObject) then
          raise Exception.Create('JSON inválido');

        JSON := TJSONObject(JSONData);

        // Verifica campos obrigatórios
        if not (JSON.Find('idEmpresa') <> nil) or
           not (JSON.Find('idContaCaixa') <> nil) then
          raise Exception.Create('Campos obrigatórios faltando: idEmpresa, idContaCaixa');

        // Montar filtro com pipes
        Filtro := JSON.Get('idEmpresa', '') + '|' +
                  JSON.Get('idContaCaixa', '') + '|' +
                  JSON.Get('idCliente', '0') + '|' +
                  JSON.Get('filtroParcelas', '');

        // Chama o controller do boleto
        ArquivoGerado := TEdiController.GerarRemessa(Filtro);

        ResponseJSON.Add('sucesso', True);
        ResponseJSON.Add('arquivo', ArquivoGerado);
        ResponseJSON.Add('mensagem', 'Arquivo de remessa gerado com sucesso');
        ResponseJSON.Add('boletosProcessados', '0'); // Pode-se obter da controller

        AResponse.Content := ResponseJSON.AsJSON;
        AResponse.ContentType := 'application/json';
        AResponse.Code := 200;
      finally
        JSONData.Free;
        Parser.Free;
      end;
    except
      on E: Exception do
      begin
        ResponseJSON.Add('sucesso', False);
        ResponseJSON.Add('erro', E.Message);
        ResponseJSON.Add('observacao', 'Verifique a configuração da conta/caixa e dos parâmetros enviados.');
        AResponse.Content := ResponseJSON.AsJSON;
        AResponse.ContentType := 'application/json';
        AResponse.Code := 500;
      end;
    end;
  finally
    ResponseJSON.Free;
  end;
end;

{
 Para testar no PostMan:
 http://localhost:9000/api/boleto/processar-retorno
 json:
 {
    "caminhoArquivo": "C:\\Arquivos\\Retorno\\RETORNO_BB.REM",
    "idContaCaixa": 1
 }
}
procedure HandleBoletoProcessarRetorno(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
var
  JSON, ResponseJSON: TJSONObject;
  Parser: TJSONParser;
  CaminhoArquivo, Resultado: String;
  JSONData: TJSONData;
  LogArray: TJSONArray;
  LogLines: TStringList;
  I: Integer;
begin
  if ARequest.Method <> 'POST' then
  begin
    AResponse.Content := '{"erro": "Método não permitido"}';
    AResponse.ContentType := 'application/json';
    AResponse.Code := 405;
    Exit;
  end;

  ResponseJSON := TJSONObject.Create;
  LogLines := TStringList.Create;
  try
    try
      // Parse do JSON recebido
      Parser := TJSONParser.Create(ARequest.Content);
      JSONData := Parser.Parse;
      try
        if not (JSONData is TJSONObject) then
          raise Exception.Create('JSON inválido');

        JSON := TJSONObject(JSONData);

        // Verifica campos obrigatórios
        if not (JSON.Find('caminhoArquivo') <> nil) then
          raise Exception.Create('Campo obrigatório faltando: caminhoArquivo');

        CaminhoArquivo := JSON.Get('caminhoArquivo', '');

        // Verificar se arquivo existe
        if not FileExists(CaminhoArquivo) then
          raise Exception.Create('Arquivo não encontrado: ' + CaminhoArquivo);

        // Configurar a conta/caixa no ACBrBoleto se informado
        if JSON.Find('idContaCaixa') <> nil then
        begin
          // Aqui você pode configurar o ACBrBoleto com a conta informada
          // Isso é necessário para leitura correta do retorno
        end;

        // Chama o controller para processar retorno
        Resultado := TEdiController.ProcessarRetorno(CaminhoArquivo);

        // Converter resultado para JSON array
        LogLines.Text := Resultado;
        LogArray := TJSONArray.Create;
        for I := 0 to LogLines.Count - 1 do
          LogArray.Add(LogLines[I]);

        ResponseJSON.Add('sucesso', True);
        ResponseJSON.Add('mensagem', 'Arquivo de retorno processado com sucesso');
        ResponseJSON.Add('arquivo', CaminhoArquivo);
        ResponseJSON.Add('registrosProcessados', LogLines.Count);
        ResponseJSON.Add('log', LogArray);

        AResponse.Content := ResponseJSON.AsJSON;
        AResponse.ContentType := 'application/json';
        AResponse.Code := 200;
      finally
        JSONData.Free;
        Parser.Free;
      end;
    except
      on E: Exception do
      begin
        ResponseJSON.Add('sucesso', False);
        ResponseJSON.Add('erro', E.Message);
        ResponseJSON.Add('observacao', 'Erro ao processar arquivo de retorno.');
        AResponse.Content := ResponseJSON.AsJSON;
        AResponse.ContentType := 'application/json';
        AResponse.Code := 500;
      end;
    end;
  finally
    LogLines.Free;
    ResponseJSON.Free;
  end;
end;

procedure HandleNotFound(var ARequest: TFPHTTPConnectionRequest; var AResponse: TFPHTTPConnectionResponse);
var
  JSON: TJSONObject;
begin
  JSON := TJSONObject.Create;
  try
    JSON.Add('erro', 'Endpoint não encontrado: ' + ARequest.URL);
    JSON.Add('metodo', ARequest.Method);

    AResponse.Content := JSON.AsJSON;
    AResponse.ContentType := 'application/json';
    AResponse.Code := 404;
  finally
    JSON.Free;
  end;
end;

initialization
  APIServer := nil;

finalization
  if Assigned(APIServer) then
    APIServer.Free;

end.
{$notes on}
{$WARNINGS ON}
