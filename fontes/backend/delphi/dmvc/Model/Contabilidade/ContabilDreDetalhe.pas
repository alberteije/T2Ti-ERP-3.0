{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTABIL_DRE_DETALHE] 
                                                                                
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
unit ContabilDreDetalhe;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TContabilDreDetalhe = class(TModelBase)
  private
    FId: Integer;
    FIdContabilDreCabecalho: Integer;
    FClassificacao: string;
    FDescricao: string;
    FFormaCalculo: string;
    FSinal: string;
    FNatureza: string;
    FValor: Extended;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_CONTABIL_DRE_CABECALHO')]
		[MVCNameAsAttribute('idContabilDreCabecalho')]
		property IdContabilDreCabecalho: Integer read FIdContabilDreCabecalho write FIdContabilDreCabecalho;
    [MVCColumnAttribute('CLASSIFICACAO')]
		[MVCNameAsAttribute('classificacao')]
		property Classificacao: string read FClassificacao write FClassificacao;
    [MVCColumnAttribute('DESCRICAO')]
		[MVCNameAsAttribute('descricao')]
		property Descricao: string read FDescricao write FDescricao;
    [MVCColumnAttribute('FORMA_CALCULO')]
		[MVCNameAsAttribute('formaCalculo')]
		property FormaCalculo: string read FFormaCalculo write FFormaCalculo;
    [MVCColumnAttribute('SINAL')]
		[MVCNameAsAttribute('sinal')]
		property Sinal: string read FSinal write FSinal;
    [MVCColumnAttribute('NATUREZA')]
		[MVCNameAsAttribute('natureza')]
		property Natureza: string read FNatureza write FNatureza;
    [MVCColumnAttribute('VALOR')]
		[MVCNameAsAttribute('valor')]
		property Valor: Extended read FValor write FValor;
      
  end;

implementation

{ TContabilDreDetalhe }



end.