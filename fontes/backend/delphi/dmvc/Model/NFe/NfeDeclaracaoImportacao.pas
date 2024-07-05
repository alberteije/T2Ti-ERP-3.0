{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DECLARACAO_IMPORTACAO] 
                                                                                
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
*******************************************************************************}
unit NfeDeclaracaoImportacao;

interface

uses
  Generics.Collections, System.SysUtils,
  NfeImportacaoDetalhe, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeDeclaracaoImportacao = class(TModelBase)
  private
    FId: Integer;
    FIdNfeDetalhe: Integer;
    FNumeroDocumento: string;
    FDataRegistro: TDateTime;
    FLocalDesembaraco: string;
    FUfDesembaraco: string;
    FDataDesembaraco: TDateTime;
    FViaTransporte: string;
    FValorAfrmm: Extended;
    FFormaIntermediacao: string;
    FCnpj: string;
    FUfTerceiro: string;
    FCodigoExportador: string;
      
    FListaNfeImportacaoDetalhe: TObjectList<TNfeImportacaoDetalhe>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_DETALHE')]
		[MVCNameAsAttribute('idNfeDetalhe')]
		property IdNfeDetalhe: Integer read FIdNfeDetalhe write FIdNfeDetalhe;
    [MVCColumnAttribute('NUMERO_DOCUMENTO')]
		[MVCNameAsAttribute('numeroDocumento')]
		property NumeroDocumento: string read FNumeroDocumento write FNumeroDocumento;
    [MVCColumnAttribute('DATA_REGISTRO')]
		[MVCNameAsAttribute('dataRegistro')]
		property DataRegistro: TDateTime read FDataRegistro write FDataRegistro;
    [MVCColumnAttribute('LOCAL_DESEMBARACO')]
		[MVCNameAsAttribute('localDesembaraco')]
		property LocalDesembaraco: string read FLocalDesembaraco write FLocalDesembaraco;
    [MVCColumnAttribute('UF_DESEMBARACO')]
		[MVCNameAsAttribute('ufDesembaraco')]
		property UfDesembaraco: string read FUfDesembaraco write FUfDesembaraco;
    [MVCColumnAttribute('DATA_DESEMBARACO')]
		[MVCNameAsAttribute('dataDesembaraco')]
		property DataDesembaraco: TDateTime read FDataDesembaraco write FDataDesembaraco;
    [MVCColumnAttribute('VIA_TRANSPORTE')]
		[MVCNameAsAttribute('viaTransporte')]
		property ViaTransporte: string read FViaTransporte write FViaTransporte;
    [MVCColumnAttribute('VALOR_AFRMM')]
		[MVCNameAsAttribute('valorAfrmm')]
		property ValorAfrmm: Extended read FValorAfrmm write FValorAfrmm;
    [MVCColumnAttribute('FORMA_INTERMEDIACAO')]
		[MVCNameAsAttribute('formaIntermediacao')]
		property FormaIntermediacao: string read FFormaIntermediacao write FFormaIntermediacao;
    [MVCColumnAttribute('CNPJ')]
		[MVCNameAsAttribute('cnpj')]
		property Cnpj: string read FCnpj write FCnpj;
    [MVCColumnAttribute('UF_TERCEIRO')]
		[MVCNameAsAttribute('ufTerceiro')]
		property UfTerceiro: string read FUfTerceiro write FUfTerceiro;
    [MVCColumnAttribute('CODIGO_EXPORTADOR')]
		[MVCNameAsAttribute('codigoExportador')]
		property CodigoExportador: string read FCodigoExportador write FCodigoExportador;
      
    [MapperListOf(TNfeImportacaoDetalhe)]
	[MVCNameAsAttribute('listaNfeImportacaoDetalhe')]
	property ListaNfeImportacaoDetalhe: TObjectList<TNfeImportacaoDetalhe> read FListaNfeImportacaoDetalhe write FListaNfeImportacaoDetalhe;
  end;

implementation

{ TNfeDeclaracaoImportacao }

constructor TNfeDeclaracaoImportacao.Create;
begin
  inherited;

  FListaNfeImportacaoDetalhe := TObjectList<TNfeImportacaoDetalhe>.Create;
end;

destructor TNfeDeclaracaoImportacao.Destroy;
begin
  FreeAndNil(FListaNfeImportacaoDetalhe);
  inherited;
end;



end.