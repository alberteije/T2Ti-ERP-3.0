{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [SIMPLES_NACIONAL_DETALHE] 
                                                                                
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
unit SimplesNacionalDetalhe;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TSimplesNacionalDetalhe = class(TModelBase)
  private
    FId: Integer;
    FIdSimplesNacionalCabecalho: Integer;
    FFaixa: Integer;
    FValorInicial: Extended;
    FValorFinal: Extended;
    FAliquota: Extended;
    FIrpj: Extended;
    FCsll: Extended;
    FCofins: Extended;
    FPisPasep: Extended;
    FCpp: Extended;
    FIcms: Extended;
    FIpi: Extended;
    FIss: Extended;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_SIMPLES_NACIONAL_CABECALHO')]
		[MVCNameAsAttribute('idSimplesNacionalCabecalho')]
		property IdSimplesNacionalCabecalho: Integer read FIdSimplesNacionalCabecalho write FIdSimplesNacionalCabecalho;
    [MVCColumnAttribute('FAIXA')]
		[MVCNameAsAttribute('faixa')]
		property Faixa: Integer read FFaixa write FFaixa;
    [MVCColumnAttribute('VALOR_INICIAL')]
		[MVCNameAsAttribute('valorInicial')]
		property ValorInicial: Extended read FValorInicial write FValorInicial;
    [MVCColumnAttribute('VALOR_FINAL')]
		[MVCNameAsAttribute('valorFinal')]
		property ValorFinal: Extended read FValorFinal write FValorFinal;
    [MVCColumnAttribute('ALIQUOTA')]
		[MVCNameAsAttribute('aliquota')]
		property Aliquota: Extended read FAliquota write FAliquota;
    [MVCColumnAttribute('IRPJ')]
		[MVCNameAsAttribute('irpj')]
		property Irpj: Extended read FIrpj write FIrpj;
    [MVCColumnAttribute('CSLL')]
		[MVCNameAsAttribute('csll')]
		property Csll: Extended read FCsll write FCsll;
    [MVCColumnAttribute('COFINS')]
		[MVCNameAsAttribute('cofins')]
		property Cofins: Extended read FCofins write FCofins;
    [MVCColumnAttribute('PIS_PASEP')]
		[MVCNameAsAttribute('pisPasep')]
		property PisPasep: Extended read FPisPasep write FPisPasep;
    [MVCColumnAttribute('CPP')]
		[MVCNameAsAttribute('cpp')]
		property Cpp: Extended read FCpp write FCpp;
    [MVCColumnAttribute('ICMS')]
		[MVCNameAsAttribute('icms')]
		property Icms: Extended read FIcms write FIcms;
    [MVCColumnAttribute('IPI')]
		[MVCNameAsAttribute('ipi')]
		property Ipi: Extended read FIpi write FIpi;
    [MVCColumnAttribute('ISS')]
		[MVCNameAsAttribute('iss')]
		property Iss: Extended read FIss write FIss;
      
  end;

implementation

{ TSimplesNacionalDetalhe }



end.