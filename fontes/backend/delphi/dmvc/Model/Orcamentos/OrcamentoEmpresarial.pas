{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [ORCAMENTO_EMPRESARIAL] 
                                                                                
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
unit OrcamentoEmpresarial;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TOrcamentoEmpresarial = class(TModelBase)
  private
    FId: Integer;
    FIdOrcamentoPeriodo: Integer;
    FNome: string;
    FDescricao: string;
    FDataInicial: TDateTime;
    FNumeroPeriodos: Integer;
    FDataBase: TDateTime;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_ORCAMENTO_PERIODO')]
		[MVCNameAsAttribute('idOrcamentoPeriodo')]
		property IdOrcamentoPeriodo: Integer read FIdOrcamentoPeriodo write FIdOrcamentoPeriodo;
    [MVCColumnAttribute('NOME')]
		[MVCNameAsAttribute('nome')]
		property Nome: string read FNome write FNome;
    [MVCColumnAttribute('DESCRICAO')]
		[MVCNameAsAttribute('descricao')]
		property Descricao: string read FDescricao write FDescricao;
    [MVCColumnAttribute('DATA_INICIAL')]
		[MVCNameAsAttribute('dataInicial')]
		property DataInicial: TDateTime read FDataInicial write FDataInicial;
    [MVCColumnAttribute('NUMERO_PERIODOS')]
		[MVCNameAsAttribute('numeroPeriodos')]
		property NumeroPeriodos: Integer read FNumeroPeriodos write FNumeroPeriodos;
    [MVCColumnAttribute('DATA_BASE')]
		[MVCNameAsAttribute('dataBase')]
		property DataBase: TDateTime read FDataBase write FDataBase;
      
  end;

implementation

{ TOrcamentoEmpresarial }



end.