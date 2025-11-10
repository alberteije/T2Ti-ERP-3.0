{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_DET_ESPECIFICO_VEICULO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2014 T2Ti.COM                                          
                                                                                
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
unit NfeDetEspecificoVeiculoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TNfeDetEspecificoVeiculoVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FTIPO_OPERACAO: String;
    FCHASSI: String;
    FCOR: String;
    FDESCRICAO_COR: String;
    FPOTENCIA_MOTOR: String;
    FCILINDRADAS: String;
    FPESO_LIQUIDO: String;
    FPESO_BRUTO: String;
    FNUMERO_SERIE: String;
    FTIPO_COMBUSTIVEL: String;
    FNUMERO_MOTOR: String;
    FCAPACIDADE_MAXIMA_TRACAO: String;
    FDISTANCIA_EIXOS: String;
    FANO_MODELO: String;
    FANO_FABRICACAO: String;
    FTIPO_PINTURA: String;
    FTIPO_VEICULO: String;
    FESPECIE_VEICULO: String;
    FCONDICAO_VIN: String;
    FCONDICAO_VEICULO: String;
    FCODIGO_MARCA_MODELO: String;
    FCODIGO_COR: String;
    FLOTACAO: Integer;
    FRESTRICAO: String;

  published 
    property Id: Integer  read FID write FID;
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    property TipoOperacao: String  read FTIPO_OPERACAO write FTIPO_OPERACAO;
    property Chassi: String  read FCHASSI write FCHASSI;
    property Cor: String  read FCOR write FCOR;
    property DescricaoCor: String  read FDESCRICAO_COR write FDESCRICAO_COR;
    property PotenciaMotor: String  read FPOTENCIA_MOTOR write FPOTENCIA_MOTOR;
    property Cilindradas: String  read FCILINDRADAS write FCILINDRADAS;
    property PesoLiquido: String  read FPESO_LIQUIDO write FPESO_LIQUIDO;
    property PesoBruto: String  read FPESO_BRUTO write FPESO_BRUTO;
    property NumeroSerie: String  read FNUMERO_SERIE write FNUMERO_SERIE;
    property TipoCombustivel: String  read FTIPO_COMBUSTIVEL write FTIPO_COMBUSTIVEL;
    property NumeroMotor: String  read FNUMERO_MOTOR write FNUMERO_MOTOR;
    property CapacidadeMaximaTracao: String  read FCAPACIDADE_MAXIMA_TRACAO write FCAPACIDADE_MAXIMA_TRACAO;
    property DistanciaEixos: String  read FDISTANCIA_EIXOS write FDISTANCIA_EIXOS;
    property AnoModelo: String  read FANO_MODELO write FANO_MODELO;
    property AnoFabricacao: String  read FANO_FABRICACAO write FANO_FABRICACAO;
    property TipoPintura: String  read FTIPO_PINTURA write FTIPO_PINTURA;
    property TipoVeiculo: String  read FTIPO_VEICULO write FTIPO_VEICULO;
    property EspecieVeiculo: String  read FESPECIE_VEICULO write FESPECIE_VEICULO;
    property CondicaoVin: String  read FCONDICAO_VIN write FCONDICAO_VIN;
    property CondicaoVeiculo: String  read FCONDICAO_VEICULO write FCONDICAO_VEICULO;
    property CodigoMarcaModelo: String  read FCODIGO_MARCA_MODELO write FCODIGO_MARCA_MODELO;
    property CodigoCor: String  read FCODIGO_COR write FCODIGO_COR;
    property Lotacao: Integer  read FLOTACAO write FLOTACAO;
    property Restricao: String  read FRESTRICAO write FRESTRICAO;

  end;

  TListaNfeDetEspecificoVeiculoVO = specialize TFPGObjectList<TNfeDetEspecificoVeiculoVO>;

implementation


initialization
  Classes.RegisterClass(TNfeDetEspecificoVeiculoVO);

finalization
  Classes.UnRegisterClass(TNfeDetEspecificoVeiculoVO);

end.
