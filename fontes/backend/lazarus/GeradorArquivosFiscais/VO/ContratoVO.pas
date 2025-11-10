{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTRATO] 
                                                                                
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
unit ContratoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ContratoHistFaturamentoVO, ContratoHistoricoReajusteVO, ContratoPrevFaturamentoVO,
  ContabilContaVO, TipoContratoVO, ContratoSolicitacaoServicoVO;

type
  TContratoVO = class(TVO)
  private
    FID: Integer;
    FID_SOLICITACAO_SERVICO: Integer;
    FID_TIPO_CONTRATO: Integer;
    FNUMERO: String;
    FNOME: String;
    FDESCRICAO: String;
    FDATA_CADASTRO: TDateTime;
    FDATA_INICIO_VIGENCIA: TDateTime;
    FDATA_FIM_VIGENCIA: TDateTime;
    FDIA_FATURAMENTO: String;
    FVALOR: Extended;
    FQUANTIDADE_PARCELAS: Integer;
    FINTERVALO_ENTRE_PARCELAS: Integer;
    FOBSERVACAO: String;
    FCLASSIFICACAO_CONTABIL_CONTA: String;

    //Transientes
    FArquivo: String;
    FTipoArquivo: String;

    FContabilContaClassificacao: String;
    FTipoContratoNome: String;
    FContratoSolicitacaoServicoDescricao: String;

    FContabilContaVO: TContabilContaVO;
    FTipoContratoVO: TTipoContratoVO;
    FContratoSolicitacaoServicoVO: TContratoSolicitacaoServicoVO;

    FListaContratoHistFaturamentoVO: TListaContratoHistFaturamentoVO;
    FListaContratoHistoricoReajusteVO: TListaContratoHistoricoReajusteVO;
    FListaContratoPrevFaturamentoVO: TListaContratoPrevFaturamentoVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdSolicitacaoServico: Integer  read FID_SOLICITACAO_SERVICO write FID_SOLICITACAO_SERVICO;
    property ContratoSolicitacaoServicoDescricao: String read FContratoSolicitacaoServicoDescricao write FContratoSolicitacaoServicoDescricao;

    property IdTipoContrato: Integer  read FID_TIPO_CONTRATO write FID_TIPO_CONTRATO;
    property TipoContratoNome: String read FTipoContratoNome write FTipoContratoNome;

    property Numero: String  read FNUMERO write FNUMERO;
    property Nome: String  read FNOME write FNOME;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    property DataInicioVigencia: TDateTime  read FDATA_INICIO_VIGENCIA write FDATA_INICIO_VIGENCIA;
    property DataFimVigencia: TDateTime  read FDATA_FIM_VIGENCIA write FDATA_FIM_VIGENCIA;
    property DiaFaturamento: String  read FDIA_FATURAMENTO write FDIA_FATURAMENTO;
    property Valor: Extended  read FVALOR write FVALOR;
    property QuantidadeParcelas: Integer  read FQUANTIDADE_PARCELAS write FQUANTIDADE_PARCELAS;
    property IntervaloEntreParcelas: Integer  read FINTERVALO_ENTRE_PARCELAS write FINTERVALO_ENTRE_PARCELAS;
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;
    property ClassificacaoContabilConta: String  read FCLASSIFICACAO_CONTABIL_CONTA write FCLASSIFICACAO_CONTABIL_CONTA;


    //Transientes
    property Arquivo: String read FArquivo write FArquivo;
    property TipoArquivo: String read FTipoArquivo write FTipoArquivo;


    property ContabilContaVO: TContabilContaVO read FContabilContaVO write FContabilContaVO;

    property TipoContratoVO: TTipoContratoVO read FTipoContratoVO write FTipoContratoVO;

    property ContratoSolicitacaoServicoVO: TContratoSolicitacaoServicoVO read FContratoSolicitacaoServicoVO write FContratoSolicitacaoServicoVO;


    property ListaContratoHistFaturamentoVO: TListaContratoHistFaturamentoVO read FListaContratoHistFaturamentoVO write FListaContratoHistFaturamentoVO;

    property ListaContratoHistoricoReajusteVO: TListaContratoHistoricoReajusteVO read FListaContratoHistoricoReajusteVO write FListaContratoHistoricoReajusteVO;

    property ListaContratoPrevFaturamentoVO: TListaContratoPrevFaturamentoVO read FListaContratoPrevFaturamentoVO write FListaContratoPrevFaturamentoVO;


  end;

  TListaContratoVO = specialize TFPGObjectList<TContratoVO>;

implementation

constructor TContratoVO.Create;
begin
  inherited;

  FContabilContaVO := TContabilContaVO.Create;
  FTipoContratoVO := TTipoContratoVO.Create;
  FContratoSolicitacaoServicoVO := TContratoSolicitacaoServicoVO.Create;

  FListaContratoHistFaturamentoVO := TListaContratoHistFaturamentoVO.Create;
  FListaContratoHistoricoReajusteVO := TListaContratoHistoricoReajusteVO.Create;
  FListaContratoPrevFaturamentoVO := TListaContratoPrevFaturamentoVO.Create;
end;

destructor TContratoVO.Destroy;
begin
  FreeAndNil(FContabilContaVO);
  FreeAndNil(FTipoContratoVO);
  FreeAndNil(FContratoSolicitacaoServicoVO);

  FreeAndNil(FListaContratoHistFaturamentoVO);
  FreeAndNil(FListaContratoHistoricoReajusteVO);
  FreeAndNil(FListaContratoPrevFaturamentoVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TContratoVO);

finalization
  Classes.UnRegisterClass(TContratoVO);

end.
