unit VO;

{$mode objfpc}{$H+}

interface

uses
  TypInfo, SysUtils, Classes, FPJSON, FGL, fpjsonrtti, DOM, XMLRead, Forms;

type

  { TVO }

  TVO = class(TPersistent)
  published
    constructor Create; overload; virtual;

    function ToJSON: TJSONObject; virtual;
    function ToJSONString: string;
  end;

  TClassVO = class of TVO;

  TListaVO = specialize TFPGObjectList<TVO>;

implementation

{$Region 'TVO'}

constructor TVO.Create;
begin
  inherited Create;
end;

function TVO.ToJSON: TJSONObject;
var
  TypeData: PTypeData;
  TypeInfo: PTypeInfo;
  PropList: PPropList;
  PropInfo: PPropInfo;

  I, J, K: Integer;

  Caminho, NomeTipo, NomeCampo, NomePropriedade: String;

  Documento: TXMLDocument;
  Node: TDOMNode;
begin
  try
    DecimalSeparator := '.';

    Result :=  TJSONObject.Create;
    Result.Clear;

    TypeInfo := Self.ClassInfo;
    TypeData := GetTypeData(TypeInfo);

    // Lê no arquivo xml no disco
    Caminho := ExtractFilePath(Application.ExeName) + 'VO\' + TypeData^.UnitName + '.xml';
    ReadXMLFile(Documento, Caminho);
    Node := Documento.DocumentElement.FirstChild;

    // Monta o Json com os dados do VO
    GetMem(PropList, TypeData^.PropCount * SizeOf(Pointer));
    GetPropInfos(TypeInfo, PropList);
    for I := 0 to TypeData^.PropCount - 1 do
    begin
      for J := 0 to (Node.ChildNodes.Count - 1) do
      begin
        if Node.ChildNodes.Item[J].NodeName = 'property' then
        begin
          for K := 0 to 4 do
          begin
            if Node.ChildNodes.Item[J].Attributes.Item[K].NodeName = 'name' then
              NomePropriedade := Node.ChildNodes.Item[J].Attributes.Item[K].NodeValue;
            if Node.ChildNodes.Item[J].Attributes.Item[K].NodeName = 'column' then
              NomeCampo := Node.ChildNodes.Item[J].Attributes.Item[K].NodeValue;
          end;

          if NomePropriedade = PropList^[I]^.Name then
          begin
            PropInfo := GetPropInfo(Self, PropList^[I]^.Name);
            NomeTipo := PropInfo^.PropType^.Name;
            if PropInfo^.PropType^.Kind in [tkInteger, tkInt64] then
            begin
              if GetInt64Prop(Self, PropList^[I]^.Name) <> 0 then
                Result.Add(NomeCampo, GetInt64Prop(Self, PropList^[I]^.Name));
            end
            else if PropInfo^.PropType^.Kind in [tkString, tkUString, tkAString] then
            begin
              if GetStrProp(Self, PropList^[I]^.Name) <> '' then
              begin
                Result.Add(NomeCampo, GetStrProp(Self, PropList^[I]^.Name));
              end;
            end
            else if PropInfo^.PropType^.Kind in [tkFloat] then
            begin
              Result.Add(NomeCampo, GetFloatProp(Self, PropList^[I]^.Name));
            end;
          end;
        end;
      end;
      (*
      if PropList^[I]^.Name = 'Id' then
      begin
        Result.Add('ID', GetInt64Prop(Self, PropList^[I]^.Name));
      end;
      *)
    end;

  finally
    DecimalSeparator := ',';
    FreeMem(PropList);
  end;
end;

function TVO.ToJSONString: String;
var
  Serializa: TJSONStreamer;
begin
  Serializa := TJSONStreamer.Create(nil);
  try
    Serializa.Options := Serializa.Options + [jsoTStringsAsArray];
    Serializa.Options := Serializa.Options + [jsoComponentsInline];
    Serializa.Options := Serializa.Options + [jsoDateTimeAsString];
    Serializa.Options := Serializa.Options + [jsoStreamChildren];
    // JSON convert and output
    Result := Serializa.ObjectToJSONString(Self);
  finally
    Serializa.Free;
  end;
end;
{$EndRegion 'TVO'}

end.
