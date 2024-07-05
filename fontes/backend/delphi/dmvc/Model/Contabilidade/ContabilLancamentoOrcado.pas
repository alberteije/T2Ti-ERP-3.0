{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTABIL_LANCAMENTO_ORCADO] 
                                                                                
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
unit ContabilLancamentoOrcado;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TContabilLancamentoOrcado = class(TModelBase)
  private
    FId: Integer;
    FIdContabilConta: Integer;
    FAno: string;
    FJaneiro: Extended;
    FFevereiro: Extended;
    FMarco: Extended;
    FAbril: Extended;
    FMaio: Extended;
    FJunho: Extended;
    FJulho: Extended;
    FAgosto: Extended;
    FSetembro: Extended;
    FOutubro: Extended;
    FNovembro: Extended;
    FDezembro: Extended;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_CONTABIL_CONTA')]
		[MVCNameAsAttribute('idContabilConta')]
		property IdContabilConta: Integer read FIdContabilConta write FIdContabilConta;
    [MVCColumnAttribute('ANO')]
		[MVCNameAsAttribute('ano')]
		property Ano: string read FAno write FAno;
    [MVCColumnAttribute('JANEIRO')]
		[MVCNameAsAttribute('janeiro')]
		property Janeiro: Extended read FJaneiro write FJaneiro;
    [MVCColumnAttribute('FEVEREIRO')]
		[MVCNameAsAttribute('fevereiro')]
		property Fevereiro: Extended read FFevereiro write FFevereiro;
    [MVCColumnAttribute('MARCO')]
		[MVCNameAsAttribute('marco')]
		property Marco: Extended read FMarco write FMarco;
    [MVCColumnAttribute('ABRIL')]
		[MVCNameAsAttribute('abril')]
		property Abril: Extended read FAbril write FAbril;
    [MVCColumnAttribute('MAIO')]
		[MVCNameAsAttribute('maio')]
		property Maio: Extended read FMaio write FMaio;
    [MVCColumnAttribute('JUNHO')]
		[MVCNameAsAttribute('junho')]
		property Junho: Extended read FJunho write FJunho;
    [MVCColumnAttribute('JULHO')]
		[MVCNameAsAttribute('julho')]
		property Julho: Extended read FJulho write FJulho;
    [MVCColumnAttribute('AGOSTO')]
		[MVCNameAsAttribute('agosto')]
		property Agosto: Extended read FAgosto write FAgosto;
    [MVCColumnAttribute('SETEMBRO')]
		[MVCNameAsAttribute('setembro')]
		property Setembro: Extended read FSetembro write FSetembro;
    [MVCColumnAttribute('OUTUBRO')]
		[MVCNameAsAttribute('outubro')]
		property Outubro: Extended read FOutubro write FOutubro;
    [MVCColumnAttribute('NOVEMBRO')]
		[MVCNameAsAttribute('novembro')]
		property Novembro: Extended read FNovembro write FNovembro;
    [MVCColumnAttribute('DEZEMBRO')]
		[MVCNameAsAttribute('dezembro')]
		property Dezembro: Extended read FDezembro write FDezembro;
      
  end;

implementation

{ TContabilLancamentoOrcado }



end.