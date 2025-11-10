unit uFormPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, UAPIServer;

type

  { TFormPrincipal }

  TFormPrincipal = class(TForm)
    TrayIcon: TTrayIcon;
    procedure FormCreate(Sender: TObject);
  private
    FServidorAtivo: Boolean;
  public
    procedure AtualizarStatusServidor(Sender: TObject);
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.lfm}

{ TFormPrincipal }

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  WindowState := wsMinimized;
  Hide;
  TrayIcon.Visible := True;
  TrayIcon.Hint := 'Gerador de Arquivos Fiscais - Parado';
  FServidorAtivo := False;
end;

procedure TFormPrincipal.AtualizarStatusServidor(Sender: TObject);
begin
  if Sender is TAPIServer then
  begin
    FServidorAtivo := True;
    TrayIcon.Hint := 'Gerador de Arquivos Fiscais - Executando na porta 9000';
    TrayIcon.BalloonTitle := 'Servidor Iniciado';
    TrayIcon.BalloonHint := 'API REST executando na porta 9000';
    TrayIcon.ShowBalloonHint;
  end;
end;

end.
