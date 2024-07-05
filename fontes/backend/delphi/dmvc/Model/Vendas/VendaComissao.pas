{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VENDA_COMISSAO] 
                                                                                
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
unit VendaComissao;

interface

uses
  Generics.Collections, System.SysUtils,
  Vendedor, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TVendaComissao = class(TModelBase)
  private
    FId: Integer;
    FIdVendaCabecalho: Integer;
    FIdVendedor: Integer;
    FValorVenda: Extended;
    FTipoContabil: string;
    FValorComissao: Extended;
    FSituacao: string;
    FDataLancamento: TDateTime;
      
    FVendedor: TVendedor;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_VENDA_CABECALHO')]
		[MVCNameAsAttribute('idVendaCabecalho')]
		property IdVendaCabecalho: Integer read FIdVendaCabecalho write FIdVendaCabecalho;
    [MVCColumnAttribute('ID_VENDEDOR')]
		[MVCNameAsAttribute('idVendedor')]
		property IdVendedor: Integer read FIdVendedor write FIdVendedor;
    [MVCColumnAttribute('VALOR_VENDA')]
		[MVCNameAsAttribute('valorVenda')]
		property ValorVenda: Extended read FValorVenda write FValorVenda;
    [MVCColumnAttribute('TIPO_CONTABIL')]
		[MVCNameAsAttribute('tipoContabil')]
		property TipoContabil: string read FTipoContabil write FTipoContabil;
    [MVCColumnAttribute('VALOR_COMISSAO')]
		[MVCNameAsAttribute('valorComissao')]
		property ValorComissao: Extended read FValorComissao write FValorComissao;
    [MVCColumnAttribute('SITUACAO')]
		[MVCNameAsAttribute('situacao')]
		property Situacao: string read FSituacao write FSituacao;
    [MVCColumnAttribute('DATA_LANCAMENTO')]
		[MVCNameAsAttribute('dataLancamento')]
		property DataLancamento: TDateTime read FDataLancamento write FDataLancamento;
      
    [MVCNameAsAttribute('vendedor')]
		property Vendedor: TVendedor read FVendedor write FVendedor;
  end;

implementation

{ TVendaComissao }

constructor TVendaComissao.Create;
begin
  inherited;

  FVendedor := TVendedor.Create;
end;

destructor TVendaComissao.Destroy;
begin
  FreeAndNil(FVendedor);
  inherited;
end;



end.