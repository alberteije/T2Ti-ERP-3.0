{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PATRIM_APOLICE_SEGURO] 
                                                                                
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
unit PatrimApoliceSeguro;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TPatrimApoliceSeguro = class(TModelBase)
  private
    FId: Integer;
    FIdPatrimBem: Integer;
    FIdSeguradora: Integer;
    FNumero: string;
    FDataContratacao: TDateTime;
    FDataVencimento: TDateTime;
    FValorPremio: Extended;
    FValorSegurado: Extended;
    FObservacao: string;
    FImagem: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_PATRIM_BEM')]
		[MVCNameAsAttribute('idPatrimBem')]
		property IdPatrimBem: Integer read FIdPatrimBem write FIdPatrimBem;
    [MVCColumnAttribute('ID_SEGURADORA')]
		[MVCNameAsAttribute('idSeguradora')]
		property IdSeguradora: Integer read FIdSeguradora write FIdSeguradora;
    [MVCColumnAttribute('NUMERO')]
		[MVCNameAsAttribute('numero')]
		property Numero: string read FNumero write FNumero;
    [MVCColumnAttribute('DATA_CONTRATACAO')]
		[MVCNameAsAttribute('dataContratacao')]
		property DataContratacao: TDateTime read FDataContratacao write FDataContratacao;
    [MVCColumnAttribute('DATA_VENCIMENTO')]
		[MVCNameAsAttribute('dataVencimento')]
		property DataVencimento: TDateTime read FDataVencimento write FDataVencimento;
    [MVCColumnAttribute('VALOR_PREMIO')]
		[MVCNameAsAttribute('valorPremio')]
		property ValorPremio: Extended read FValorPremio write FValorPremio;
    [MVCColumnAttribute('VALOR_SEGURADO')]
		[MVCNameAsAttribute('valorSegurado')]
		property ValorSegurado: Extended read FValorSegurado write FValorSegurado;
    [MVCColumnAttribute('OBSERVACAO')]
		[MVCNameAsAttribute('observacao')]
		property Observacao: string read FObservacao write FObservacao;
    [MVCColumnAttribute('IMAGEM')]
		[MVCNameAsAttribute('imagem')]
		property Imagem: string read FImagem write FImagem;
      
  end;

implementation

{ TPatrimApoliceSeguro }



end.