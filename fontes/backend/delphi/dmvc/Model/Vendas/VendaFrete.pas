{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VENDA_FRETE] 
                                                                                
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
unit VendaFrete;

interface

uses
  Generics.Collections, System.SysUtils,
  Transportadora,
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TVendaFrete = class(TModelBase)
  private
    FId: Integer;
    FIdVendaCabecalho: Integer;
    FIdTransportadora: Integer;
    FConhecimento: Integer;
    FResponsavel: string;
    FPlaca: string;
    FUfPlaca: string;
    FSeloFiscal: Integer;
    FQuantidadeVolume: Extended;
    FMarcaVolume: string;
    FEspecieVolume: string;
    FPesoBruto: Extended;
    FPesoLiquido: Extended;

    FTransportadora: TTransportadora;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_VENDA_CABECALHO')]
		[MVCNameAsAttribute('idVendaCabecalho')]
		property IdVendaCabecalho: Integer read FIdVendaCabecalho write FIdVendaCabecalho;
    [MVCColumnAttribute('ID_TRANSPORTADORA')]
		[MVCNameAsAttribute('idTransportadora')]
		property IdTransportadora: Integer read FIdTransportadora write FIdTransportadora;
    [MVCColumnAttribute('CONHECIMENTO')]
		[MVCNameAsAttribute('conhecimento')]
		property Conhecimento: Integer read FConhecimento write FConhecimento;
    [MVCColumnAttribute('RESPONSAVEL')]
		[MVCNameAsAttribute('responsavel')]
		property Responsavel: string read FResponsavel write FResponsavel;
    [MVCColumnAttribute('PLACA')]
		[MVCNameAsAttribute('placa')]
		property Placa: string read FPlaca write FPlaca;
    [MVCColumnAttribute('UF_PLACA')]
		[MVCNameAsAttribute('ufPlaca')]
		property UfPlaca: string read FUfPlaca write FUfPlaca;
    [MVCColumnAttribute('SELO_FISCAL')]
		[MVCNameAsAttribute('seloFiscal')]
		property SeloFiscal: Integer read FSeloFiscal write FSeloFiscal;
    [MVCColumnAttribute('QUANTIDADE_VOLUME')]
		[MVCNameAsAttribute('quantidadeVolume')]
		property QuantidadeVolume: Extended read FQuantidadeVolume write FQuantidadeVolume;
    [MVCColumnAttribute('MARCA_VOLUME')]
		[MVCNameAsAttribute('marcaVolume')]
		property MarcaVolume: string read FMarcaVolume write FMarcaVolume;
    [MVCColumnAttribute('ESPECIE_VOLUME')]
		[MVCNameAsAttribute('especieVolume')]
		property EspecieVolume: string read FEspecieVolume write FEspecieVolume;
    [MVCColumnAttribute('PESO_BRUTO')]
		[MVCNameAsAttribute('pesoBruto')]
		property PesoBruto: Extended read FPesoBruto write FPesoBruto;
    [MVCColumnAttribute('PESO_LIQUIDO')]
		[MVCNameAsAttribute('pesoLiquido')]
		property PesoLiquido: Extended read FPesoLiquido write FPesoLiquido;


    [MVCNameAsAttribute('transportadora')]
		property Transportadora: TTransportadora read FTransportadora write FTransportadora;
  end;

implementation

{ TVendaFrete }

constructor TVendaFrete.Create;
begin
  inherited;

  FTransportadora := TTransportadora.Create;
end;

destructor TVendaFrete.Destroy;
begin

  FreeAndNil(FTransportadora);
  inherited;
end;



end.