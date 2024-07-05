{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [ETIQUETA_LAYOUT] 
                                                                                
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
unit EtiquetaLayout;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TEtiquetaLayout = class(TModelBase)
  private
    FId: Integer;
    FIdFormatoPapel: Integer;
    FCodigoFabricante: string;
    FQuantidade: Integer;
    FQuantidadeHorizontal: Integer;
    FQuantidadeVertical: Integer;
    FMargemSuperior: Integer;
    FMargemInferior: Integer;
    FMargemEsquerda: Integer;
    FMargemDireita: Integer;
    FEspacamentoHorizontal: Integer;
    FEspacamentoVertical: Integer;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_FORMATO_PAPEL')]
		[MVCNameAsAttribute('idFormatoPapel')]
		property IdFormatoPapel: Integer read FIdFormatoPapel write FIdFormatoPapel;
    [MVCColumnAttribute('CODIGO_FABRICANTE')]
		[MVCNameAsAttribute('codigoFabricante')]
		property CodigoFabricante: string read FCodigoFabricante write FCodigoFabricante;
    [MVCColumnAttribute('QUANTIDADE')]
		[MVCNameAsAttribute('quantidade')]
		property Quantidade: Integer read FQuantidade write FQuantidade;
    [MVCColumnAttribute('QUANTIDADE_HORIZONTAL')]
		[MVCNameAsAttribute('quantidadeHorizontal')]
		property QuantidadeHorizontal: Integer read FQuantidadeHorizontal write FQuantidadeHorizontal;
    [MVCColumnAttribute('QUANTIDADE_VERTICAL')]
		[MVCNameAsAttribute('quantidadeVertical')]
		property QuantidadeVertical: Integer read FQuantidadeVertical write FQuantidadeVertical;
    [MVCColumnAttribute('MARGEM_SUPERIOR')]
		[MVCNameAsAttribute('margemSuperior')]
		property MargemSuperior: Integer read FMargemSuperior write FMargemSuperior;
    [MVCColumnAttribute('MARGEM_INFERIOR')]
		[MVCNameAsAttribute('margemInferior')]
		property MargemInferior: Integer read FMargemInferior write FMargemInferior;
    [MVCColumnAttribute('MARGEM_ESQUERDA')]
		[MVCNameAsAttribute('margemEsquerda')]
		property MargemEsquerda: Integer read FMargemEsquerda write FMargemEsquerda;
    [MVCColumnAttribute('MARGEM_DIREITA')]
		[MVCNameAsAttribute('margemDireita')]
		property MargemDireita: Integer read FMargemDireita write FMargemDireita;
    [MVCColumnAttribute('ESPACAMENTO_HORIZONTAL')]
		[MVCNameAsAttribute('espacamentoHorizontal')]
		property EspacamentoHorizontal: Integer read FEspacamentoHorizontal write FEspacamentoHorizontal;
    [MVCColumnAttribute('ESPACAMENTO_VERTICAL')]
		[MVCNameAsAttribute('espacamentoVertical')]
		property EspacamentoVertical: Integer read FEspacamentoVertical write FEspacamentoVertical;
      
  end;

implementation

{ TEtiquetaLayout }



end.