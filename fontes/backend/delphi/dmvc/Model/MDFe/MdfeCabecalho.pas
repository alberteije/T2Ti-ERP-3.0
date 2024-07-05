{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [MDFE_CABECALHO] 
                                                                                
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
unit MdfeCabecalho;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TMdfeCabecalho = class(TModelBase)
  private
    FId: Integer;
    FUf: Integer;
    FTipoAmbiente: Integer;
    FTipoEmitente: Integer;
    FTipoTransportadora: Integer;
    FModelo: string;
    FSerie: string;
    FNumeroMdfe: string;
    FCodigoNumerico: string;
    FChaveAcesso: string;
    FDigitoVerificador: Integer;
    FModal: Integer;
    FDataHoraEmissao: TDateTime;
    FTipoEmissao: Integer;
    FProcessoEmissao: Integer;
    FVersaoProcessoEmissao: string;
    FUfInicio: string;
    FUfFim: string;
    FDataHoraPrevisaoViagem: TDateTime;
    FQuantidadeTotalCte: Integer;
    FQuantidadeTotalNfe: Integer;
    FQuantidadeTotalMdfe: Integer;
    FCodigoUnidadeMedida: string;
    FPesoBrutoCarga: Extended;
    FValorCarga: Extended;
    FNumeroProtocolo: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('UF')]
		[MVCNameAsAttribute('uf')]
		property Uf: Integer read FUf write FUf;
    [MVCColumnAttribute('TIPO_AMBIENTE')]
		[MVCNameAsAttribute('tipoAmbiente')]
		property TipoAmbiente: Integer read FTipoAmbiente write FTipoAmbiente;
    [MVCColumnAttribute('TIPO_EMITENTE')]
		[MVCNameAsAttribute('tipoEmitente')]
		property TipoEmitente: Integer read FTipoEmitente write FTipoEmitente;
    [MVCColumnAttribute('TIPO_TRANSPORTADORA')]
		[MVCNameAsAttribute('tipoTransportadora')]
		property TipoTransportadora: Integer read FTipoTransportadora write FTipoTransportadora;
    [MVCColumnAttribute('MODELO')]
		[MVCNameAsAttribute('modelo')]
		property Modelo: string read FModelo write FModelo;
    [MVCColumnAttribute('SERIE')]
		[MVCNameAsAttribute('serie')]
		property Serie: string read FSerie write FSerie;
    [MVCColumnAttribute('NUMERO_MDFE')]
		[MVCNameAsAttribute('numeroMdfe')]
		property NumeroMdfe: string read FNumeroMdfe write FNumeroMdfe;
    [MVCColumnAttribute('CODIGO_NUMERICO')]
		[MVCNameAsAttribute('codigoNumerico')]
		property CodigoNumerico: string read FCodigoNumerico write FCodigoNumerico;
    [MVCColumnAttribute('CHAVE_ACESSO')]
		[MVCNameAsAttribute('chaveAcesso')]
		property ChaveAcesso: string read FChaveAcesso write FChaveAcesso;
    [MVCColumnAttribute('DIGITO_VERIFICADOR')]
		[MVCNameAsAttribute('digitoVerificador')]
		property DigitoVerificador: Integer read FDigitoVerificador write FDigitoVerificador;
    [MVCColumnAttribute('MODAL')]
		[MVCNameAsAttribute('modal')]
		property Modal: Integer read FModal write FModal;
    [MVCColumnAttribute('DATA_HORA_EMISSAO')]
		[MVCNameAsAttribute('dataHoraEmissao')]
		property DataHoraEmissao: TDateTime read FDataHoraEmissao write FDataHoraEmissao;
    [MVCColumnAttribute('TIPO_EMISSAO')]
		[MVCNameAsAttribute('tipoEmissao')]
		property TipoEmissao: Integer read FTipoEmissao write FTipoEmissao;
    [MVCColumnAttribute('PROCESSO_EMISSAO')]
		[MVCNameAsAttribute('processoEmissao')]
		property ProcessoEmissao: Integer read FProcessoEmissao write FProcessoEmissao;
    [MVCColumnAttribute('VERSAO_PROCESSO_EMISSAO')]
		[MVCNameAsAttribute('versaoProcessoEmissao')]
		property VersaoProcessoEmissao: string read FVersaoProcessoEmissao write FVersaoProcessoEmissao;
    [MVCColumnAttribute('UF_INICIO')]
		[MVCNameAsAttribute('ufInicio')]
		property UfInicio: string read FUfInicio write FUfInicio;
    [MVCColumnAttribute('UF_FIM')]
		[MVCNameAsAttribute('ufFim')]
		property UfFim: string read FUfFim write FUfFim;
    [MVCColumnAttribute('DATA_HORA_PREVISAO_VIAGEM')]
		[MVCNameAsAttribute('dataHoraPrevisaoViagem')]
		property DataHoraPrevisaoViagem: TDateTime read FDataHoraPrevisaoViagem write FDataHoraPrevisaoViagem;
    [MVCColumnAttribute('QUANTIDADE_TOTAL_CTE')]
		[MVCNameAsAttribute('quantidadeTotalCte')]
		property QuantidadeTotalCte: Integer read FQuantidadeTotalCte write FQuantidadeTotalCte;
    [MVCColumnAttribute('QUANTIDADE_TOTAL_NFE')]
		[MVCNameAsAttribute('quantidadeTotalNfe')]
		property QuantidadeTotalNfe: Integer read FQuantidadeTotalNfe write FQuantidadeTotalNfe;
    [MVCColumnAttribute('QUANTIDADE_TOTAL_MDFE')]
		[MVCNameAsAttribute('quantidadeTotalMdfe')]
		property QuantidadeTotalMdfe: Integer read FQuantidadeTotalMdfe write FQuantidadeTotalMdfe;
    [MVCColumnAttribute('CODIGO_UNIDADE_MEDIDA')]
		[MVCNameAsAttribute('codigoUnidadeMedida')]
		property CodigoUnidadeMedida: string read FCodigoUnidadeMedida write FCodigoUnidadeMedida;
    [MVCColumnAttribute('PESO_BRUTO_CARGA')]
		[MVCNameAsAttribute('pesoBrutoCarga')]
		property PesoBrutoCarga: Extended read FPesoBrutoCarga write FPesoBrutoCarga;
    [MVCColumnAttribute('VALOR_CARGA')]
		[MVCNameAsAttribute('valorCarga')]
		property ValorCarga: Extended read FValorCarga write FValorCarga;
    [MVCColumnAttribute('NUMERO_PROTOCOLO')]
		[MVCNameAsAttribute('numeroProtocolo')]
		property NumeroProtocolo: string read FNumeroProtocolo write FNumeroProtocolo;
      
  end;

implementation

{ TMdfeCabecalho }



end.