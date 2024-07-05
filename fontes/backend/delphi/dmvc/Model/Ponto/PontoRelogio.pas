{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PONTO_RELOGIO] 
                                                                                
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
unit PontoRelogio;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TPontoRelogio = class(TModelBase)
  private
    FId: Integer;
    FLocalizacao: string;
    FMarca: string;
    FFabricante: string;
    FNumeroSerie: string;
    FUtilizacao: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('LOCALIZACAO')]
		[MVCNameAsAttribute('localizacao')]
		property Localizacao: string read FLocalizacao write FLocalizacao;
    [MVCColumnAttribute('MARCA')]
		[MVCNameAsAttribute('marca')]
		property Marca: string read FMarca write FMarca;
    [MVCColumnAttribute('FABRICANTE')]
		[MVCNameAsAttribute('fabricante')]
		property Fabricante: string read FFabricante write FFabricante;
    [MVCColumnAttribute('NUMERO_SERIE')]
		[MVCNameAsAttribute('numeroSerie')]
		property NumeroSerie: string read FNumeroSerie write FNumeroSerie;
    [MVCColumnAttribute('UTILIZACAO')]
		[MVCNameAsAttribute('utilizacao')]
		property Utilizacao: string read FUtilizacao write FUtilizacao;
      
  end;

implementation

{ TPontoRelogio }



end.