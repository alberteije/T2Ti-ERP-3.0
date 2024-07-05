unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  TPLB3.Codec, TPLB3.CryptographicLibrary, TPLB3.BaseNonVisualComponent, TPLB3.StreamUtils,
  DCPcrypt2, DCPblockciphers, DCPrijndael, DCPrc4, DCPsha1, DCPsha256, DCPbase64,
  TPLB3.OpenSSL;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    Button2: TButton;
    Codec1: TCodec;
    DCP_rijndael1: TDCP_rijndael;
    DCP_rc41: TDCP_rc4;
    DCP_sha11: TDCP_sha1;
    DCP_sha2561: TDCP_sha256;
    CryptographicLibrary1: TCryptographicLibrary;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Codec1SetIV(Value: TMemoryStream);
  private
    { Private declarations }
  public
    function CifrarLockBox(Valor: AnsiString): string;
    function CifrarDCPCrypt(Valor: AnsiString): string;
    function DecifrarDCPCrypt(Valor: AnsiString): string;
  end;

var
  Form1: TForm1;

const
  Chave = '#Sua-Chave-de-32-caracteres-aqui';
  Vetor = '#Seu-Vetor-aqui#';

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Lines.Add('cifrado com TDCP_rijndael');
  Memo1.Lines.Add(CifrarDCPCrypt(Edit1.Text));
//  Memo1.Lines.Add('---------------------------');
//  Memo1.Lines.Add('cifrado com LockBox');
//  Memo1.Lines.Add(CifrarLockBox(Edit1.Text));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Lines.Add('decifrado com TDCP_rijndael');
  Memo1.Lines.Add(DecifrarDCPCrypt(Edit1.Text));
end;

function TForm1.CifrarDCPCrypt(Valor: AnsiString): string;
var
  Cipher: TDCP_rijndael;
  Data, Key, IV: AnsiString;
  index, dataLength, bsize, pad: integer;
begin
  key := '#Sua-Chave-de-32-caracteres-aqui';
  iv  := '#Seu-Vetor-aqui#';
  Data := Valor;

  Cipher := TDCP_rijndael.Create(nil);
  try
    Cipher.Init(key[1], 256, @IV[1]);

    //don't miss padding
    {start padding}
//    dataLength := Length(Data);
//    bsize := (Cipher.BlockSize div 8);
//    pad := bsize - (dataLength mod bsize);
//    for index := 1 to pad do
//      Data := Data+chr(pad);
    {end padding}

    Cipher.EncryptCTR(Data[1], Data[1], Length(Data));
  finally
    Cipher.Free;
  end;

  Result := DCPBase64.Base64EncodeStr(Data);
end;

function TForm1.DecifrarDCPCrypt(Valor: AnsiString): string;
var
  Cipher: TDCP_rijndael;
  Data, Key, IV: AnsiString;
  index, dataLength, bsize, pad: integer;
begin
  key := '#Sua-Chave-de-32-caracteres-aqui';
  iv  := '#Seu-Vetor-aqui#';
  Data := DCPBase64.Base64DecodeStr(Valor);

  Cipher := TDCP_rijndael.Create(nil);
  try
    Cipher.Init(key[1], 256, @IV[1]);
    Cipher.DecryptCTR(Data[1], Data[1], Length(Data));
  finally
    Cipher.Free;
  end;

  Result := Data;
end;

procedure TForm1.Codec1SetIV(Value: TMemoryStream);
var
  IV_AsBytes: TBytes;
begin
  IV_AsBytes := TEncoding.UTF8.GetBytes('#Seu-Vetor-aqui#');
  Value.Write(IV_AsBytes, Length(IV_AsBytes));
end;

function TForm1.CifrarLockBox(Valor: AnsiString): string;
var
  CryptoLib: TCryptographicLibrary;
  Codec: TCodec;
  Data, Key, IV: Ansistring;
begin
  Result := '';
  CryptoLib := TCryptographicLibrary.Create(nil);
  Codec := TCodec.Create(nil);
  try
    Codec.CryptoLibrary := CryptoLib;
    Codec.StreamCipherId := 'native.StreamToBlock';
    Codec.BlockCipherId := 'native.AES-256'; //Encriptação AES 256 bits
    Codec.ChainModeId := 'native.CTR';
//    Codec.OnSetIV := Codec1SetIV;

    key := Chave;
    iv  := Vetor;
    Data := Edit1.Text;

    Codec.Reset;
    Codec.Password := key; //Atribuindo a chave para a Criptografia
    Codec.EncryptString(Data, Result);
  finally
    FreeAndNil(CryptoLib);
    FreeAndNil(Codec);
  end;
end;

end.
