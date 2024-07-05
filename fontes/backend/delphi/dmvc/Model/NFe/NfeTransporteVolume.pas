{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_TRANSPORTE_VOLUME] 
                                                                                
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
unit NfeTransporteVolume;

interface

uses
  Generics.Collections, System.SysUtils,
  NfeTransporteVolumeLacre, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeTransporteVolume = class(TModelBase)
  private
    FId: Integer;
    FIdNfeTransporte: Integer;
    FQuantidade: Integer;
    FEspecie: string;
    FMarca: string;
    FNumeracao: string;
    FPesoLiquido: Extended;
    FPesoBruto: Extended;
      
    FListaNfeTransporteVolumeLacre: TObjectList<TNfeTransporteVolumeLacre>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_TRANSPORTE')]
		[MVCNameAsAttribute('idNfeTransporte')]
		property IdNfeTransporte: Integer read FIdNfeTransporte write FIdNfeTransporte;
    [MVCColumnAttribute('QUANTIDADE')]
		[MVCNameAsAttribute('quantidade')]
		property Quantidade: Integer read FQuantidade write FQuantidade;
    [MVCColumnAttribute('ESPECIE')]
		[MVCNameAsAttribute('especie')]
		property Especie: string read FEspecie write FEspecie;
    [MVCColumnAttribute('MARCA')]
		[MVCNameAsAttribute('marca')]
		property Marca: string read FMarca write FMarca;
    [MVCColumnAttribute('NUMERACAO')]
		[MVCNameAsAttribute('numeracao')]
		property Numeracao: string read FNumeracao write FNumeracao;
    [MVCColumnAttribute('PESO_LIQUIDO')]
		[MVCNameAsAttribute('pesoLiquido')]
		property PesoLiquido: Extended read FPesoLiquido write FPesoLiquido;
    [MVCColumnAttribute('PESO_BRUTO')]
		[MVCNameAsAttribute('pesoBruto')]
		property PesoBruto: Extended read FPesoBruto write FPesoBruto;
      
    [MapperListOf(TNfeTransporteVolumeLacre)]
	[MVCNameAsAttribute('listaNfeTransporteVolumeLacre')]
	property ListaNfeTransporteVolumeLacre: TObjectList<TNfeTransporteVolumeLacre> read FListaNfeTransporteVolumeLacre write FListaNfeTransporteVolumeLacre;
  end;

implementation

{ TNfeTransporteVolume }

constructor TNfeTransporteVolume.Create;
begin
  inherited;

  FListaNfeTransporteVolumeLacre := TObjectList<TNfeTransporteVolumeLacre>.Create;
end;

destructor TNfeTransporteVolume.Destroy;
begin
  FreeAndNil(FListaNfeTransporteVolumeLacre);
  inherited;
end;



end.