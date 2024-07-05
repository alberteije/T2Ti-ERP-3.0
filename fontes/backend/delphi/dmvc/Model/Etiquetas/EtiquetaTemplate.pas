{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [ETIQUETA_TEMPLATE] 
                                                                                
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
unit EtiquetaTemplate;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TEtiquetaTemplate = class(TModelBase)
  private
    FId: Integer;
    FIdEtiquetaLayout: Integer;
    FTabela: string;
    FCampo: string;
    FFormato: Integer;
    FQuantidadeRepeticoes: Integer;
    FFiltro: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_ETIQUETA_LAYOUT')]
		[MVCNameAsAttribute('idEtiquetaLayout')]
		property IdEtiquetaLayout: Integer read FIdEtiquetaLayout write FIdEtiquetaLayout;
    [MVCColumnAttribute('TABELA')]
		[MVCNameAsAttribute('tabela')]
		property Tabela: string read FTabela write FTabela;
    [MVCColumnAttribute('CAMPO')]
		[MVCNameAsAttribute('campo')]
		property Campo: string read FCampo write FCampo;
    [MVCColumnAttribute('FORMATO')]
		[MVCNameAsAttribute('formato')]
		property Formato: Integer read FFormato write FFormato;
    [MVCColumnAttribute('QUANTIDADE_REPETICOES')]
		[MVCNameAsAttribute('quantidadeRepeticoes')]
		property QuantidadeRepeticoes: Integer read FQuantidadeRepeticoes write FQuantidadeRepeticoes;
    [MVCColumnAttribute('FILTRO')]
		[MVCNameAsAttribute('filtro')]
		property Filtro: string read FFiltro write FFiltro;
      
  end;

implementation

{ TEtiquetaTemplate }



end.