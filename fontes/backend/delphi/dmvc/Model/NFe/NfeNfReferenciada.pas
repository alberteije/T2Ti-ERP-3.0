{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_NF_REFERENCIADA] 
                                                                                
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
unit NfeNfReferenciada;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeNfReferenciada = class(TModelBase)
  private
    FId: Integer;
    FIdNfeCabecalho: Integer;
    FCodigoUf: Integer;
    FAnoMes: string;
    FCnpj: string;
    FModelo: string;
    FSerie: string;
    FNumeroNf: Integer;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_CABECALHO')]
		[MVCNameAsAttribute('idNfeCabecalho')]
		property IdNfeCabecalho: Integer read FIdNfeCabecalho write FIdNfeCabecalho;
    [MVCColumnAttribute('CODIGO_UF')]
		[MVCNameAsAttribute('codigoUf')]
		property CodigoUf: Integer read FCodigoUf write FCodigoUf;
    [MVCColumnAttribute('ANO_MES')]
		[MVCNameAsAttribute('anoMes')]
		property AnoMes: string read FAnoMes write FAnoMes;
    [MVCColumnAttribute('CNPJ')]
		[MVCNameAsAttribute('cnpj')]
		property Cnpj: string read FCnpj write FCnpj;
    [MVCColumnAttribute('MODELO')]
		[MVCNameAsAttribute('modelo')]
		property Modelo: string read FModelo write FModelo;
    [MVCColumnAttribute('SERIE')]
		[MVCNameAsAttribute('serie')]
		property Serie: string read FSerie write FSerie;
    [MVCColumnAttribute('NUMERO_NF')]
		[MVCNameAsAttribute('numeroNf')]
		property NumeroNf: Integer read FNumeroNf write FNumeroNf;
      
  end;

implementation

{ TNfeNfReferenciada }





end.