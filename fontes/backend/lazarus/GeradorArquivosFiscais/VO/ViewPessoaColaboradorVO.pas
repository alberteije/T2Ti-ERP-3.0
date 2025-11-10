{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_PESSOA_COLABORADOR] 
                                                                                
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
unit ViewPessoaColaboradorVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TViewPessoaColaboradorVO = class(TVO)
  private
    FID: Integer;
    FID_SINDICATO: Integer;
    FID_TIPO_ADMISSAO: Integer;
    FID_SITUACAO_COLABORADOR: Integer;
    FID_PESSOA: Integer;
    FID_TIPO_COLABORADOR: Integer;
    FID_NIVEL_FORMACAO: Integer;
    FID_CARGO: Integer;
    FID_SETOR: Integer;
    FMATRICULA: String;
    FDATA_CADASTRO: TDateTime;
    FDATA_ADMISSAO: TDateTime;
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
    FCODIGO_TURMA_PONTO: String;
    FPIS_NUMERO: String;

    //Transientes



  published
    property Id: Integer  read FID write FID;
    property Nome: String  read FNOME write FNOME;
    property IdSindicato: Integer  read FID_SINDICATO write FID_SINDICATO;
    property IdTipoAdmissao: Integer  read FID_TIPO_ADMISSAO write FID_TIPO_ADMISSAO;
    property IdSituacaoColaborador: Integer  read FID_SITUACAO_COLABORADOR write FID_SITUACAO_COLABORADOR;
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    property IdTipoColaborador: Integer  read FID_TIPO_COLABORADOR write FID_TIPO_COLABORADOR;
    property IdNivelFormacao: Integer  read FID_NIVEL_FORMACAO write FID_NIVEL_FORMACAO;
    property IdCargo: Integer  read FID_CARGO write FID_CARGO;
    property IdSetor: Integer  read FID_SETOR write FID_SETOR;
    property Matricula: String  read FMATRICULA write FMATRICULA;
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    property DataAdmissao: TDateTime  read FDATA_ADMISSAO write FDATA_ADMISSAO;
    property Logradouro: String  read FLOGRADOURO write FLOGRADOURO;
    property Numero: String  read FNUMERO write FNUMERO;
    property Complemento: String  read FCOMPLEMENTO write FCOMPLEMENTO;
    property Bairro: String  read FBAIRRO write FBAIRRO;
    property Cidade: String  read FCIDADE write FCIDADE;
    property Cep: String  read FCEP write FCEP;
    property MunicipioIbge: Integer  read FMUNICIPIO_IBGE write FMUNICIPIO_IBGE;
    property Uf: String  read FUF write FUF;
    property Fone: String  read FFONE write FFONE;
    property Tipo: String  read FTIPO write FTIPO;
    property Email: String  read FEMAIL write FEMAIL;
    property Site: String  read FSITE write FSITE;
    property CpfCnpj: String  read FCPF_CNPJ write FCPF_CNPJ;
    property RgIe: String  read FRG_IE write FRG_IE;
    property CodigoTurmaPonto: String  read FCODIGO_TURMA_PONTO write FCODIGO_TURMA_PONTO;
    property PisNumero: String  read FPIS_NUMERO write FPIS_NUMERO;


    //Transientes

  end;

  TListaViewPessoaColaboradorVO = specialize TFPGObjectList<TViewPessoaColaboradorVO>;

implementation


initialization
  Classes.RegisterClass(TViewPessoaColaboradorVO);

finalization
  Classes.UnRegisterClass(TViewPessoaColaboradorVO);

end.
