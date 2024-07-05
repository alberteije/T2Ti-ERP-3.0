{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTABIL_PARAMETRO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
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
unit ContabilParametro;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TContabilParametro = class(TModelBase)
  private
    FId: Integer;
    FMascara: string;
    FNiveis: Integer;
    FInformarContaPor: string;
    FCompartilhaPlanoConta: string;
    FCompartilhaHistoricos: string;
    FAlteraLancamentoOutro: string;
    FHistoricoObrigatorio: string;
    FPermiteLancamentoZerado: string;
    FGeraInformativoSped: string;
    FSpedFormaEscritDiario: string;
    FSpedNomeLivroDiario: string;
    FAssinaturaDireita: string;
    FAssinaturaEsquerda: string;
    FContaAtivo: string;
    FContaPassivo: string;
    FContaPatrimonioLiquido: string;
    FContaDepreciacaoAcumulada: string;
    FContaCapitalSocial: string;
    FContaResultadoExercicio: string;
    FContaPrejuizoAcumulado: string;
    FContaLucroAcumulado: string;
    FContaTituloPagar: string;
    FContaTituloReceber: string;
    FContaJurosPassivo: string;
    FContaJurosAtivo: string;
    FContaDescontoObtido: string;
    FContaDescontoConcedido: string;
    FContaCmv: string;
    FContaVenda: string;
    FContaVendaServico: string;
    FContaEstoque: string;
    FContaApuraResultado: string;
    FContaJurosApropriar: string;
    FIdHistPadraoResultado: Integer;
    FIdHistPadraoLucro: Integer;
    FIdHistPadraoPrejuizo: Integer;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('MASCARA')]
		[MVCNameAsAttribute('mascara')]
		property Mascara: string read FMascara write FMascara;
    [MVCColumnAttribute('NIVEIS')]
		[MVCNameAsAttribute('niveis')]
		property Niveis: Integer read FNiveis write FNiveis;
    [MVCColumnAttribute('INFORMAR_CONTA_POR')]
		[MVCNameAsAttribute('informarContaPor')]
		property InformarContaPor: string read FInformarContaPor write FInformarContaPor;
    [MVCColumnAttribute('COMPARTILHA_PLANO_CONTA')]
		[MVCNameAsAttribute('compartilhaPlanoConta')]
		property CompartilhaPlanoConta: string read FCompartilhaPlanoConta write FCompartilhaPlanoConta;
    [MVCColumnAttribute('COMPARTILHA_HISTORICOS')]
		[MVCNameAsAttribute('compartilhaHistoricos')]
		property CompartilhaHistoricos: string read FCompartilhaHistoricos write FCompartilhaHistoricos;
    [MVCColumnAttribute('ALTERA_LANCAMENTO_OUTRO')]
		[MVCNameAsAttribute('alteraLancamentoOutro')]
		property AlteraLancamentoOutro: string read FAlteraLancamentoOutro write FAlteraLancamentoOutro;
    [MVCColumnAttribute('HISTORICO_OBRIGATORIO')]
		[MVCNameAsAttribute('historicoObrigatorio')]
		property HistoricoObrigatorio: string read FHistoricoObrigatorio write FHistoricoObrigatorio;
    [MVCColumnAttribute('PERMITE_LANCAMENTO_ZERADO')]
		[MVCNameAsAttribute('permiteLancamentoZerado')]
		property PermiteLancamentoZerado: string read FPermiteLancamentoZerado write FPermiteLancamentoZerado;
    [MVCColumnAttribute('GERA_INFORMATIVO_SPED')]
		[MVCNameAsAttribute('geraInformativoSped')]
		property GeraInformativoSped: string read FGeraInformativoSped write FGeraInformativoSped;
    [MVCColumnAttribute('SPED_FORMA_ESCRIT_DIARIO')]
		[MVCNameAsAttribute('spedFormaEscritDiario')]
		property SpedFormaEscritDiario: string read FSpedFormaEscritDiario write FSpedFormaEscritDiario;
    [MVCColumnAttribute('SPED_NOME_LIVRO_DIARIO')]
		[MVCNameAsAttribute('spedNomeLivroDiario')]
		property SpedNomeLivroDiario: string read FSpedNomeLivroDiario write FSpedNomeLivroDiario;
    [MVCColumnAttribute('ASSINATURA_DIREITA')]
		[MVCNameAsAttribute('assinaturaDireita')]
		property AssinaturaDireita: string read FAssinaturaDireita write FAssinaturaDireita;
    [MVCColumnAttribute('ASSINATURA_ESQUERDA')]
		[MVCNameAsAttribute('assinaturaEsquerda')]
		property AssinaturaEsquerda: string read FAssinaturaEsquerda write FAssinaturaEsquerda;
    [MVCColumnAttribute('CONTA_ATIVO')]
		[MVCNameAsAttribute('contaAtivo')]
		property ContaAtivo: string read FContaAtivo write FContaAtivo;
    [MVCColumnAttribute('CONTA_PASSIVO')]
		[MVCNameAsAttribute('contaPassivo')]
		property ContaPassivo: string read FContaPassivo write FContaPassivo;
    [MVCColumnAttribute('CONTA_PATRIMONIO_LIQUIDO')]
		[MVCNameAsAttribute('contaPatrimonioLiquido')]
		property ContaPatrimonioLiquido: string read FContaPatrimonioLiquido write FContaPatrimonioLiquido;
    [MVCColumnAttribute('CONTA_DEPRECIACAO_ACUMULADA')]
		[MVCNameAsAttribute('contaDepreciacaoAcumulada')]
		property ContaDepreciacaoAcumulada: string read FContaDepreciacaoAcumulada write FContaDepreciacaoAcumulada;
    [MVCColumnAttribute('CONTA_CAPITAL_SOCIAL')]
		[MVCNameAsAttribute('contaCapitalSocial')]
		property ContaCapitalSocial: string read FContaCapitalSocial write FContaCapitalSocial;
    [MVCColumnAttribute('CONTA_RESULTADO_EXERCICIO')]
		[MVCNameAsAttribute('contaResultadoExercicio')]
		property ContaResultadoExercicio: string read FContaResultadoExercicio write FContaResultadoExercicio;
    [MVCColumnAttribute('CONTA_PREJUIZO_ACUMULADO')]
		[MVCNameAsAttribute('contaPrejuizoAcumulado')]
		property ContaPrejuizoAcumulado: string read FContaPrejuizoAcumulado write FContaPrejuizoAcumulado;
    [MVCColumnAttribute('CONTA_LUCRO_ACUMULADO')]
		[MVCNameAsAttribute('contaLucroAcumulado')]
		property ContaLucroAcumulado: string read FContaLucroAcumulado write FContaLucroAcumulado;
    [MVCColumnAttribute('CONTA_TITULO_PAGAR')]
		[MVCNameAsAttribute('contaTituloPagar')]
		property ContaTituloPagar: string read FContaTituloPagar write FContaTituloPagar;
    [MVCColumnAttribute('CONTA_TITULO_RECEBER')]
		[MVCNameAsAttribute('contaTituloReceber')]
		property ContaTituloReceber: string read FContaTituloReceber write FContaTituloReceber;
    [MVCColumnAttribute('CONTA_JUROS_PASSIVO')]
		[MVCNameAsAttribute('contaJurosPassivo')]
		property ContaJurosPassivo: string read FContaJurosPassivo write FContaJurosPassivo;
    [MVCColumnAttribute('CONTA_JUROS_ATIVO')]
		[MVCNameAsAttribute('contaJurosAtivo')]
		property ContaJurosAtivo: string read FContaJurosAtivo write FContaJurosAtivo;
    [MVCColumnAttribute('CONTA_DESCONTO_OBTIDO')]
		[MVCNameAsAttribute('contaDescontoObtido')]
		property ContaDescontoObtido: string read FContaDescontoObtido write FContaDescontoObtido;
    [MVCColumnAttribute('CONTA_DESCONTO_CONCEDIDO')]
		[MVCNameAsAttribute('contaDescontoConcedido')]
		property ContaDescontoConcedido: string read FContaDescontoConcedido write FContaDescontoConcedido;
    [MVCColumnAttribute('CONTA_CMV')]
		[MVCNameAsAttribute('contaCmv')]
		property ContaCmv: string read FContaCmv write FContaCmv;
    [MVCColumnAttribute('CONTA_VENDA')]
		[MVCNameAsAttribute('contaVenda')]
		property ContaVenda: string read FContaVenda write FContaVenda;
    [MVCColumnAttribute('CONTA_VENDA_SERVICO')]
		[MVCNameAsAttribute('contaVendaServico')]
		property ContaVendaServico: string read FContaVendaServico write FContaVendaServico;
    [MVCColumnAttribute('CONTA_ESTOQUE')]
		[MVCNameAsAttribute('contaEstoque')]
		property ContaEstoque: string read FContaEstoque write FContaEstoque;
    [MVCColumnAttribute('CONTA_APURA_RESULTADO')]
		[MVCNameAsAttribute('contaApuraResultado')]
		property ContaApuraResultado: string read FContaApuraResultado write FContaApuraResultado;
    [MVCColumnAttribute('CONTA_JUROS_APROPRIAR')]
		[MVCNameAsAttribute('contaJurosApropriar')]
		property ContaJurosApropriar: string read FContaJurosApropriar write FContaJurosApropriar;
    [MVCColumnAttribute('ID_HIST_PADRAO_RESULTADO')]
		[MVCNameAsAttribute('idHistPadraoResultado')]
		property IdHistPadraoResultado: Integer read FIdHistPadraoResultado write FIdHistPadraoResultado;
    [MVCColumnAttribute('ID_HIST_PADRAO_LUCRO')]
		[MVCNameAsAttribute('idHistPadraoLucro')]
		property IdHistPadraoLucro: Integer read FIdHistPadraoLucro write FIdHistPadraoLucro;
    [MVCColumnAttribute('ID_HIST_PADRAO_PREJUIZO')]
		[MVCNameAsAttribute('idHistPadraoPrejuizo')]
		property IdHistPadraoPrejuizo: Integer read FIdHistPadraoPrejuizo write FIdHistPadraoPrejuizo;
      
  end;

implementation

{ TContabilParametro }



end.