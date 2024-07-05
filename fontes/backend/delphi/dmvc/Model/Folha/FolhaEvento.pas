{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_EVENTO] 
                                                                                
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
unit FolhaEvento;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TFolhaEvento = class(TModelBase)
  private
    FId: Integer;
    FCodigo: string;
    FNome: string;
    FDescricao: string;
    FTipo: string;
    FUnidade: string;
    FBaseCalculo: string;
    FTaxa: Extended;
    FRubricaEsocial: string;
    FCodIncidenciaPrevidencia: string;
    FCodIncidenciaIrrf: string;
    FCodIncidenciaFgts: string;
    FCodIncidenciaSindicato: string;
    FRepercuteDsr: string;
    FRepercute13: string;
    FRepercuteFerias: string;
    FRepercuteAviso: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('CODIGO')]
		[MVCNameAsAttribute('codigo')]
		property Codigo: string read FCodigo write FCodigo;
    [MVCColumnAttribute('NOME')]
		[MVCNameAsAttribute('nome')]
		property Nome: string read FNome write FNome;
    [MVCColumnAttribute('DESCRICAO')]
		[MVCNameAsAttribute('descricao')]
		property Descricao: string read FDescricao write FDescricao;
    [MVCColumnAttribute('TIPO')]
		[MVCNameAsAttribute('tipo')]
		property Tipo: string read FTipo write FTipo;
    [MVCColumnAttribute('UNIDADE')]
		[MVCNameAsAttribute('unidade')]
		property Unidade: string read FUnidade write FUnidade;
    [MVCColumnAttribute('BASE_CALCULO')]
		[MVCNameAsAttribute('baseCalculo')]
		property BaseCalculo: string read FBaseCalculo write FBaseCalculo;
    [MVCColumnAttribute('TAXA')]
		[MVCNameAsAttribute('taxa')]
		property Taxa: Extended read FTaxa write FTaxa;
    [MVCColumnAttribute('RUBRICA_ESOCIAL')]
		[MVCNameAsAttribute('rubricaEsocial')]
		property RubricaEsocial: string read FRubricaEsocial write FRubricaEsocial;
    [MVCColumnAttribute('COD_INCIDENCIA_PREVIDENCIA')]
		[MVCNameAsAttribute('codIncidenciaPrevidencia')]
		property CodIncidenciaPrevidencia: string read FCodIncidenciaPrevidencia write FCodIncidenciaPrevidencia;
    [MVCColumnAttribute('COD_INCIDENCIA_IRRF')]
		[MVCNameAsAttribute('codIncidenciaIrrf')]
		property CodIncidenciaIrrf: string read FCodIncidenciaIrrf write FCodIncidenciaIrrf;
    [MVCColumnAttribute('COD_INCIDENCIA_FGTS')]
		[MVCNameAsAttribute('codIncidenciaFgts')]
		property CodIncidenciaFgts: string read FCodIncidenciaFgts write FCodIncidenciaFgts;
    [MVCColumnAttribute('COD_INCIDENCIA_SINDICATO')]
		[MVCNameAsAttribute('codIncidenciaSindicato')]
		property CodIncidenciaSindicato: string read FCodIncidenciaSindicato write FCodIncidenciaSindicato;
    [MVCColumnAttribute('REPERCUTE_DSR')]
		[MVCNameAsAttribute('repercuteDsr')]
		property RepercuteDsr: string read FRepercuteDsr write FRepercuteDsr;
    [MVCColumnAttribute('REPERCUTE_13')]
		[MVCNameAsAttribute('repercute13')]
		property Repercute13: string read FRepercute13 write FRepercute13;
    [MVCColumnAttribute('REPERCUTE_FERIAS')]
		[MVCNameAsAttribute('repercuteFerias')]
		property RepercuteFerias: string read FRepercuteFerias write FRepercuteFerias;
    [MVCColumnAttribute('REPERCUTE_AVISO')]
		[MVCNameAsAttribute('repercuteAviso')]
		property RepercuteAviso: string read FRepercuteAviso write FRepercuteAviso;
      
  end;

implementation

{ TFolhaEvento }



end.