{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_ICMS_UFDEST] 
                                                                                
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
unit NfeDetalheImpostoIcmsUfdest;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeDetalheImpostoIcmsUfdest = class(TModelBase)
  private
    FId: Integer;
    FIdNfeDetalhe: Integer;
    FValorBcIcmsUfDestino: Extended;
    FValorBcFcpUfDestino: Extended;
    FPercentualFcpUfDestino: Extended;
    FAliquotaInternaUfDestino: Extended;
    FAliquotaInteresdatualUfEnvolvidas: Extended;
    FPercentualProvisorioPartilhaIcms: Extended;
    FValorIcmsFcpUfDestino: Extended;
    FValorInterestadualUfDestino: Extended;
    FValorInterestadualUfRemetente: Extended;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_DETALHE')]
		[MVCNameAsAttribute('idNfeDetalhe')]
		property IdNfeDetalhe: Integer read FIdNfeDetalhe write FIdNfeDetalhe;
    [MVCColumnAttribute('VALOR_BC_ICMS_UF_DESTINO')]
		[MVCNameAsAttribute('valorBcIcmsUfDestino')]
		property ValorBcIcmsUfDestino: Extended read FValorBcIcmsUfDestino write FValorBcIcmsUfDestino;
    [MVCColumnAttribute('VALOR_BC_FCP_UF_DESTINO')]
		[MVCNameAsAttribute('valorBcFcpUfDestino')]
		property ValorBcFcpUfDestino: Extended read FValorBcFcpUfDestino write FValorBcFcpUfDestino;
    [MVCColumnAttribute('PERCENTUAL_FCP_UF_DESTINO')]
		[MVCNameAsAttribute('percentualFcpUfDestino')]
		property PercentualFcpUfDestino: Extended read FPercentualFcpUfDestino write FPercentualFcpUfDestino;
    [MVCColumnAttribute('ALIQUOTA_INTERNA_UF_DESTINO')]
		[MVCNameAsAttribute('aliquotaInternaUfDestino')]
		property AliquotaInternaUfDestino: Extended read FAliquotaInternaUfDestino write FAliquotaInternaUfDestino;
    [MVCColumnAttribute('ALIQUOTA_INTERESDATUAL_UF_ENVOLVIDAS')]
		[MVCNameAsAttribute('aliquotaInteresdatualUfEnvolvidas')]
		property AliquotaInteresdatualUfEnvolvidas: Extended read FAliquotaInteresdatualUfEnvolvidas write FAliquotaInteresdatualUfEnvolvidas;
    [MVCColumnAttribute('PERCENTUAL_PROVISORIO_PARTILHA_ICMS')]
		[MVCNameAsAttribute('percentualProvisorioPartilhaIcms')]
		property PercentualProvisorioPartilhaIcms: Extended read FPercentualProvisorioPartilhaIcms write FPercentualProvisorioPartilhaIcms;
    [MVCColumnAttribute('VALOR_ICMS_FCP_UF_DESTINO')]
		[MVCNameAsAttribute('valorIcmsFcpUfDestino')]
		property ValorIcmsFcpUfDestino: Extended read FValorIcmsFcpUfDestino write FValorIcmsFcpUfDestino;
    [MVCColumnAttribute('VALOR_INTERESTADUAL_UF_DESTINO')]
		[MVCNameAsAttribute('valorInterestadualUfDestino')]
		property ValorInterestadualUfDestino: Extended read FValorInterestadualUfDestino write FValorInterestadualUfDestino;
    [MVCColumnAttribute('VALOR_INTERESTADUAL_UF_REMETENTE')]
		[MVCNameAsAttribute('valorInterestadualUfRemetente')]
		property ValorInterestadualUfRemetente: Extended read FValorInterestadualUfRemetente write FValorInterestadualUfRemetente;
      
  end;

implementation

{ TNfeDetalheImpostoIcmsUfdest }





end.