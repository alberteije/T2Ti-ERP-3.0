{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FISCAL_TERMO] 
                                                                                
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
unit FiscalTermo;

interface

uses
  Generics.Collections, System.SysUtils,
  FiscalLivro, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TFiscalTermo = class(TModelBase)
  private
    FId: Integer;
    FIdFiscalLivro: Integer;
    FAberturaEncerramento: string;
    FNumero: Integer;
    FPaginaInicial: Integer;
    FPaginaFinal: Integer;
    FRegistrado: string;
    FNumeroRegistro: string;
    FDataDespacho: TDateTime;
    FDataAbertura: TDateTime;
    FDataEncerramento: TDateTime;
    FEscrituracaoInicio: TDateTime;
    FEscrituracaoFim: TDateTime;
    FTexto: string;
      
    FFiscalLivro: TFiscalLivro;
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_FISCAL_LIVRO')]
		[MVCNameAsAttribute('idFiscalLivro')]
		property IdFiscalLivro: Integer read FIdFiscalLivro write FIdFiscalLivro;
    [MVCColumnAttribute('ABERTURA_ENCERRAMENTO')]
		[MVCNameAsAttribute('aberturaEncerramento')]
		property AberturaEncerramento: string read FAberturaEncerramento write FAberturaEncerramento;
    [MVCColumnAttribute('NUMERO')]
		[MVCNameAsAttribute('numero')]
		property Numero: Integer read FNumero write FNumero;
    [MVCColumnAttribute('PAGINA_INICIAL')]
		[MVCNameAsAttribute('paginaInicial')]
		property PaginaInicial: Integer read FPaginaInicial write FPaginaInicial;
    [MVCColumnAttribute('PAGINA_FINAL')]
		[MVCNameAsAttribute('paginaFinal')]
		property PaginaFinal: Integer read FPaginaFinal write FPaginaFinal;
    [MVCColumnAttribute('REGISTRADO')]
		[MVCNameAsAttribute('registrado')]
		property Registrado: string read FRegistrado write FRegistrado;
    [MVCColumnAttribute('NUMERO_REGISTRO')]
		[MVCNameAsAttribute('numeroRegistro')]
		property NumeroRegistro: string read FNumeroRegistro write FNumeroRegistro;
    [MVCColumnAttribute('DATA_DESPACHO')]
		[MVCNameAsAttribute('dataDespacho')]
		property DataDespacho: TDateTime read FDataDespacho write FDataDespacho;
    [MVCColumnAttribute('DATA_ABERTURA')]
		[MVCNameAsAttribute('dataAbertura')]
		property DataAbertura: TDateTime read FDataAbertura write FDataAbertura;
    [MVCColumnAttribute('DATA_ENCERRAMENTO')]
		[MVCNameAsAttribute('dataEncerramento')]
		property DataEncerramento: TDateTime read FDataEncerramento write FDataEncerramento;
    [MVCColumnAttribute('ESCRITURACAO_INICIO')]
		[MVCNameAsAttribute('escrituracaoInicio')]
		property EscrituracaoInicio: TDateTime read FEscrituracaoInicio write FEscrituracaoInicio;
    [MVCColumnAttribute('ESCRITURACAO_FIM')]
		[MVCNameAsAttribute('escrituracaoFim')]
		property EscrituracaoFim: TDateTime read FEscrituracaoFim write FEscrituracaoFim;
    [MVCColumnAttribute('TEXTO')]
		[MVCNameAsAttribute('texto')]
		property Texto: string read FTexto write FTexto;
      
    [MVCNameAsAttribute('fiscalLivro')]
		property FiscalLivro: TFiscalLivro read FFiscalLivro write FFiscalLivro;
  end;

implementation

{ TFiscalTermo }

constructor TFiscalTermo.Create;
begin
  inherited;
  FFiscalLivro := TFiscalLivro.Create;
end;

destructor TFiscalTermo.Destroy;
begin
  FreeAndNil(FFiscalLivro);
  inherited;
end;

end.