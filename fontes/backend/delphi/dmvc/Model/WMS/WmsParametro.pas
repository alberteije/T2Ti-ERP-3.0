{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [WMS_PARAMETRO] 
                                                                                
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
unit WmsParametro;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TWmsParametro = class(TModelBase)
  private
    FId: Integer;
    FHoraPorVolume: Integer;
    FPessoaPorVolume: Integer;
    FHoraPorPeso: Integer;
    FPessoaPorPeso: Integer;
    FItemDiferenteCaixa: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('HORA_POR_VOLUME')]
		[MVCNameAsAttribute('horaPorVolume')]
		property HoraPorVolume: Integer read FHoraPorVolume write FHoraPorVolume;
    [MVCColumnAttribute('PESSOA_POR_VOLUME')]
		[MVCNameAsAttribute('pessoaPorVolume')]
		property PessoaPorVolume: Integer read FPessoaPorVolume write FPessoaPorVolume;
    [MVCColumnAttribute('HORA_POR_PESO')]
		[MVCNameAsAttribute('horaPorPeso')]
		property HoraPorPeso: Integer read FHoraPorPeso write FHoraPorPeso;
    [MVCColumnAttribute('PESSOA_POR_PESO')]
		[MVCNameAsAttribute('pessoaPorPeso')]
		property PessoaPorPeso: Integer read FPessoaPorPeso write FPessoaPorPeso;
    [MVCColumnAttribute('ITEM_DIFERENTE_CAIXA')]
		[MVCNameAsAttribute('itemDiferenteCaixa')]
		property ItemDiferenteCaixa: string read FItemDiferenteCaixa write FItemDiferenteCaixa;
      
  end;

implementation

{ TWmsParametro }



end.