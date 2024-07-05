{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_SPED_C190] 
                                                                                
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
unit ViewSpedC190;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TViewSpedC190 = class(TModelBase)
  private
    FId: Integer;
    FCstIcms: string;
    FCfop: Integer;
    FAliquotaIcms: Extended;
    FDataHoraEmissao: TDateTime;
    FSomaValorOperacao: Extended;
    FSomaBaseCalculoIcms: Extended;
    FSomaValorIcms: Extended;
    FSomaBaseCalculoIcmsSt: Extended;
    FSomaValorIcmsSt: Extended;
    FSomaVlRedBc: Extended;
    FSomaValorIpi: Extended;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('CST_ICMS')]
		[MVCNameAsAttribute('cstIcms')]
		property CstIcms: string read FCstIcms write FCstIcms;
    [MVCColumnAttribute('CFOP')]
		[MVCNameAsAttribute('cfop')]
		property Cfop: Integer read FCfop write FCfop;
    [MVCColumnAttribute('ALIQUOTA_ICMS')]
		[MVCNameAsAttribute('aliquotaIcms')]
		property AliquotaIcms: Extended read FAliquotaIcms write FAliquotaIcms;
    [MVCColumnAttribute('DATA_HORA_EMISSAO')]
		[MVCNameAsAttribute('dataHoraEmissao')]
		property DataHoraEmissao: TDateTime read FDataHoraEmissao write FDataHoraEmissao;
    [MVCColumnAttribute('SOMA_VALOR_OPERACAO')]
		[MVCNameAsAttribute('somaValorOperacao')]
		property SomaValorOperacao: Extended read FSomaValorOperacao write FSomaValorOperacao;
    [MVCColumnAttribute('SOMA_BASE_CALCULO_ICMS')]
		[MVCNameAsAttribute('somaBaseCalculoIcms')]
		property SomaBaseCalculoIcms: Extended read FSomaBaseCalculoIcms write FSomaBaseCalculoIcms;
    [MVCColumnAttribute('SOMA_VALOR_ICMS')]
		[MVCNameAsAttribute('somaValorIcms')]
		property SomaValorIcms: Extended read FSomaValorIcms write FSomaValorIcms;
    [MVCColumnAttribute('SOMA_BASE_CALCULO_ICMS_ST')]
		[MVCNameAsAttribute('somaBaseCalculoIcmsSt')]
		property SomaBaseCalculoIcmsSt: Extended read FSomaBaseCalculoIcmsSt write FSomaBaseCalculoIcmsSt;
    [MVCColumnAttribute('SOMA_VALOR_ICMS_ST')]
		[MVCNameAsAttribute('somaValorIcmsSt')]
		property SomaValorIcmsSt: Extended read FSomaValorIcmsSt write FSomaValorIcmsSt;
    [MVCColumnAttribute('SOMA_VL_RED_BC')]
		[MVCNameAsAttribute('somaVlRedBc')]
		property SomaVlRedBc: Extended read FSomaVlRedBc write FSomaVlRedBc;
    [MVCColumnAttribute('SOMA_VALOR_IPI')]
		[MVCNameAsAttribute('somaValorIpi')]
		property SomaValorIpi: Extended read FSomaValorIpi write FSomaValorIpi;
      
  end;

implementation

{ TViewSpedC190 }





end.