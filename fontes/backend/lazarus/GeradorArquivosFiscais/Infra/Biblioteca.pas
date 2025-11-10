unit Biblioteca;

{$mode objfpc}{$H+}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DB,
  DBGrids, BufDataset, XMLRead, XMLWrite, DOM, VO, Typinfo, math,
  FPJson, ZDataSet, Constantes;

function Modulo11(Numero: String): String;
Function ValidaCNPJ(xCNPJ: String):Boolean;
Function ValidaCPF( xCPF:String ):Boolean;
Function ValidaEstado(Dado : string) : boolean;
Function Hora_Seg( Horas:string ):LongInt;
Function Seg_Hora( Seg:LongInt ):string;
Function StrZero(Num:Real ; Zeros,Deci:integer): string;
Function TruncaValor(Value:Extended;Casas:Integer):Extended;
Function ArredondaTruncaValor(Operacao: String; Value: Extended; Casas: integer): Extended;
function UltimoDiaMes(Mdt: TDateTime): String; overload;
function UltimoDiaMes(pMes: String): String; overload;
procedure Split(const Delimiter: Char; Input: string; const Strings: TStrings);
function CriaGuidStr: string;
function TextoParaData(pData: string): TDate;
function DataParaTexto(pData: TDate): string;
function UFToInt(pUF: String): Integer;
function IntToUF(pUF: Integer): String;
function VerificaInteiro(Value: String): Boolean;
function Codifica(Action, Src: String): String;
function PeriodoAnterior(pMesAno: String): String;
function PeriodoPosterior(pMesAno: String): String;
function RetiraMascara(Texto:String): String;

procedure ConfiguraCDSFromVO(pCDS: TBufDataSet; pVOClass: TClassVO);
function TrataNomeProperty(NomeCampo: String): String;
function FormataFloat(Tipo: String; Valor: Extended): string; // Tipo => 'Q'=Quantidade | 'V'=Valor

procedure AtualizaCDSJson(pDadosJson: TJSONData; pDataSet: TBufDataSet);
procedure AtualizaCDSZeos(pZQuery: TZQuery; pDataSet: TBufDataSet);


implementation

uses SessaoUsuario;

function FormataFloat(Tipo: String; Valor: Extended): string; // Tipo => 'Q'=Quantidade | 'V'=Valor
var
  i: integer;
  Mascara: String;
begin
  Mascara := '0.';

  if Tipo = 'Q' then
  begin
    for i := 1 to Constantes.TConstantes.DECIMAIS_QUANTIDADE do
      Mascara := Mascara + '0';
  end
  else if Tipo = 'V' then
  begin
    for i := 1 to Constantes.TConstantes.DECIMAIS_VALOR do
      Mascara := Mascara + '0';
  end;

  Result := FormatFloat(Mascara, Valor);
end;

function Modulo11(Numero: String): String;
var
  i,j,k : Integer;
  Soma : Integer;
  Digito : Integer;
  CNPJ : Boolean;
begin
  Result := '';
  Try
    Soma := 0; k:= 2;
    for i := Length(Numero) downto 1 do
    begin
      Soma := Soma + (StrToInt(Numero[i])*k);
      inc(k);
      if k > 9 then
        k := 2;
    end;
    Digito := 11 - Soma mod 11;
    if Digito >= 10 then
      Digito := 0;
    Result := Result + Chr(Digito + Ord('0'));
  except
    Result := 'X';
  end;
end;

{ Valida o CNPJ digitado }
function ValidaCNPJ(xCNPJ: String):Boolean;
Var
d1,d4,xx,nCount,fator,resto,digito1,digito2 : Integer;
Check : String;
begin
d1 := 0;
d4 := 0;
xx := 1;
for nCount := 1 to Length( xCNPJ )-2 do
    begin
    if Pos( Copy( xCNPJ, nCount, 1 ), '/-.' ) = 0 then
       begin
       if xx < 5 then
          begin
          fator := 6 - xx;
          end
       else
          begin
          fator := 14 - xx;
          end;
       d1 := d1 + StrToInt( Copy( xCNPJ, nCount, 1 ) ) * fator;
       if xx < 6 then
          begin
          fator := 7 - xx;
          end
       else
          begin
          fator := 15 - xx;
          end;
       d4 := d4 + StrToInt( Copy( xCNPJ, nCount, 1 ) ) * fator;
       xx := xx+1;
       end;
    end;
    resto := (d1 mod 11);
    if resto < 2 then
       begin
       digito1 := 0;
       end
   else
       begin
       digito1 := 11 - resto;
       end;
   d4 := d4 + 2 * digito1;
   resto := (d4 mod 11);
   if resto < 2 then
      begin
      digito2 := 0;
      end
   else
      begin
      digito2 := 11 - resto;
      end;
   Check := IntToStr(Digito1) + IntToStr(Digito2);
   if Check <> copy(xCNPJ,succ(length(xCNPJ)-2),2) then
      begin
      Result := False;
      end
   else
      begin
      Result := True;
      end;
end;

{ Valida o CPF digitado }
function ValidaCPF( xCPF:String ):Boolean;
Var
d1,d4,xx,nCount,resto,digito1,digito2 : Integer;
Check : String;
Begin
d1 := 0; d4 := 0; xx := 1;
for nCount := 1 to Length( xCPF )-2 do
    begin
    if Pos( Copy( xCPF, nCount, 1 ), '/-.' ) = 0 then
       begin
       d1 := d1 + ( 11 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
       d4 := d4 + ( 12 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
       xx := xx+1;
       end;
    end;
resto := (d1 mod 11);
if resto < 2 then
   begin
   digito1 := 0;
   end
else
   begin
   digito1 := 11 - resto;
   end;
d4 := d4 + 2 * digito1;
resto := (d4 mod 11);
if resto < 2 then
   begin
   digito2 := 0;
   end
else
   begin
   digito2 := 11 - resto;
   end;
Check := IntToStr(Digito1) + IntToStr(Digito2);
if Check <> copy(xCPF,succ(length(xCPF)-2),2) then
   begin
   Result := False;
   end
else
   begin
   Result := True;
   end;
end;

{ Valida a UF digitada }
function ValidaEstado(Dado : string) : boolean;
const
  Estados = 'SPMGRJRSSCPRESDFMTMSGOTOBASEALPBPEMARNCEPIPAAMAPFNACRRRO';
var
  Posicao : integer;
begin
Result := true;
if Dado <> '' then
   begin
   Posicao := Pos(UpperCase(Dado),Estados);
   if (Posicao = 0) or ((Posicao mod 2) = 0) then
      begin
      Result := false;
      end;
    end;
end;

{Converte de hora para segundos}
function Hora_Seg( Horas:string ):LongInt;
Var Hor,Min,Seg:LongInt;
begin
   Horas[Pos(':',Horas)]:= '[';
   Horas[Pos(':',Horas)]:= ']';
   Hor := StrToInt(Copy(Horas,1,Pos('[',Horas)-1));
   Min := StrToInt(Copy(Horas,Pos('[',Horas)+1,(Pos(']',Horas)-Pos('[',Horas)-1)));
   if Pos(':',Horas) > 0 then
      Seg := StrToInt(Copy(Horas,Pos(']',Horas)+1,(Pos(':',Horas)-Pos(']',Horas)-1)))
   else
      Seg := StrToInt(Copy(Horas,Pos(']',Horas)+1,2));
   Result := Seg + (Hor*3600) + (Min*60);
end;

{Converte de segundos para hora}
function Seg_Hora( Seg:LongInt ):string;
Var Hora,Min:LongInt;
    Tmp : Double;
begin
   Tmp := Seg / 3600;
   Hora := Round(Int(Tmp));
   Seg :=  Round(Seg - (Hora*3600));
   Tmp := Seg / 60;
   Min := Round(Int(Tmp));
   Seg :=  Round(Seg - (Min*60));
   Result := StrZero(Hora,2,0)+':'+StrZero(Min,2,0)+':'+StrZero(Seg,2,0);
end;

function StrZero(Num:Real ; Zeros,Deci:integer): string;
var Tam,Z:integer;
    Res,Zer:string;
begin
   Str(Num:Zeros:Deci,Res);
   Res := Trim(Res);
   Tam := Length(Res);
   Zer := '';
   for z := 01 to (Zeros-Tam) do
      Zer := Zer + '0';
   Result := Zer+Res;
end;

Function TruncaValor(Value:Extended;Casas:Integer):Extended;
Var sValor:String;
    nPos:Integer;
begin
   //Transforma o valor em string
   sValor := FloatToStr(Value);

   //Verifica se possui ponto decimal
   nPos := Pos(DecimalSeparator,sValor);
   If ( nPos > 0 ) Then begin
      sValor := Copy(sValor,1,nPos+Casas);
   End;

   Result := StrToFloat(sValor);
end;

Function ArredondaTruncaValor(Operacao: String; Value: Extended; Casas: integer): Extended;
Var
  sValor: String;
  nPos: integer;
begin
  if Operacao = 'A' then
    Result := SimpleRoundTo(Value, Casas * -1)
  else
  begin
    // Transforma o valor em string
    sValor := FloatToStr(Value);

    // Verifica se possui ponto decimal
    nPos := Pos(FormatSettings.DecimalSeparator, sValor);
    If (nPos > 0) Then
    begin
      sValor := Copy(sValor, 1, nPos + Casas);
    End;

    Result := StrToFloat(sValor);
  end;
end;

function UltimoDiaMes(Mdt: TDateTime): String;
var
  ano, mes, dia: word;
  mDtTemp: TDateTime;
begin
  Decodedate(Mdt, ano, mes, dia);
  mDtTemp := (Mdt - dia) + 33;
  Decodedate(mDtTemp, ano, mes, dia);
  mDtTemp := mDtTemp - dia;
  Decodedate(mDtTemp, ano, mes, dia);
  Result := IntToStr(dia)
end;

function UltimoDiaMes(pMes: String): String;
var
  ano, mes, dia: word;
  mDtTemp: TDateTime;
  Mdt: TDateTime;
begin
  Mdt := StrToDateTime('01/' + pMes + '/' + FormatDateTime('YYYY', Now));
  Decodedate(Mdt, ano, mes, dia);
  mDtTemp := (Mdt - dia) + 33;
  Decodedate(mDtTemp, ano, mes, dia);
  mDtTemp := mDtTemp - dia;
  Decodedate(mDtTemp, ano, mes, dia);
  Result := IntToStr(dia)
end;

procedure Split(const Delimiter: Char; Input: string; const Strings: TStrings);
begin
  Assert(Assigned(Strings)) ;
  Strings.Clear;
  Strings.Delimiter := Delimiter;
  Strings.DelimitedText := Input;
end;

function CriaGuidStr: string;
var
  Guid: TGUID;
begin
  CreateGUID(Guid);
  Result := GUIDToString(Guid);
end;

function TextoParaData(pData: string): TDate;
var
  Dia, Mes, Ano: Integer;
begin
  if (pData <> '') AND (pData <> '0000-00-00') then
  begin
    Dia := StrToInt(Copy(pData,9,2));
    Mes := StrToInt(Copy(pData,6,2));
    Ano := StrToInt(Copy(pData,1,4));
    Result := EncodeDate(Ano,Mes,Dia);
  end
  else
  begin
    Result := 0;
  end;
end;

function DataParaTexto(pData: TDate): string;
begin
  if pData > 0 then
    Result := FormatDateTime('YYYY-MM-DD',pData)
  else
    Result := '0000-00-00';
end;

// função auxiliar para converte UF do cliente para codigo
function UFToInt(pUF: String): integer;
begin
  Result := 0;
  if pUF = 'RO' then
    Result := 11;
  if pUF = 'AC' then
    Result := 12;
  if pUF = 'AM' then
    Result := 13;
  if pUF = 'RR' then
    Result := 14;
  if pUF = 'PA' then
    Result := 15;
  if pUF = 'AP' then
    Result := 16;
  if pUF = 'TO' then
    Result := 17;
  if pUF = 'MA' then
    Result := 21;
  if pUF = 'PI' then
    Result := 22;
  if pUF = 'CE' then
    Result := 23;
  if pUF = 'RN' then
    Result := 24;
  if pUF = 'PB' then
    Result := 25;
  if pUF = 'PE' then
    Result := 26;
  if pUF = 'AL' then
    Result := 27;
  if pUF = 'SE' then
    Result := 28;
  if pUF = 'BA' then
    Result := 29;
  if pUF = 'MG' then
    Result := 31;
  if pUF = 'ES' then
    Result := 32;
  if pUF = 'RJ' then
    Result := 33;
  if pUF = 'SP' then
    Result := 35;
  if pUF = 'PR' then
    Result := 41;
  if pUF = 'SC' then
    Result := 42;
  if pUF = 'RS' then
    Result := 43;
  if pUF = 'MS' then
    Result := 50;
  if pUF = 'MT' then
    Result := 51;
  if pUF = 'GO' then
    Result := 52;
  if pUF = 'DF' then
    Result := 53;
end;

// função auxiliar para converte Codigo UF do cliente para UF
function IntToUF(pUF: integer): String;
begin
  Result := '';
  if pUF = 11 then
    Result := 'RO';
  if pUF = 12 then
    Result := 'AC';
  if pUF = 13 then
    Result := 'AM';
  if pUF = 14 then
    Result := 'RR';
  if pUF = 15 then
    Result := 'PA';
  if pUF = 16 then
    Result := 'AP';
  if pUF = 17 then
    Result := 'TO';
  if pUF = 21 then
    Result := 'MA';
  if pUF = 22 then
    Result := 'PI';
  if pUF = 23 then
    Result := 'CE';
  if pUF = 24 then
    Result := 'RN';
  if pUF = 25 then
    Result := 'PB';
  if pUF = 26 then
    Result := 'PE';
  if pUF = 27 then
    Result := 'AL';
  if pUF = 28 then
    Result := 'SE';
  if pUF = 29 then
    Result := 'BA';
  if pUF = 31 then
    Result := 'MG';
  if pUF = 32 then
    Result := 'ES';
  if pUF = 33 then
    Result := 'RJ';
  if pUF = 35 then
    Result := 'SP';
  if pUF = 41 then
    Result := 'PR';
  if pUF = 42 then
    Result := 'SC';
  if pUF = 43 then
    Result := 'RS';
  if pUF = 50 then
    Result := 'MS';
  if pUF = 51 then
    Result := 'MT';
  if pUF = 52 then
    Result := 'GO';
  if pUF = 53 then
    Result := 'DF';
end;

function VerificaInteiro(Value: String): Boolean;
var
  i: integer;
begin
  Result := False;
  for i := 0 to 9 do
  begin
    if Pos(IntToStr(i), Value) <> 0 then
    begin
      Result := True;
      exit;
    end;
  end;
end;

function Codifica(Action, Src: String): String;
Label Fim; //Função para criptografar e descriptografar string's
var
  KeyLen : Integer;
  KeyPos : Integer;
  OffSet : Integer;
  Dest, Key : String;
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;
begin
try
  if (Src = '') Then
  begin
    Result:= '';
    Goto Fim;
  end;
  Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x',[SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$'+ copy(Src,1,2));
    SrcPos := 3;
  repeat
    SrcAsc := StrToInt('$'+ copy(Src,SrcPos,2));
    if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
    TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
    else TmpSrcAsc := TmpSrcAsc - OffSet;
    Dest := Dest + Chr(TmpSrcAsc);
    OffSet := SrcAsc;
    SrcPos := SrcPos + 2;
  until (SrcPos >= Length(Src));
  end;
  Result:= Dest;
  Fim:
except
 Src := '';
 Result:= '';
end;
end;

function PeriodoAnterior(pMesAno: String): String;
var
  Mes, Ano: Integer;
begin
  Mes := StrToInt(Copy(pMesAno, 1, 2));
  Ano := StrToInt(Copy(pMesAno, 4, 4));
  if Mes = 1 then
  begin
    Mes := 12;
    Ano := Ano - 1;
    Result := IntToStr(Mes) + '/' + IntToStr(Ano);
  end
  else
    Result := StringOfChar('0', 2 - Length(IntToStr(Mes - 1))) + IntToStr(Mes - 1) + '/' + IntToStr(Ano);
end;

function PeriodoPosterior(pMesAno: String): String;
var
  Mes, Ano: Integer;
begin
  Mes := StrToInt(Copy(pMesAno, 1, 2));
  Ano := StrToInt(Copy(pMesAno, 4, 4));
  if Mes = 12 then
  begin
    Mes := 1;
    Ano := Ano + 1;
    Result := IntToStr(Mes) + '/' + IntToStr(Ano);
  end
  else
    Result := StringOfChar('0', 2 - Length(IntToStr(Mes + 1))) + IntToStr(Mes + 1) + '/' + IntToStr(Ano);
end;

function RetiraMascara(Texto: String): String;
begin
  Result := Texto;
  Result := StringReplace(Result,'*','',[rfReplaceAll]);
  Result := StringReplace(Result,'.','',[rfReplaceAll]);
  Result := StringReplace(Result,'-','',[rfReplaceAll]);
  Result := StringReplace(Result,'/','',[rfReplaceAll]);
  Result := StringReplace(Result,'\','',[rfReplaceAll]);
end;







procedure ConfiguraCDSFromVO(pCDS: TBufDataSet; pVOClass: TClassVO);
var
  J, K: Integer;

  TypeData: PTypeData;
  TypeInfo: PTypeInfo;
  PropList: PPropList;
  PropInfo: PPropInfo;

  Caminho, Nome, Tamanho, Tipo: String;

  Documento: TXMLDocument;
  Node: TDOMNode;
begin
  try
    TypeInfo := pVOClass.ClassInfo;
    TypeData := GetTypeData(TypeInfo);

    // Lê no arquivo xml no disco
    Caminho := ExtractFilePath(Application.ExeName) + 'VO\' + TypeData^.UnitName + '.xml';
    ReadXMLFile(Documento, Caminho);
    Node := Documento.DocumentElement.FirstChild;

    // Configura ClientDataset
    pCDS.Close;
    pCDS.FieldDefs.Clear;
    pCDS.IndexDefs.Clear;

    // Preenche os nomes dos campos do CDS
    GetMem(PropList, TypeData^.PropCount * SizeOf(Pointer));
    GetPropInfos(TypeInfo, PropList);

    //Adiciona o ID
    pCDS.FieldDefs.add('ID', ftInteger);

    for J := 0 to (Node.ChildNodes.Count - 1) do
    begin

      //Adiciona os demais campos
      if Node.ChildNodes.Item[J].NodeName = 'property' then
      begin
        for K := 0 to 4 do
        begin
          if Node.ChildNodes.Item[J].Attributes.Item[K].NodeName = 'column' then
            Nome := Node.ChildNodes.Item[J].Attributes.Item[K].NodeValue;
          if Node.ChildNodes.Item[J].Attributes.Item[K].NodeName = 'width' then
            Tamanho := Node.ChildNodes.Item[J].Attributes.Item[K].NodeValue;
          if Node.ChildNodes.Item[J].Attributes.Item[K].NodeName = 'type' then
            Tipo := Node.ChildNodes.Item[J].Attributes.Item[K].NodeValue;
        end;

        if (Tipo = 'String') or (Tipo = 'Memo') then
          pCDS.FieldDefs.add(Nome, ftString, StrToInt(Tamanho))
        else if Tipo = 'FMTBcdField' then
          pCDS.FieldDefs.add(Nome, ftFloat)
        else if Tipo = 'Integer' then
          pCDS.FieldDefs.add(Nome, ftInteger)
        else if (Tipo = 'Date') or (Tipo = 'SQLTimeStamp') then
          pCDS.FieldDefs.add(Nome, ftDateTime);
      end;
    end;

    pCDS.CreateDataSet;

    (*
    Exercício:

    Arrume uma maneira de configurar automaticamente as máscaras.
    *)
  finally
    FreeMem(PropList);
  end;
end;

function TrataNomeProperty(NomeCampo: String): String;
var
  I: Integer;
begin
  NomeCampo := UpperCase(Copy(NomeCampo, 1, 1)) + LowerCase
    (Copy(NomeCampo, 2, length(NomeCampo) - 1));

  for I := 1 to length(NomeCampo) do
  begin
    if copy(NomeCampo,I,1) = '_' then
    begin
      Delete(NomeCampo,I,1);
      NomeCampo := Copy(NomeCampo,1,I-1) + UpperCase(Copy(NomeCampo,I,1)) + LowerCase(Copy(NomeCampo,I+1,length(NomeCampo)-1));
    end;
  end;

  Result := NomeCampo;
end;


procedure AtualizaCDSJson(pDadosJson: TJSONData; pDataSet: TBufDataSet);
var
  VIsObject: Boolean;
  VJSONCols: TJSONObject;
  VRecord: TJSONData = nil;
  I, J: Integer;
  Registros: Integer;
begin
  pDataSet.Close;
  pDataSet.Open;

  if not Assigned(pDadosJson) then
  begin
    Exit;
  end;

  VJSONCols := TJSONObject(pDadosJson.Items[0]);
  VIsObject := VJSONCols.JSONType = jtObject;
  if VIsObject and (VJSONCols.Count < 1) then
  begin
    Exit;
  end;

  try
    Registros := Pred(pDadosJson.Count);
    for I := 0 to Registros do
    begin
      pDataSet.Append;
      VJSONCols := TJSONObject(pDadosJson.Items[I]);
      for J := 0 to Pred(VJSONCols.Count) do
      begin
        VRecord := VJSONCols.Items[J];
        case VRecord.JSONType of
          jtNumber:
            begin
              if VRecord is TJSONFloatNumber then
                pDataSet.FieldByName(VJSONCols.Names[J]).AsFloat := VRecord.AsFloat
              else
                pDataSet.FieldByName(VJSONCols.Names[J]).AsInteger := VRecord.AsInt64;
            end;
          jtString:
            pDataSet.FieldByName(VJSONCols.Names[J]).AsString := VRecord.AsString;
          jtBoolean:
            pDataSet.FieldByName(VJSONCols.Names[J]).AsString := BoolToStr(VRecord.AsBoolean, 'TRUE', 'FALSE');
          end;
        end;
        pDataSet.Post;
    end;
  finally
  end;
end;

procedure AtualizaCDSZeos(pZQuery: TZQuery; pDataSet: TBufDataSet);
var
  ListaCampos: TStringList;
  i: integer;
begin
  pDataSet.Close;
  pDataSet.Open;

  ListaCampos  := TStringList.Create;
  pZQuery.Active := True;

  pZQuery.GetFieldNames(ListaCampos);

  pZQuery.First;
  while not pZQuery.EOF do begin
    pDataSet.Append;
    for i := 0 to ListaCampos.Count - 1 do
    begin
      pDataSet.FieldByName(ListaCampos[i]).Value := pZQuery.FieldByName(ListaCampos[i]).Value;
    end;
    pDataSet.Post;
    pZQuery.Next;
  end;
end;


end.
