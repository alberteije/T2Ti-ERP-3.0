{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FISCAL_PARAMETRO] 
                                                                                
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
unit FiscalParametroVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TFiscalParametroVO = class(TVO)
  private
    FID: Integer;
    FID_FISCAL_ESTADUAL_PORTE: Integer;
    FID_FISCAL_ESTADUAL_REGIME: Integer;
    FID_FISCAL_MUNICIPAL_REGIME: Integer;
    FID_EMPRESA: Integer;
    FVIGENCIA: String;
    FDESCRICAO_VIGENCIA: String;
    FCRITERIO_LANCAMENTO: String;
    FAPURACAO: String;
    FMICROEMPREE_INDIVIDUAL: String;
    FCALC_PIS_COFINS_EFD: String;
    FSIMPLES_CODIGO_ACESSO: String;
    FSIMPLES_TABELA: String;
    FSIMPLES_ATIVIDADE: String;
    FPERFIL_SPED: String;
    FAPURACAO_CONSOLIDADA: String;
    FSUBSTITUICAO_TRIBUTARIA: String;
    FFORMA_CALCULO_ISS: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdFiscalEstadualPorte: Integer  read FID_FISCAL_ESTADUAL_PORTE write FID_FISCAL_ESTADUAL_PORTE;
    property IdFiscalEstadualRegime: Integer  read FID_FISCAL_ESTADUAL_REGIME write FID_FISCAL_ESTADUAL_REGIME;
    property IdFiscalMunicipalRegime: Integer  read FID_FISCAL_MUNICIPAL_REGIME write FID_FISCAL_MUNICIPAL_REGIME;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property Vigencia: String  read FVIGENCIA write FVIGENCIA;
    property DescricaoVigencia: String  read FDESCRICAO_VIGENCIA write FDESCRICAO_VIGENCIA;
    property CriterioLancamento: String  read FCRITERIO_LANCAMENTO write FCRITERIO_LANCAMENTO;
    property Apuracao: String  read FAPURACAO write FAPURACAO;
    property MicroempreeIndividual: String  read FMICROEMPREE_INDIVIDUAL write FMICROEMPREE_INDIVIDUAL;
    property CalcPisCofinsEfd: String  read FCALC_PIS_COFINS_EFD write FCALC_PIS_COFINS_EFD;
    property SimplesCodigoAcesso: String  read FSIMPLES_CODIGO_ACESSO write FSIMPLES_CODIGO_ACESSO;
    property SimplesTabela: String  read FSIMPLES_TABELA write FSIMPLES_TABELA;
    property SimplesAtividade: String  read FSIMPLES_ATIVIDADE write FSIMPLES_ATIVIDADE;
    property PerfilSped: String  read FPERFIL_SPED write FPERFIL_SPED;
    property ApuracaoConsolidada: String  read FAPURACAO_CONSOLIDADA write FAPURACAO_CONSOLIDADA;
    property SubstituicaoTributaria: String  read FSUBSTITUICAO_TRIBUTARIA write FSUBSTITUICAO_TRIBUTARIA;
    property FormaCalculoIss: String  read FFORMA_CALCULO_ISS write FFORMA_CALCULO_ISS;


    //Transientes



  end;

  TListaFiscalParametroVO = specialize TFPGObjectList<TFiscalParametroVO>;

implementation


initialization
  Classes.RegisterClass(TFiscalParametroVO);

finalization
  Classes.UnRegisterClass(TFiscalParametroVO);

end.
