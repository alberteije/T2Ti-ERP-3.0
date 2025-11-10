unit SessaoUsuario;

interface

uses Classes, Forms, Windows, IniFiles, SysUtils, UsuarioVO, EmpresaVO, EmpresaEnderecoVO,
  Biblioteca, md5, VO;

type
  TSessaoUsuario = class
  private
    FUrl: String;
    FIdSessao: String;
    FCamadas: Integer;
    FUsuario: TUsuarioVO;
    FEmpresa: TEmpresaVO;

    class var FInstance: TSessaoUsuario;
  public
    constructor Create;
    destructor Destroy; override;

    class function Instance: TSessaoUsuario;

    function AutenticaUsuario(pLogin, pSenha: String): Boolean;

    //Permissões
    function Autenticado: Boolean;

    property URL: String read FUrl;
    property IdSessao: String read FIdSessao;
    property Camadas: Integer read FCamadas write FCamadas;
    property Usuario: TUsuarioVO read FUsuario;
    property Empresa: TEmpresaVO read FEmpresa write FEmpresa;

  end;

implementation

uses EmpresaController;

{ TSessaoUsuario }

constructor TSessaoUsuario.Create;
var
  Ini: TIniFile;
  Servidor: String;
  Porta: Integer;
begin
  inherited Create;

  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Conexao.ini');
  try
    with Ini do
    begin
      if not SectionExists('ServidorApp') then
      begin
        WriteString('ServidorApp','Servidor','localhost');
        WriteInteger('ServidorApp','Porta',8090);
      end;

      Servidor := ReadString('ServidorApp','Servidor','localhost');
      Porta := ReadInteger('ServidorApp','Porta',8090);
      Camadas := ReadInteger('ServidorApp', 'Camadas', 2);
    end;
  finally
    Ini.Free;
  end;

  FUrl := 'http://' + Servidor + ':' + IntToStr(Porta) + '/cgi-bin/servidorT2Ti.cgi/';
end;

destructor TSessaoUsuario.Destroy;
begin
  FUsuario.Free;
  FEmpresa.Free;

  inherited;
end;

class function TSessaoUsuario.Instance: TSessaoUsuario;
begin
  if not Assigned(FInstance) then
  begin
    FInstance := TSessaoUsuario.Create;
    FInstance.Empresa := TEmpresaController.ConsultaObjeto('ID=1');
  end;

  Result := FInstance;
end;

function TSessaoUsuario.Autenticado: Boolean;
begin
  Result := Assigned(FUsuario);
end;

function TSessaoUsuario.AutenticaUsuario(pLogin, pSenha: String): Boolean;
var
  SenhaCript: String;
begin
  FIdSessao := CriaGuidStr;
  FIdSessao := MD5Print(MD5String(FIdSessao));
  try
    //Senha é criptografada com a senha digitada + login
//    SenhaCript := TUsuarioController.CriptografarLoginSenha(pLogin,pSenha);
    //FUsuario := TUsuarioController.Usuario(pLogin,pSenha);
    FUsuario := TUsuarioVO.Create;
    FUsuario.Id := 1;
    FUsuario.IdColaborador := 1;
    FUsuario.Login := pLogin;
    FUsuario.Senha := pSenha;

    Result := Assigned(FUsuario);
  except
    Application.MessageBox('Erro ao autenticar usuário.','Erro de Login', MB_OK+MB_ICONERROR);
    raise;
  end;
end;

end.
