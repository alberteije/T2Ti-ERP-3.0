{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTABIL_PARAMETRO] 
                                                                                
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
unit ContabilParametroVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TContabilParametroVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FMASCARA: String;
    FNIVEIS: Integer;
    FINFORMAR_CONTA_POR: String;
    FCOMPARTILHA_PLANO_CONTA: String;
    FCOMPARTILHA_HISTORICOS: String;
    FALTERA_LANCAMENTO_OUTRO: String;
    FHISTORICO_OBRIGATORIO: String;
    FPERMITE_LANCAMENTO_ZERADO: String;
    FGERA_INFORMATIVO_SPED: String;
    FSPED_FORMA_ESCRIT_DIARIO: String;
    FSPED_NOME_LIVRO_DIARIO: String;
    FASSINATURA_DIREITA: String;
    FASSINATURA_ESQUERDA: String;
    FCONTA_ATIVO: String;
    FCONTA_PASSIVO: String;
    FCONTA_PATRIMONIO_LIQUIDO: String;
    FCONTA_DEPRECIACAO_ACUMULADA: String;
    FCONTA_CAPITAL_SOCIAL: String;
    FCONTA_RESULTADO_EXERCICIO: String;
    FCONTA_PREJUIZO_ACUMULADO: String;
    FCONTA_LUCRO_ACUMULADO: String;
    FCONTA_TITULO_PAGAR: String;
    FCONTA_TITULO_RECEBER: String;
    FCONTA_JUROS_PASSIVO: String;
    FCONTA_JUROS_ATIVO: String;
    FCONTA_DESCONTO_OBTIDO: String;
    FCONTA_DESCONTO_CONCEDIDO: String;
    FCONTA_CMV: String;
    FCONTA_VENDA: String;
    FCONTA_VENDA_SERVICO: String;
    FCONTA_ESTOQUE: String;
    FCONTA_APURA_RESULTADO: String;
    FCONTA_JUROS_APROPRIAR: String;
    FID_HIST_PADRAO_RESULTADO: Integer;
    FID_HIST_PADRAO_LUCRO: Integer;
    FID_HIST_PADRAO_PREJUIZO: Integer;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property Mascara: String  read FMASCARA write FMASCARA;
    property Niveis: Integer  read FNIVEIS write FNIVEIS;
    property InformarContaPor: String  read FINFORMAR_CONTA_POR write FINFORMAR_CONTA_POR;
    property CompartilhaPlanoConta: String  read FCOMPARTILHA_PLANO_CONTA write FCOMPARTILHA_PLANO_CONTA;
    property CompartilhaHistoricos: String  read FCOMPARTILHA_HISTORICOS write FCOMPARTILHA_HISTORICOS;
    property AlteraLancamentoOutro: String  read FALTERA_LANCAMENTO_OUTRO write FALTERA_LANCAMENTO_OUTRO;
    property HistoricoObrigatorio: String  read FHISTORICO_OBRIGATORIO write FHISTORICO_OBRIGATORIO;
    property PermiteLancamentoZerado: String  read FPERMITE_LANCAMENTO_ZERADO write FPERMITE_LANCAMENTO_ZERADO;
    property GeraInformativoSped: String  read FGERA_INFORMATIVO_SPED write FGERA_INFORMATIVO_SPED;
    property SpedFormaEscritDiario: String  read FSPED_FORMA_ESCRIT_DIARIO write FSPED_FORMA_ESCRIT_DIARIO;
    property SpedNomeLivroDiario: String  read FSPED_NOME_LIVRO_DIARIO write FSPED_NOME_LIVRO_DIARIO;
    property AssinaturaDireita: String  read FASSINATURA_DIREITA write FASSINATURA_DIREITA;
    property AssinaturaEsquerda: String  read FASSINATURA_ESQUERDA write FASSINATURA_ESQUERDA;
    property ContaAtivo: String  read FCONTA_ATIVO write FCONTA_ATIVO;
    property ContaPassivo: String  read FCONTA_PASSIVO write FCONTA_PASSIVO;
    property ContaPatrimonioLiquido: String  read FCONTA_PATRIMONIO_LIQUIDO write FCONTA_PATRIMONIO_LIQUIDO;
    property ContaDepreciacaoAcumulada: String  read FCONTA_DEPRECIACAO_ACUMULADA write FCONTA_DEPRECIACAO_ACUMULADA;
    property ContaCapitalSocial: String  read FCONTA_CAPITAL_SOCIAL write FCONTA_CAPITAL_SOCIAL;
    property ContaResultadoExercicio: String  read FCONTA_RESULTADO_EXERCICIO write FCONTA_RESULTADO_EXERCICIO;
    property ContaPrejuizoAcumulado: String  read FCONTA_PREJUIZO_ACUMULADO write FCONTA_PREJUIZO_ACUMULADO;
    property ContaLucroAcumulado: String  read FCONTA_LUCRO_ACUMULADO write FCONTA_LUCRO_ACUMULADO;
    property ContaTituloPagar: String  read FCONTA_TITULO_PAGAR write FCONTA_TITULO_PAGAR;
    property ContaTituloReceber: String  read FCONTA_TITULO_RECEBER write FCONTA_TITULO_RECEBER;
    property ContaJurosPassivo: String  read FCONTA_JUROS_PASSIVO write FCONTA_JUROS_PASSIVO;
    property ContaJurosAtivo: String  read FCONTA_JUROS_ATIVO write FCONTA_JUROS_ATIVO;
    property ContaDescontoObtido: String  read FCONTA_DESCONTO_OBTIDO write FCONTA_DESCONTO_OBTIDO;
    property ContaDescontoConcedido: String  read FCONTA_DESCONTO_CONCEDIDO write FCONTA_DESCONTO_CONCEDIDO;
    property ContaCmv: String  read FCONTA_CMV write FCONTA_CMV;
    property ContaVenda: String  read FCONTA_VENDA write FCONTA_VENDA;
    property ContaVendaServico: String  read FCONTA_VENDA_SERVICO write FCONTA_VENDA_SERVICO;
    property ContaEstoque: String  read FCONTA_ESTOQUE write FCONTA_ESTOQUE;
    property ContaApuraResultado: String  read FCONTA_APURA_RESULTADO write FCONTA_APURA_RESULTADO;
    property ContaJurosApropriar: String  read FCONTA_JUROS_APROPRIAR write FCONTA_JUROS_APROPRIAR;
    property IdHistPadraoResultado: Integer  read FID_HIST_PADRAO_RESULTADO write FID_HIST_PADRAO_RESULTADO;
    property IdHistPadraoLucro: Integer  read FID_HIST_PADRAO_LUCRO write FID_HIST_PADRAO_LUCRO;
    property IdHistPadraoPrejuizo: Integer  read FID_HIST_PADRAO_PREJUIZO write FID_HIST_PADRAO_PREJUIZO;


    //Transientes



  end;

  TListaContabilParametroVO = specialize TFPGObjectList<TContabilParametroVO>;

implementation


initialization
  Classes.RegisterClass(TContabilParametroVO);

finalization
  Classes.UnRegisterClass(TContabilParametroVO);

end.
