{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [SINDICATO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2014 T2Ti.COM                                          
                                                                                
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
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                    
@version 2.0                                                                    
*******************************************************************************}
unit SindicatoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TSindicatoVO = class(TVO)
  private
    FID: Integer;
    FNOME: String;
    FCODIGO_BANCO: Integer;
    FCODIGO_AGENCIA: Integer;
    FCONTA_BANCO: String;
    FCODIGO_CEDENTE: String;
    FLOGRADOURO: String;
    FNUMERO: String;
    FBAIRRO: String;
    FMUNICIPIO_IBGE: Integer;
    FUF: String;
    FFONE1: String;
    FFONE2: String;
    FEMAIL: String;
    FTIPO_SINDICATO: String;
    FDATA_BASE: TDateTime;
    FPISO_SALARIAL: Extended;
    FCNPJ: String;
    FCLASSIFICACAO_CONTABIL_CONTA: String;

  published
    property Id: Integer  read FID write FID;
    property Nome: String  read FNOME write FNOME;
    property CodigoBanco: Integer  read FCODIGO_BANCO write FCODIGO_BANCO;
    property CodigoAgencia: Integer  read FCODIGO_AGENCIA write FCODIGO_AGENCIA;
    property ContaBanco: String  read FCONTA_BANCO write FCONTA_BANCO;
    property CodigoCedente: String  read FCODIGO_CEDENTE write FCODIGO_CEDENTE;
    property Logradouro: String  read FLOGRADOURO write FLOGRADOURO;
    property Numero: String  read FNUMERO write FNUMERO;
    property Bairro: String  read FBAIRRO write FBAIRRO;
    property MunicipioIbge: Integer  read FMUNICIPIO_IBGE write FMUNICIPIO_IBGE;
    property Uf: String  read FUF write FUF;
    property Fone1: String  read FFONE1 write FFONE1;
    property Fone2: String  read FFONE2 write FFONE2;
    property Email: String  read FEMAIL write FEMAIL;
    property TipoSindicato: String  read FTIPO_SINDICATO write FTIPO_SINDICATO;
    property DataBase: TDateTime  read FDATA_BASE write FDATA_BASE;
    property PisoSalarial: Extended  read FPISO_SALARIAL write FPISO_SALARIAL;
    property Cnpj: String  read FCNPJ write FCNPJ;
    property ClassificacaoContabilConta: String  read FCLASSIFICACAO_CONTABIL_CONTA write FCLASSIFICACAO_CONTABIL_CONTA;

  end;

  TListaSindicatoVO = specialize TFPGObjectList<TSindicatoVO>;

implementation


initialization
  Classes.RegisterClass(TSindicatoVO);

finalization
  Classes.UnRegisterClass(TSindicatoVO);

end.
