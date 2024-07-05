{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DET_ESPECIFICO_COMBUSTIVEL] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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
unit NfeDetEspecificoCombustivel;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeDetEspecificoCombustivel = class(TModelBase)
  private
    FId: Integer;
    FIdNfeDetalhe: Integer;
    FCodigoAnp: Integer;
    FDescricaoAnp: string;
    FPercentualGlp: Extended;
    FPercentualGasNacional: Extended;
    FPercentualGasImportado: Extended;
    FValorPartida: Extended;
    FCodif: string;
    FQuantidadeTempAmbiente: Extended;
    FUfConsumo: string;
    FCideBaseCalculo: Extended;
    FCideAliquota: Extended;
    FCideValor: Extended;
    FEncerranteBico: Integer;
    FEncerranteBomba: Integer;
    FEncerranteTanque: Integer;
    FEncerranteValorInicio: Extended;
    FEncerranteValorFim: Extended;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_DETALHE')]
		[MVCNameAsAttribute('idNfeDetalhe')]
		property IdNfeDetalhe: Integer read FIdNfeDetalhe write FIdNfeDetalhe;
    [MVCColumnAttribute('CODIGO_ANP')]
		[MVCNameAsAttribute('codigoAnp')]
		property CodigoAnp: Integer read FCodigoAnp write FCodigoAnp;
    [MVCColumnAttribute('DESCRICAO_ANP')]
		[MVCNameAsAttribute('descricaoAnp')]
		property DescricaoAnp: string read FDescricaoAnp write FDescricaoAnp;
    [MVCColumnAttribute('PERCENTUAL_GLP')]
		[MVCNameAsAttribute('percentualGlp')]
		property PercentualGlp: Extended read FPercentualGlp write FPercentualGlp;
    [MVCColumnAttribute('PERCENTUAL_GAS_NACIONAL')]
		[MVCNameAsAttribute('percentualGasNacional')]
		property PercentualGasNacional: Extended read FPercentualGasNacional write FPercentualGasNacional;
    [MVCColumnAttribute('PERCENTUAL_GAS_IMPORTADO')]
		[MVCNameAsAttribute('percentualGasImportado')]
		property PercentualGasImportado: Extended read FPercentualGasImportado write FPercentualGasImportado;
    [MVCColumnAttribute('VALOR_PARTIDA')]
		[MVCNameAsAttribute('valorPartida')]
		property ValorPartida: Extended read FValorPartida write FValorPartida;
    [MVCColumnAttribute('CODIF')]
		[MVCNameAsAttribute('codif')]
		property Codif: string read FCodif write FCodif;
    [MVCColumnAttribute('QUANTIDADE_TEMP_AMBIENTE')]
		[MVCNameAsAttribute('quantidadeTempAmbiente')]
		property QuantidadeTempAmbiente: Extended read FQuantidadeTempAmbiente write FQuantidadeTempAmbiente;
    [MVCColumnAttribute('UF_CONSUMO')]
		[MVCNameAsAttribute('ufConsumo')]
		property UfConsumo: string read FUfConsumo write FUfConsumo;
    [MVCColumnAttribute('CIDE_BASE_CALCULO')]
		[MVCNameAsAttribute('cideBaseCalculo')]
		property CideBaseCalculo: Extended read FCideBaseCalculo write FCideBaseCalculo;
    [MVCColumnAttribute('CIDE_ALIQUOTA')]
		[MVCNameAsAttribute('cideAliquota')]
		property CideAliquota: Extended read FCideAliquota write FCideAliquota;
    [MVCColumnAttribute('CIDE_VALOR')]
		[MVCNameAsAttribute('cideValor')]
		property CideValor: Extended read FCideValor write FCideValor;
    [MVCColumnAttribute('ENCERRANTE_BICO')]
		[MVCNameAsAttribute('encerranteBico')]
		property EncerranteBico: Integer read FEncerranteBico write FEncerranteBico;
    [MVCColumnAttribute('ENCERRANTE_BOMBA')]
		[MVCNameAsAttribute('encerranteBomba')]
		property EncerranteBomba: Integer read FEncerranteBomba write FEncerranteBomba;
    [MVCColumnAttribute('ENCERRANTE_TANQUE')]
		[MVCNameAsAttribute('encerranteTanque')]
		property EncerranteTanque: Integer read FEncerranteTanque write FEncerranteTanque;
    [MVCColumnAttribute('ENCERRANTE_VALOR_INICIO')]
		[MVCNameAsAttribute('encerranteValorInicio')]
		property EncerranteValorInicio: Extended read FEncerranteValorInicio write FEncerranteValorInicio;
    [MVCColumnAttribute('ENCERRANTE_VALOR_FIM')]
		[MVCNameAsAttribute('encerranteValorFim')]
		property EncerranteValorFim: Extended read FEncerranteValorFim write FEncerranteValorFim;
      
  end;

implementation

{ TNfeDetEspecificoCombustivel }





end.