{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_VEICULO_NOVO] 
                                                                                
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
unit CteVeiculoNovo;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TCteVeiculoNovo = class(TModelBase)
  private
    FId: Integer;
    FIdCteCabecalho: Integer;
    FChassi: string;
    FCor: string;
    FDescricaoCor: string;
    FCodigoMarcaModelo: string;
    FValorUnitario: Extended;
    FValorFrete: Extended;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_CTE_CABECALHO')]
		[MVCNameAsAttribute('idCteCabecalho')]
		property IdCteCabecalho: Integer read FIdCteCabecalho write FIdCteCabecalho;
    [MVCColumnAttribute('CHASSI')]
		[MVCNameAsAttribute('chassi')]
		property Chassi: string read FChassi write FChassi;
    [MVCColumnAttribute('COR')]
		[MVCNameAsAttribute('cor')]
		property Cor: string read FCor write FCor;
    [MVCColumnAttribute('DESCRICAO_COR')]
		[MVCNameAsAttribute('descricaoCor')]
		property DescricaoCor: string read FDescricaoCor write FDescricaoCor;
    [MVCColumnAttribute('CODIGO_MARCA_MODELO')]
		[MVCNameAsAttribute('codigoMarcaModelo')]
		property CodigoMarcaModelo: string read FCodigoMarcaModelo write FCodigoMarcaModelo;
    [MVCColumnAttribute('VALOR_UNITARIO')]
		[MVCNameAsAttribute('valorUnitario')]
		property ValorUnitario: Extended read FValorUnitario write FValorUnitario;
    [MVCColumnAttribute('VALOR_FRETE')]
		[MVCNameAsAttribute('valorFrete')]
		property ValorFrete: Extended read FValorFrete write FValorFrete;
      
  end;

implementation

{ TCteVeiculoNovo }



end.