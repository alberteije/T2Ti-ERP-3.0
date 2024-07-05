{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_PARAMETRO] 
                                                                                
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
unit FolhaParametro;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TFolhaParametro = class(TModelBase)
  private
    FId: Integer;
    FCompetencia: string;
    FContribuiPis: string;
    FAliquotaPis: Extended;
    FDiscriminarDsr: string;
    FDiaPagamento: string;
    FCalculoProporcionalidade: string;
    FDescontarFaltas13: string;
    FPagarAdicionais13: string;
    FPagarEstagiarios13: string;
    FMesAdiantamento13: string;
    FPercentualAdiantam13: Extended;
    FFeriasDescontarFaltas: string;
    FFeriasPagarAdicionais: string;
    FFeriasAdiantar13: string;
    FFeriasPagarEstagiarios: string;
    FFeriasCalcJustaCausa: string;
    FFeriasMovimentoMensal: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('COMPETENCIA')]
		[MVCNameAsAttribute('competencia')]
		property Competencia: string read FCompetencia write FCompetencia;
    [MVCColumnAttribute('CONTRIBUI_PIS')]
		[MVCNameAsAttribute('contribuiPis')]
		property ContribuiPis: string read FContribuiPis write FContribuiPis;
    [MVCColumnAttribute('ALIQUOTA_PIS')]
		[MVCNameAsAttribute('aliquotaPis')]
		property AliquotaPis: Extended read FAliquotaPis write FAliquotaPis;
    [MVCColumnAttribute('DISCRIMINAR_DSR')]
		[MVCNameAsAttribute('discriminarDsr')]
		property DiscriminarDsr: string read FDiscriminarDsr write FDiscriminarDsr;
    [MVCColumnAttribute('DIA_PAGAMENTO')]
		[MVCNameAsAttribute('diaPagamento')]
		property DiaPagamento: string read FDiaPagamento write FDiaPagamento;
    [MVCColumnAttribute('CALCULO_PROPORCIONALIDADE')]
		[MVCNameAsAttribute('calculoProporcionalidade')]
		property CalculoProporcionalidade: string read FCalculoProporcionalidade write FCalculoProporcionalidade;
    [MVCColumnAttribute('DESCONTAR_FALTAS_13')]
		[MVCNameAsAttribute('descontarFaltas13')]
		property DescontarFaltas13: string read FDescontarFaltas13 write FDescontarFaltas13;
    [MVCColumnAttribute('PAGAR_ADICIONAIS_13')]
		[MVCNameAsAttribute('pagarAdicionais13')]
		property PagarAdicionais13: string read FPagarAdicionais13 write FPagarAdicionais13;
    [MVCColumnAttribute('PAGAR_ESTAGIARIOS_13')]
		[MVCNameAsAttribute('pagarEstagiarios13')]
		property PagarEstagiarios13: string read FPagarEstagiarios13 write FPagarEstagiarios13;
    [MVCColumnAttribute('MES_ADIANTAMENTO_13')]
		[MVCNameAsAttribute('mesAdiantamento13')]
		property MesAdiantamento13: string read FMesAdiantamento13 write FMesAdiantamento13;
    [MVCColumnAttribute('PERCENTUAL_ADIANTAM_13')]
		[MVCNameAsAttribute('percentualAdiantam13')]
		property PercentualAdiantam13: Extended read FPercentualAdiantam13 write FPercentualAdiantam13;
    [MVCColumnAttribute('FERIAS_DESCONTAR_FALTAS')]
		[MVCNameAsAttribute('feriasDescontarFaltas')]
		property FeriasDescontarFaltas: string read FFeriasDescontarFaltas write FFeriasDescontarFaltas;
    [MVCColumnAttribute('FERIAS_PAGAR_ADICIONAIS')]
		[MVCNameAsAttribute('feriasPagarAdicionais')]
		property FeriasPagarAdicionais: string read FFeriasPagarAdicionais write FFeriasPagarAdicionais;
    [MVCColumnAttribute('FERIAS_ADIANTAR_13')]
		[MVCNameAsAttribute('feriasAdiantar13')]
		property FeriasAdiantar13: string read FFeriasAdiantar13 write FFeriasAdiantar13;
    [MVCColumnAttribute('FERIAS_PAGAR_ESTAGIARIOS')]
		[MVCNameAsAttribute('feriasPagarEstagiarios')]
		property FeriasPagarEstagiarios: string read FFeriasPagarEstagiarios write FFeriasPagarEstagiarios;
    [MVCColumnAttribute('FERIAS_CALC_JUSTA_CAUSA')]
		[MVCNameAsAttribute('feriasCalcJustaCausa')]
		property FeriasCalcJustaCausa: string read FFeriasCalcJustaCausa write FFeriasCalcJustaCausa;
    [MVCColumnAttribute('FERIAS_MOVIMENTO_MENSAL')]
		[MVCNameAsAttribute('feriasMovimentoMensal')]
		property FeriasMovimentoMensal: string read FFeriasMovimentoMensal write FFeriasMovimentoMensal;
      
  end;

implementation

{ TFolhaParametro }



end.