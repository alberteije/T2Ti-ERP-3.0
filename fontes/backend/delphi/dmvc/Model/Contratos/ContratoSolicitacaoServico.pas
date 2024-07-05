{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTRATO_SOLICITACAO_SERVICO] 
                                                                                
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
unit ContratoSolicitacaoServico;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TContratoSolicitacaoServico = class(TModelBase)
  private
    FId: Integer;
    FIdContratoTipoServico: Integer;
    FIdSetor: Integer;
    FIdColaborador: Integer;
    FIdCliente: Integer;
    FIdFornecedor: Integer;
    FDataSolicitacao: TDateTime;
    FDataDesejadaInicio: TDateTime;
    FUrgente: string;
    FStatusSolicitacao: string;
    FDescricao: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_CONTRATO_TIPO_SERVICO')]
		[MVCNameAsAttribute('idContratoTipoServico')]
		property IdContratoTipoServico: Integer read FIdContratoTipoServico write FIdContratoTipoServico;
    [MVCColumnAttribute('ID_SETOR')]
		[MVCNameAsAttribute('idSetor')]
		property IdSetor: Integer read FIdSetor write FIdSetor;
    [MVCColumnAttribute('ID_COLABORADOR')]
		[MVCNameAsAttribute('idColaborador')]
		property IdColaborador: Integer read FIdColaborador write FIdColaborador;
    [MVCColumnAttribute('ID_CLIENTE')]
		[MVCNameAsAttribute('idCliente')]
		property IdCliente: Integer read FIdCliente write FIdCliente;
    [MVCColumnAttribute('ID_FORNECEDOR')]
		[MVCNameAsAttribute('idFornecedor')]
		property IdFornecedor: Integer read FIdFornecedor write FIdFornecedor;
    [MVCColumnAttribute('DATA_SOLICITACAO')]
		[MVCNameAsAttribute('dataSolicitacao')]
		property DataSolicitacao: TDateTime read FDataSolicitacao write FDataSolicitacao;
    [MVCColumnAttribute('DATA_DESEJADA_INICIO')]
		[MVCNameAsAttribute('dataDesejadaInicio')]
		property DataDesejadaInicio: TDateTime read FDataDesejadaInicio write FDataDesejadaInicio;
    [MVCColumnAttribute('URGENTE')]
		[MVCNameAsAttribute('urgente')]
		property Urgente: string read FUrgente write FUrgente;
    [MVCColumnAttribute('STATUS_SOLICITACAO')]
		[MVCNameAsAttribute('statusSolicitacao')]
		property StatusSolicitacao: string read FStatusSolicitacao write FStatusSolicitacao;
    [MVCColumnAttribute('DESCRICAO')]
		[MVCNameAsAttribute('descricao')]
		property Descricao: string read FDescricao write FDescricao;
      
  end;

implementation

{ TContratoSolicitacaoServico }



end.