{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NATUREZA_FINANCEIRA] 
                                                                                
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
unit NaturezaFinanceiraVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  PlanoNaturezaFinanceiraVO, ContabilContaVO;

type
  TNaturezaFinanceiraVO = class(TVO)
  private
    FID: Integer;
    FID_PLANO_NATUREZA_FINANCEIRA: Integer;
    FID_CONTABIL_CONTA: Integer;
    FCLASSIFICACAO: String;
    FDESCRICAO: String;
    FTIPO: String;
    FAPLICACAO: String;
    FAPARECE_A_PAGAR: String;
    FAPARECE_A_RECEBER: String;

    //Transientes
    FPlanoNaturezaFinanceiraNome: String;
    FContabilContaClassificacao: String;

    FPlanoNaturezaFinanceiraVO: TPlanoNaturezaFinanceiraVO;
    FContabilContaVO:  TContabilContaVO;

  published 
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdPlanoNaturezaFinanceira: Integer  read FID_PLANO_NATUREZA_FINANCEIRA write FID_PLANO_NATUREZA_FINANCEIRA;
    property PlanoNaturezaFinanceiraNome: String read FPlanoNaturezaFinanceiraNome write FPlanoNaturezaFinanceiraNome;

    property IdContabilConta: Integer  read FID_CONTABIL_CONTA write FID_CONTABIL_CONTA;
    property ContabilContaClassificacao: String read FContabilContaClassificacao write FContabilContaClassificacao;

    property Classificacao: String  read FCLASSIFICACAO write FCLASSIFICACAO;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property Tipo: String  read FTIPO write FTIPO;
    property Aplicacao: String  read FAPLICACAO write FAPLICACAO;
    property ApareceAPagar: String  read FAPARECE_A_PAGAR write FAPARECE_A_PAGAR;
    property ApareceAReceber: String  read FAPARECE_A_RECEBER write FAPARECE_A_RECEBER;


    //Transientes
    property PlanoNaturezaFinanceiraVO: TPlanoNaturezaFinanceiraVO read FPlanoNaturezaFinanceiraVO write FPlanoNaturezaFinanceiraVO;

    property ContabilContaVO: TContabilContaVO read FContabilContaVO write FContabilContaVO;

  end;

  TListaNaturezaFinanceiraVO = specialize TFPGObjectList<TNaturezaFinanceiraVO>;

implementation

constructor TNaturezaFinanceiraVO.Create;
begin
  inherited;

  FPlanoNaturezaFinanceiraVO := TPlanoNaturezaFinanceiraVO.Create;
  FContabilContaVO := TContabilContaVO.Create;
end;

destructor TNaturezaFinanceiraVO.Destroy;
begin
  FreeAndNil(FPlanoNaturezaFinanceiraVO);
  FreeAndNil(FContabilContaVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TNaturezaFinanceiraVO);

finalization
  Classes.UnRegisterClass(TNaturezaFinanceiraVO);

end.
