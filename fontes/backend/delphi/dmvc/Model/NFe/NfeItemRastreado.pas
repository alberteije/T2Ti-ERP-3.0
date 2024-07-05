{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_ITEM_RASTREADO] 
                                                                                
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
unit NfeItemRastreado;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeItemRastreado = class(TModelBase)
  private
    FId: Integer;
    FIdNfeDetalhe: Integer;
    FNumeroLote: string;
    FQuantidadeItens: Extended;
    FDataFabricacao: TDateTime;
    FDataValidade: TDateTime;
    FCodigoAgregacao: string;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_DETALHE')]
		[MVCNameAsAttribute('idNfeDetalhe')]
		property IdNfeDetalhe: Integer read FIdNfeDetalhe write FIdNfeDetalhe;
    [MVCColumnAttribute('NUMERO_LOTE')]
		[MVCNameAsAttribute('numeroLote')]
		property NumeroLote: string read FNumeroLote write FNumeroLote;
    [MVCColumnAttribute('QUANTIDADE_ITENS')]
		[MVCNameAsAttribute('quantidadeItens')]
		property QuantidadeItens: Extended read FQuantidadeItens write FQuantidadeItens;
    [MVCColumnAttribute('DATA_FABRICACAO')]
		[MVCNameAsAttribute('dataFabricacao')]
		property DataFabricacao: TDateTime read FDataFabricacao write FDataFabricacao;
    [MVCColumnAttribute('DATA_VALIDADE')]
		[MVCNameAsAttribute('dataValidade')]
		property DataValidade: TDateTime read FDataValidade write FDataValidade;
    [MVCColumnAttribute('CODIGO_AGREGACAO')]
		[MVCNameAsAttribute('codigoAgregacao')]
		property CodigoAgregacao: string read FCodigoAgregacao write FCodigoAgregacao;
      
  end;

implementation

{ TNfeItemRastreado }





end.