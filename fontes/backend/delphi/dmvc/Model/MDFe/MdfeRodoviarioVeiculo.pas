{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [MDFE_RODOVIARIO_VEICULO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
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
unit MdfeRodoviarioVeiculo;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TMdfeRodoviarioVeiculo = class(TModelBase)
  private
    FId: Integer;
    FIdMdfeRodoviario: Integer;
    FCodigoInterno: string;
    FPlaca: string;
    FRenavam: string;
    FTara: Integer;
    FCapacidadeKg: Integer;
    FCapacidadeM3: Integer;
    FTipoRodado: string;
    FTipoCarroceria: string;
    FUfLicenciamento: string;
    FProprietarioCpf: string;
    FProprietarioCnpj: string;
    FProprietarioRntrc: string;
    FProprietarioNome: string;
    FProprietarioIe: string;
    FProprietarioTipo: Integer;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_MDFE_RODOVIARIO')]
		[MVCNameAsAttribute('idMdfeRodoviario')]
		property IdMdfeRodoviario: Integer read FIdMdfeRodoviario write FIdMdfeRodoviario;
    [MVCColumnAttribute('CODIGO_INTERNO')]
		[MVCNameAsAttribute('codigoInterno')]
		property CodigoInterno: string read FCodigoInterno write FCodigoInterno;
    [MVCColumnAttribute('PLACA')]
		[MVCNameAsAttribute('placa')]
		property Placa: string read FPlaca write FPlaca;
    [MVCColumnAttribute('RENAVAM')]
		[MVCNameAsAttribute('renavam')]
		property Renavam: string read FRenavam write FRenavam;
    [MVCColumnAttribute('TARA')]
		[MVCNameAsAttribute('tara')]
		property Tara: Integer read FTara write FTara;
    [MVCColumnAttribute('CAPACIDADE_KG')]
		[MVCNameAsAttribute('capacidadeKg')]
		property CapacidadeKg: Integer read FCapacidadeKg write FCapacidadeKg;
    [MVCColumnAttribute('CAPACIDADE_M3')]
		[MVCNameAsAttribute('capacidadeM3')]
		property CapacidadeM3: Integer read FCapacidadeM3 write FCapacidadeM3;
    [MVCColumnAttribute('TIPO_RODADO')]
		[MVCNameAsAttribute('tipoRodado')]
		property TipoRodado: string read FTipoRodado write FTipoRodado;
    [MVCColumnAttribute('TIPO_CARROCERIA')]
		[MVCNameAsAttribute('tipoCarroceria')]
		property TipoCarroceria: string read FTipoCarroceria write FTipoCarroceria;
    [MVCColumnAttribute('UF_LICENCIAMENTO')]
		[MVCNameAsAttribute('ufLicenciamento')]
		property UfLicenciamento: string read FUfLicenciamento write FUfLicenciamento;
    [MVCColumnAttribute('PROPRIETARIO_CPF')]
		[MVCNameAsAttribute('proprietarioCpf')]
		property ProprietarioCpf: string read FProprietarioCpf write FProprietarioCpf;
    [MVCColumnAttribute('PROPRIETARIO_CNPJ')]
		[MVCNameAsAttribute('proprietarioCnpj')]
		property ProprietarioCnpj: string read FProprietarioCnpj write FProprietarioCnpj;
    [MVCColumnAttribute('PROPRIETARIO_RNTRC')]
		[MVCNameAsAttribute('proprietarioRntrc')]
		property ProprietarioRntrc: string read FProprietarioRntrc write FProprietarioRntrc;
    [MVCColumnAttribute('PROPRIETARIO_NOME')]
		[MVCNameAsAttribute('proprietarioNome')]
		property ProprietarioNome: string read FProprietarioNome write FProprietarioNome;
    [MVCColumnAttribute('PROPRIETARIO_IE')]
		[MVCNameAsAttribute('proprietarioIe')]
		property ProprietarioIe: string read FProprietarioIe write FProprietarioIe;
    [MVCColumnAttribute('PROPRIETARIO_TIPO')]
		[MVCNameAsAttribute('proprietarioTipo')]
		property ProprietarioTipo: Integer read FProprietarioTipo write FProprietarioTipo;
      
  end;

implementation

{ TMdfeRodoviarioVeiculo }



end.