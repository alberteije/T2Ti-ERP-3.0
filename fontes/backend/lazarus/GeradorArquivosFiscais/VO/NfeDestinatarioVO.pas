{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_DESTINATARIO] 
                                                                                
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
unit NfeDestinatarioVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TNfeDestinatarioVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FCPF_CNPJ: String;
    FESTRANGEIRO_IDENTIFICACAO: String;
    FNOME: String;
    FLOGRADOURO: String;
    FNUMERO: String;
    FCOMPLEMENTO: String;
    FBAIRRO: String;
    FCODIGO_MUNICIPIO: Integer;
    FNOME_MUNICIPIO: String;
    FUF: String;
    FCEP: String;
    FCODIGO_PAIS: Integer;
    FNOME_PAIS: String;
    FTELEFONE: String;
    FINDICADOR_IE: Integer;
    FINSCRICAO_ESTADUAL: String;
    FINSCRICAO_MUNICIPAL: String;
    FSUFRAMA: Integer;
    FEMAIL: String;

  published 
    property Id: Integer  read FID write FID;
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    property CpfCnpj: String  read FCPF_CNPJ write FCPF_CNPJ;
    property EstrangeiroIdentificacao: String  read FESTRANGEIRO_IDENTIFICACAO write FESTRANGEIRO_IDENTIFICACAO;
    property Nome: String  read FNOME write FNOME;
    property Logradouro: String  read FLOGRADOURO write FLOGRADOURO;
    property Numero: String  read FNUMERO write FNUMERO;
    property Complemento: String  read FCOMPLEMENTO write FCOMPLEMENTO;
    property Bairro: String  read FBAIRRO write FBAIRRO;
    property CodigoMunicipio: Integer  read FCODIGO_MUNICIPIO write FCODIGO_MUNICIPIO;
    property NomeMunicipio: String  read FNOME_MUNICIPIO write FNOME_MUNICIPIO;
    property Uf: String  read FUF write FUF;
    property Cep: String  read FCEP write FCEP;
    property CodigoPais: Integer  read FCODIGO_PAIS write FCODIGO_PAIS;
    property NomePais: String  read FNOME_PAIS write FNOME_PAIS;
    property Telefone: String  read FTELEFONE write FTELEFONE;
    property IndicadorIe: Integer  read FINDICADOR_IE write FINDICADOR_IE;
    property InscricaoEstadual: String  read FINSCRICAO_ESTADUAL write FINSCRICAO_ESTADUAL;
    property InscricaoMunicipal: String  read FINSCRICAO_MUNICIPAL write FINSCRICAO_MUNICIPAL;
    property Suframa: Integer  read FSUFRAMA write FSUFRAMA;
    property Email: String  read FEMAIL write FEMAIL;

  end;

  TListaNfeDestinatarioVO = specialize TFPGObjectList<TNfeDestinatarioVO>;

implementation


initialization
  Classes.RegisterClass(TNfeDestinatarioVO);

finalization
  Classes.UnRegisterClass(TNfeDestinatarioVO);

end.
