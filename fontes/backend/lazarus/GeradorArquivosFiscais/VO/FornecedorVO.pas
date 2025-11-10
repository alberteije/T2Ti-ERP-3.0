{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FORNECEDOR] 
                                                                                
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
unit FornecedorVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TFornecedorVO = class(TVO)
  private
    FID: Integer;
    FID_PESSOA: Integer;
    FID_ATIVIDADE_FOR_CLI: Integer;
    FID_SITUACAO_FOR_CLI: Integer;
    FDESDE: TDateTime;
    FOPTANTE_SIMPLES_NACIONAL: String;
    FLOCALIZACAO: String;
    FDATA_CADASTRO: TDateTime;
    FSOFRE_RETENCAO: String;
    FCHEQUE_NOMINAL_A: String;
    FOBSERVACAO: String;
    FCONTA_REMETENTE: String;
    FPRAZO_MEDIO_ENTREGA: Integer;
    FGERA_FATURAMENTO: String;
    FNUM_DIAS_PRIMEIRO_VENCIMENTO: Integer;
    FNUM_DIAS_INTERVALO: Integer;
    FQUANTIDADE_PARCELAS: Integer;
    FCLASSIFICACAO_CONTABIL_CONTA: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    property IdAtividadeForCli: Integer  read FID_ATIVIDADE_FOR_CLI write FID_ATIVIDADE_FOR_CLI;
    property IdSituacaoForCli: Integer  read FID_SITUACAO_FOR_CLI write FID_SITUACAO_FOR_CLI;
    property Desde: TDateTime  read FDESDE write FDESDE;
    property OptanteSimplesNacional: String  read FOPTANTE_SIMPLES_NACIONAL write FOPTANTE_SIMPLES_NACIONAL;
    property Localizacao: String  read FLOCALIZACAO write FLOCALIZACAO;
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    property SofreRetencao: String  read FSOFRE_RETENCAO write FSOFRE_RETENCAO;
    property ChequeNominalA: String  read FCHEQUE_NOMINAL_A write FCHEQUE_NOMINAL_A;
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;
    property ContaRemetente: String  read FCONTA_REMETENTE write FCONTA_REMETENTE;
    property PrazoMedioEntrega: Integer  read FPRAZO_MEDIO_ENTREGA write FPRAZO_MEDIO_ENTREGA;
    property GeraFaturamento: String  read FGERA_FATURAMENTO write FGERA_FATURAMENTO;
    property NumDiasPrimeiroVencimento: Integer  read FNUM_DIAS_PRIMEIRO_VENCIMENTO write FNUM_DIAS_PRIMEIRO_VENCIMENTO;
    property NumDiasIntervalo: Integer  read FNUM_DIAS_INTERVALO write FNUM_DIAS_INTERVALO;
    property QuantidadeParcelas: Integer  read FQUANTIDADE_PARCELAS write FQUANTIDADE_PARCELAS;
    property ClassificacaoContabilConta: String  read FCLASSIFICACAO_CONTABIL_CONTA write FCLASSIFICACAO_CONTABIL_CONTA;


    //Transientes



  end;

  TListaFornecedorVO = specialize TFPGObjectList<TFornecedorVO>;

implementation


initialization
  Classes.RegisterClass(TFornecedorVO);

finalization
  Classes.UnRegisterClass(TFornecedorVO);

end.
