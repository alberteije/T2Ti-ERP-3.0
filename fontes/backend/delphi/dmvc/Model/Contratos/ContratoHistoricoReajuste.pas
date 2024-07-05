{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTRATO_HISTORICO_REAJUSTE] 
                                                                                
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
unit ContratoHistoricoReajuste;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TContratoHistoricoReajuste = class(TModelBase)
  private
    FId: Integer;
    FIdContrato: Integer;
    FIndice: Extended;
    FValorAnterior: Extended;
    FValorAtual: Extended;
    FDataReajuste: TDateTime;
    FObservacao: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_CONTRATO')]
		[MVCNameAsAttribute('idContrato')]
		property IdContrato: Integer read FIdContrato write FIdContrato;
    [MVCColumnAttribute('INDICE')]
		[MVCNameAsAttribute('indice')]
		property Indice: Extended read FIndice write FIndice;
    [MVCColumnAttribute('VALOR_ANTERIOR')]
		[MVCNameAsAttribute('valorAnterior')]
		property ValorAnterior: Extended read FValorAnterior write FValorAnterior;
    [MVCColumnAttribute('VALOR_ATUAL')]
		[MVCNameAsAttribute('valorAtual')]
		property ValorAtual: Extended read FValorAtual write FValorAtual;
    [MVCColumnAttribute('DATA_REAJUSTE')]
		[MVCNameAsAttribute('dataReajuste')]
		property DataReajuste: TDateTime read FDataReajuste write FDataReajuste;
    [MVCColumnAttribute('OBSERVACAO')]
		[MVCNameAsAttribute('observacao')]
		property Observacao: string read FObservacao write FObservacao;
      
  end;

implementation

{ TContratoHistoricoReajuste }



end.