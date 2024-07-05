{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_FATURA] 
                                                                                
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
unit NfeFatura;

interface

uses
  Generics.Collections, System.SysUtils,
  NfeDuplicata, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeFatura = class(TModelBase)
  private
    FId: Integer;
    FIdNfeCabecalho: Integer;
    FNumero: string;
    FValorOriginal: Extended;
    FValorDesconto: Extended;
    FValorLiquido: Extended;
      
    FListaNfeDuplicata: TObjectList<TNfeDuplicata>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_CABECALHO')]
		[MVCNameAsAttribute('idNfeCabecalho')]
		property IdNfeCabecalho: Integer read FIdNfeCabecalho write FIdNfeCabecalho;
    [MVCColumnAttribute('NUMERO')]
		[MVCNameAsAttribute('numero')]
		property Numero: string read FNumero write FNumero;
    [MVCColumnAttribute('VALOR_ORIGINAL')]
		[MVCNameAsAttribute('valorOriginal')]
		property ValorOriginal: Extended read FValorOriginal write FValorOriginal;
    [MVCColumnAttribute('VALOR_DESCONTO')]
		[MVCNameAsAttribute('valorDesconto')]
		property ValorDesconto: Extended read FValorDesconto write FValorDesconto;
    [MVCColumnAttribute('VALOR_LIQUIDO')]
		[MVCNameAsAttribute('valorLiquido')]
		property ValorLiquido: Extended read FValorLiquido write FValorLiquido;
      
    [MapperListOf(TNfeDuplicata)]
	[MVCNameAsAttribute('listaNfeDuplicata')]
	property ListaNfeDuplicata: TObjectList<TNfeDuplicata> read FListaNfeDuplicata write FListaNfeDuplicata;
  end;

implementation

{ TNfeFatura }

constructor TNfeFatura.Create;
begin
  inherited;

  FListaNfeDuplicata := TObjectList<TNfeDuplicata>.Create;
end;

destructor TNfeFatura.Destroy;
begin
  FreeAndNil(FListaNfeDuplicata);
  inherited;
end;



end.