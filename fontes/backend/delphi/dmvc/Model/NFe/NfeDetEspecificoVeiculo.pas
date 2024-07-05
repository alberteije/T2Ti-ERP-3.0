{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DET_ESPECIFICO_VEICULO] 
                                                                                
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
unit NfeDetEspecificoVeiculo;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeDetEspecificoVeiculo = class(TModelBase)
  private
    FId: Integer;
    FIdNfeDetalhe: Integer;
    FTipoOperacao: string;
    FChassi: string;
    FCor: string;
    FDescricaoCor: string;
    FPotenciaMotor: string;
    FCilindradas: string;
    FPesoLiquido: string;
    FPesoBruto: string;
    FNumeroSerie: string;
    FTipoCombustivel: string;
    FNumeroMotor: string;
    FCapacidadeMaximaTracao: string;
    FDistanciaEixos: string;
    FAnoModelo: string;
    FAnoFabricacao: string;
    FTipoPintura: string;
    FTipoVeiculo: string;
    FEspecieVeiculo: string;
    FCondicaoVin: string;
    FCondicaoVeiculo: string;
    FCodigoMarcaModelo: string;
    FCodigoCorDenatran: string;
    FLotacaoMaxima: Integer;
    FRestricao: string;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_DETALHE')]
		[MVCNameAsAttribute('idNfeDetalhe')]
		property IdNfeDetalhe: Integer read FIdNfeDetalhe write FIdNfeDetalhe;
    [MVCColumnAttribute('TIPO_OPERACAO')]
		[MVCNameAsAttribute('tipoOperacao')]
		property TipoOperacao: string read FTipoOperacao write FTipoOperacao;
    [MVCColumnAttribute('CHASSI')]
		[MVCNameAsAttribute('chassi')]
		property Chassi: string read FChassi write FChassi;
    [MVCColumnAttribute('COR')]
		[MVCNameAsAttribute('cor')]
		property Cor: string read FCor write FCor;
    [MVCColumnAttribute('DESCRICAO_COR')]
		[MVCNameAsAttribute('descricaoCor')]
		property DescricaoCor: string read FDescricaoCor write FDescricaoCor;
    [MVCColumnAttribute('POTENCIA_MOTOR')]
		[MVCNameAsAttribute('potenciaMotor')]
		property PotenciaMotor: string read FPotenciaMotor write FPotenciaMotor;
    [MVCColumnAttribute('CILINDRADAS')]
		[MVCNameAsAttribute('cilindradas')]
		property Cilindradas: string read FCilindradas write FCilindradas;
    [MVCColumnAttribute('PESO_LIQUIDO')]
		[MVCNameAsAttribute('pesoLiquido')]
		property PesoLiquido: string read FPesoLiquido write FPesoLiquido;
    [MVCColumnAttribute('PESO_BRUTO')]
		[MVCNameAsAttribute('pesoBruto')]
		property PesoBruto: string read FPesoBruto write FPesoBruto;
    [MVCColumnAttribute('NUMERO_SERIE')]
		[MVCNameAsAttribute('numeroSerie')]
		property NumeroSerie: string read FNumeroSerie write FNumeroSerie;
    [MVCColumnAttribute('TIPO_COMBUSTIVEL')]
		[MVCNameAsAttribute('tipoCombustivel')]
		property TipoCombustivel: string read FTipoCombustivel write FTipoCombustivel;
    [MVCColumnAttribute('NUMERO_MOTOR')]
		[MVCNameAsAttribute('numeroMotor')]
		property NumeroMotor: string read FNumeroMotor write FNumeroMotor;
    [MVCColumnAttribute('CAPACIDADE_MAXIMA_TRACAO')]
		[MVCNameAsAttribute('capacidadeMaximaTracao')]
		property CapacidadeMaximaTracao: string read FCapacidadeMaximaTracao write FCapacidadeMaximaTracao;
    [MVCColumnAttribute('DISTANCIA_EIXOS')]
		[MVCNameAsAttribute('distanciaEixos')]
		property DistanciaEixos: string read FDistanciaEixos write FDistanciaEixos;
    [MVCColumnAttribute('ANO_MODELO')]
		[MVCNameAsAttribute('anoModelo')]
		property AnoModelo: string read FAnoModelo write FAnoModelo;
    [MVCColumnAttribute('ANO_FABRICACAO')]
		[MVCNameAsAttribute('anoFabricacao')]
		property AnoFabricacao: string read FAnoFabricacao write FAnoFabricacao;
    [MVCColumnAttribute('TIPO_PINTURA')]
		[MVCNameAsAttribute('tipoPintura')]
		property TipoPintura: string read FTipoPintura write FTipoPintura;
    [MVCColumnAttribute('TIPO_VEICULO')]
		[MVCNameAsAttribute('tipoVeiculo')]
		property TipoVeiculo: string read FTipoVeiculo write FTipoVeiculo;
    [MVCColumnAttribute('ESPECIE_VEICULO')]
		[MVCNameAsAttribute('especieVeiculo')]
		property EspecieVeiculo: string read FEspecieVeiculo write FEspecieVeiculo;
    [MVCColumnAttribute('CONDICAO_VIN')]
		[MVCNameAsAttribute('condicaoVin')]
		property CondicaoVin: string read FCondicaoVin write FCondicaoVin;
    [MVCColumnAttribute('CONDICAO_VEICULO')]
		[MVCNameAsAttribute('condicaoVeiculo')]
		property CondicaoVeiculo: string read FCondicaoVeiculo write FCondicaoVeiculo;
    [MVCColumnAttribute('CODIGO_MARCA_MODELO')]
		[MVCNameAsAttribute('codigoMarcaModelo')]
		property CodigoMarcaModelo: string read FCodigoMarcaModelo write FCodigoMarcaModelo;
    [MVCColumnAttribute('CODIGO_COR_DENATRAN')]
		[MVCNameAsAttribute('codigoCorDenatran')]
		property CodigoCorDenatran: string read FCodigoCorDenatran write FCodigoCorDenatran;
    [MVCColumnAttribute('LOTACAO_MAXIMA')]
		[MVCNameAsAttribute('lotacaoMaxima')]
		property LotacaoMaxima: Integer read FLotacaoMaxima write FLotacaoMaxima;
    [MVCColumnAttribute('RESTRICAO')]
		[MVCNameAsAttribute('restricao')]
		property Restricao: string read FRestricao write FRestricao;
      
  end;

implementation

{ TNfeDetEspecificoVeiculo }





end.