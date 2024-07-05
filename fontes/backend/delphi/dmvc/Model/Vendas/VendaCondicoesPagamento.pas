{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VENDA_CONDICOES_PAGAMENTO] 
                                                                                
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
unit VendaCondicoesPagamento;

interface

uses
  Generics.Collections, System.SysUtils,
  VendaCondicoesParcelas, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TVendaCondicoesPagamento = class(TModelBase)
  private
    FId: Integer;
    FNome: string;
    FDescricao: string;
    FFaturamentoMinimo: Extended;
    FFaturamentoMaximo: Extended;
    FIndiceCorrecao: Extended;
    FDiasTolerancia: Integer;
    FValorTolerancia: Extended;
    FPrazoMedio: Integer;
    FVistaPrazo: string;
      
    FListaVendaCondicoesParcelas: TObjectList<TVendaCondicoesParcelas>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('NOME')]
		[MVCNameAsAttribute('nome')]
		property Nome: string read FNome write FNome;
    [MVCColumnAttribute('DESCRICAO')]
		[MVCNameAsAttribute('descricao')]
		property Descricao: string read FDescricao write FDescricao;
    [MVCColumnAttribute('FATURAMENTO_MINIMO')]
		[MVCNameAsAttribute('faturamentoMinimo')]
		property FaturamentoMinimo: Extended read FFaturamentoMinimo write FFaturamentoMinimo;
    [MVCColumnAttribute('FATURAMENTO_MAXIMO')]
		[MVCNameAsAttribute('faturamentoMaximo')]
		property FaturamentoMaximo: Extended read FFaturamentoMaximo write FFaturamentoMaximo;
    [MVCColumnAttribute('INDICE_CORRECAO')]
		[MVCNameAsAttribute('indiceCorrecao')]
		property IndiceCorrecao: Extended read FIndiceCorrecao write FIndiceCorrecao;
    [MVCColumnAttribute('DIAS_TOLERANCIA')]
		[MVCNameAsAttribute('diasTolerancia')]
		property DiasTolerancia: Integer read FDiasTolerancia write FDiasTolerancia;
    [MVCColumnAttribute('VALOR_TOLERANCIA')]
		[MVCNameAsAttribute('valorTolerancia')]
		property ValorTolerancia: Extended read FValorTolerancia write FValorTolerancia;
    [MVCColumnAttribute('PRAZO_MEDIO')]
		[MVCNameAsAttribute('prazoMedio')]
		property PrazoMedio: Integer read FPrazoMedio write FPrazoMedio;
    [MVCColumnAttribute('VISTA_PRAZO')]
		[MVCNameAsAttribute('vistaPrazo')]
		property VistaPrazo: string read FVistaPrazo write FVistaPrazo;
      
    [MapperListOf(TVendaCondicoesParcelas)]
	[MVCNameAsAttribute('listaVendaCondicoesParcelas')]
	property ListaVendaCondicoesParcelas: TObjectList<TVendaCondicoesParcelas> read FListaVendaCondicoesParcelas write FListaVendaCondicoesParcelas;
  end;

implementation

{ TVendaCondicoesPagamento }

constructor TVendaCondicoesPagamento.Create;
begin
  inherited;

  FListaVendaCondicoesParcelas := TObjectList<TVendaCondicoesParcelas>.Create;
end;

destructor TVendaCondicoesPagamento.Destroy;
begin
  FreeAndNil(FListaVendaCondicoesParcelas);
  inherited;
end;



end.