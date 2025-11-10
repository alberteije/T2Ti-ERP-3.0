{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONVENIO] 
                                                                                
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
unit ConvenioVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TConvenioVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FNOME: String;
    FCNPJ: String;
    FEMAIL: String;
    FSITE: String;
    FDESCONTO: Extended;
    FDATA_VENCIMENTO: TDateTime;
    FLOGRADOURO: String;
    FNUMERO: String;
    FBAIRRO: String;
    FCIDADE: String;
    FMUNICIPIO_IBGE: Integer;
    FUF: String;
    FTELEFONE: String;
    FDATA_CADASTRO: TDateTime;
    FDESCRICAO: String;
    FCEP: String;
    FCLASSIFICACAO_CONTABIL_CONTA: String;
    FCONTATO: String;

  published 
    property Id: Integer  read FID write FID;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property Nome: String  read FNOME write FNOME;
    property Cnpj: String  read FCNPJ write FCNPJ;
    property Email: String  read FEMAIL write FEMAIL;
    property Site: String  read FSITE write FSITE;
    property Desconto: Extended  read FDESCONTO write FDESCONTO;
    property DataVencimento: TDateTime  read FDATA_VENCIMENTO write FDATA_VENCIMENTO;
    property Logradouro: String  read FLOGRADOURO write FLOGRADOURO;
    property Numero: String  read FNUMERO write FNUMERO;
    property Bairro: String  read FBAIRRO write FBAIRRO;
    property Cidade: String  read FCIDADE write FCIDADE;
    property MunicipioIbge: Integer  read FMUNICIPIO_IBGE write FMUNICIPIO_IBGE;
    property Uf: String  read FUF write FUF;
    property Telefone: String  read FTELEFONE write FTELEFONE;
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property Cep: String  read FCEP write FCEP;
    property ClassificacaoContabilConta: String  read FCLASSIFICACAO_CONTABIL_CONTA write FCLASSIFICACAO_CONTABIL_CONTA;
    property Contato: String  read FCONTATO write FCONTATO;


  end;

  TListaConvenioVO = specialize TFPGObjectList<TConvenioVO>;

implementation


initialization
  Classes.RegisterClass(TConvenioVO);

finalization
  Classes.UnRegisterClass(TConvenioVO);

end.
