{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTRATO_SOLICITACAO_SERVICO] 
                                                                                
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
unit ContratoSolicitacaoServicoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ViewPessoaColaboradorVO, ViewPessoaFornecedorVO, ViewPessoaClienteVO,
  SetorVO, ContratoTipoServicoVO;

type
  TContratoSolicitacaoServicoVO = class(TVO)
  private
    FID: Integer;
    FID_FORNECEDOR: Integer;
    FID_CLIENTE: Integer;
    FID_SETOR: Integer;
    FID_COLABORADOR: Integer;
    FID_CONTRATO_TIPO_SERVICO: Integer;
    FDATA_SOLICITACAO: TDateTime;
    FDATA_DESEJADA_INICIO: TDateTime;
    FURGENTE: String;
    FSTATUS_SOLICITACAO: String;
    FDESCRICAO: String;

    //Transientes
    FFornecedorPessoaNome: String;
    FClientePessoaNome: String;
    FSetorNome: String;
    FColaboradorPessoaNome: String;
    FContratoTipoServicoNome: String;

    FFornecedorVO: TViewPessoaFornecedorVO;
    FClienteVO: TViewPessoaClienteVO;
    FSetorVO: TSetorVO;
    FColaboradorVO: TViewPessoaColaboradorVO;
    FContratoTipoServicoVO: TContratoTipoServicoVO;



  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdFornecedor: Integer  read FID_FORNECEDOR write FID_FORNECEDOR;
    property FornecedorPessoaNome: String read FFornecedorPessoaNome write FFornecedorPessoaNome;

    property IdCliente: Integer  read FID_CLIENTE write FID_CLIENTE;
    property ClientePessoaNome: String read FClientePessoaNome write FClientePessoaNome;

    property IdSetor: Integer  read FID_SETOR write FID_SETOR;
    property SetorNome: String read FSetorNome write FSetorNome;

    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    property ColaboradorPessoaNome: String read FColaboradorPessoaNome write FColaboradorPessoaNome;

    property IdContratoTipoServico: Integer  read FID_CONTRATO_TIPO_SERVICO write FID_CONTRATO_TIPO_SERVICO;
    property ContratoTipoServicoNome: String read FContratoTipoServicoNome write FContratoTipoServicoNome;

    property DataSolicitacao: TDateTime  read FDATA_SOLICITACAO write FDATA_SOLICITACAO;
    property DataDesejadaInicio: TDateTime  read FDATA_DESEJADA_INICIO write FDATA_DESEJADA_INICIO;
    property Urgente: String  read FURGENTE write FURGENTE;
    property StatusSolicitacao: String  read FSTATUS_SOLICITACAO write FSTATUS_SOLICITACAO;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;


    //Transientes
    property FornecedorVO: TViewPessoaFornecedorVO read FFornecedorVO write FFornecedorVO;

    property ClienteVO: TViewPessoaClienteVO read FClienteVO write FClienteVO;

    property SetorVO: TSetorVO read FSetorVO write FSetorVO;

    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;

    property ContratoTipoServicoVO: TContratoTipoServicoVO read FContratoTipoServicoVO write FContratoTipoServicoVO;


  end;

  TListaContratoSolicitacaoServicoVO = specialize TFPGObjectList<TContratoSolicitacaoServicoVO>;

implementation

constructor TContratoSolicitacaoServicoVO.Create;
begin
  inherited;

  FFornecedorVO := TViewPessoaFornecedorVO.Create;
  FColaboradorVO := TViewPessoaColaboradorVO.Create;
  FSetorVO := TSetorVO.Create;
  FContratoTipoServicoVO := TContratoTipoServicoVO.Create;
  FClienteVO := TViewPessoaClienteVO.Create;
end;

destructor TContratoSolicitacaoServicoVO.Destroy;
begin
  FreeAndNil(FFornecedorVO);
  FreeAndNil(FColaboradorVO);
  FreeAndNil(FSetorVO);
  FreeAndNil(FContratoTipoServicoVO);
  FreeAndNil(FClienteVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TContratoSolicitacaoServicoVO);

finalization
  Classes.UnRegisterClass(TContratoSolicitacaoServicoVO);

end.
