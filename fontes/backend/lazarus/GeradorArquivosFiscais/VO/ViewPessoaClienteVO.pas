{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_PESSOA_CLIENTE] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2016 T2Ti.COM                                          
                                                                                
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
unit ViewPessoaClienteVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TViewPessoaClienteVO = class(TVO)
  private
    FID: Integer;
    FID_OPERACAO_FISCAL: Integer;
    FID_PESSOA: Integer;
    FID_ATIVIDADE_FOR_CLI: Integer;
    FID_SITUACAO_FOR_CLI: Integer;
    FID_CONVENIO: Integer;
    FDESDE: TDateTime;
    FDATA_CADASTRO: TDateTime;
    FOBSERVACAO: String;
    FCONTA_TOMADOR: String;
    FGERA_FINANCEIRO: String;
    FINDICADOR_PRECO: String;
    FPORCENTO_DESCONTO: Extended;
    FFORMA_DESCONTO: String;
    FLIMITE_CREDITO: Extended;
    FTIPO_FRETE: String;
    FDESCONTO_CONVENIO: Extended;
    FLOGRADOURO: String;
    FNUMERO: String;
    FCOMPLEMENTO: String;
    FBAIRRO: String;
    FCIDADE: String;
    FCEP: String;
    FMUNICIPIO_IBGE: Integer;
    FUF: String;
    FFONE: String;
    FNOME: String;
    FTIPO: String;
    FEMAIL: String;
    FSITE: String;
    FCPF_CNPJ: String;
    FRG_IE: String;


  published 
    property Id: Integer  read FID write FID;
    property IdOperacaoFiscal: Integer  read FID_OPERACAO_FISCAL write FID_OPERACAO_FISCAL;
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    property IdAtividadeForCli: Integer  read FID_ATIVIDADE_FOR_CLI write FID_ATIVIDADE_FOR_CLI;
    property IdSituacaoForCli: Integer  read FID_SITUACAO_FOR_CLI write FID_SITUACAO_FOR_CLI;
    property IdConvenio: Integer  read FID_CONVENIO write FID_CONVENIO;
    property Desde: TDateTime  read FDESDE write FDESDE;
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;
    property ContaTomador: String  read FCONTA_TOMADOR write FCONTA_TOMADOR;
    property GeraFinanceiro: String  read FGERA_FINANCEIRO write FGERA_FINANCEIRO;
    property IndicadorPreco: String  read FINDICADOR_PRECO write FINDICADOR_PRECO;
    property PorcentoDesconto: Extended  read FPORCENTO_DESCONTO write FPORCENTO_DESCONTO;
    property FormaDesconto: String  read FFORMA_DESCONTO write FFORMA_DESCONTO;
    property LimiteCredito: Extended  read FLIMITE_CREDITO write FLIMITE_CREDITO;
    property TipoFrete: String  read FTIPO_FRETE write FTIPO_FRETE;
    property DescontoConvenio: Extended  read FDESCONTO_CONVENIO write FDESCONTO_CONVENIO;
    property Logradouro: String  read FLOGRADOURO write FLOGRADOURO;
    property Numero: String  read FNUMERO write FNUMERO;
    property Complemento: String  read FCOMPLEMENTO write FCOMPLEMENTO;
    property Bairro: String  read FBAIRRO write FBAIRRO;
    property Cidade: String  read FCIDADE write FCIDADE;
    property Cep: String  read FCEP write FCEP;
    property MunicipioIbge: Integer  read FMUNICIPIO_IBGE write FMUNICIPIO_IBGE;
    property Uf: String  read FUF write FUF;
    property Fone: String  read FFONE write FFONE;
    property Nome: String  read FNOME write FNOME;
    property Tipo: String  read FTIPO write FTIPO;
    property Email: String  read FEMAIL write FEMAIL;
    property Site: String  read FSITE write FSITE;
    property CpfCnpj: String  read FCPF_CNPJ write FCPF_CNPJ;
    property RgIe: String  read FRG_IE write FRG_IE;


  end;

  TListaViewPessoaClienteVO = specialize TFPGObjectList<TViewPessoaClienteVO>;

implementation


initialization
  Classes.RegisterClass(TViewPessoaClienteVO);

finalization
  Classes.UnRegisterClass(TViewPessoaClienteVO);

end.
