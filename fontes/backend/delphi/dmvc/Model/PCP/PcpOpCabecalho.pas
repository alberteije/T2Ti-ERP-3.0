{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PCP_OP_CABECALHO] 
                                                                                
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
unit PcpOpCabecalho;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TPcpOpCabecalho = class(TModelBase)
  private
    FId: Integer;
    FInicio: TDateTime;
    FPrevisaoEntrega: TDateTime;
    FTermino: TDateTime;
    FCustoTotalPrevisto: Extended;
    FCustoTotalRealizado: Extended;
    FPorcentoVenda: Extended;
    FPorcentoEstoque: Extended;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('INICIO')]
		[MVCNameAsAttribute('inicio')]
		property Inicio: TDateTime read FInicio write FInicio;
    [MVCColumnAttribute('PREVISAO_ENTREGA')]
		[MVCNameAsAttribute('previsaoEntrega')]
		property PrevisaoEntrega: TDateTime read FPrevisaoEntrega write FPrevisaoEntrega;
    [MVCColumnAttribute('TERMINO')]
		[MVCNameAsAttribute('termino')]
		property Termino: TDateTime read FTermino write FTermino;
    [MVCColumnAttribute('CUSTO_TOTAL_PREVISTO')]
		[MVCNameAsAttribute('custoTotalPrevisto')]
		property CustoTotalPrevisto: Extended read FCustoTotalPrevisto write FCustoTotalPrevisto;
    [MVCColumnAttribute('CUSTO_TOTAL_REALIZADO')]
		[MVCNameAsAttribute('custoTotalRealizado')]
		property CustoTotalRealizado: Extended read FCustoTotalRealizado write FCustoTotalRealizado;
    [MVCColumnAttribute('PORCENTO_VENDA')]
		[MVCNameAsAttribute('porcentoVenda')]
		property PorcentoVenda: Extended read FPorcentoVenda write FPorcentoVenda;
    [MVCColumnAttribute('PORCENTO_ESTOQUE')]
		[MVCNameAsAttribute('porcentoEstoque')]
		property PorcentoEstoque: Extended read FPorcentoEstoque write FPorcentoEstoque;
      
  end;

implementation

{ TPcpOpCabecalho }



end.