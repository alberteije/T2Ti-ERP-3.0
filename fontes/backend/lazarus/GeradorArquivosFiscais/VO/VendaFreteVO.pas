{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VENDA_FRETE] 
                                                                                
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
unit VendaFreteVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ViewPessoaTransportadoraVO, VendaCabecalhoVO;

type
  TVendaFreteVO = class(TVO)
  private
    FID: Integer;
    FID_TRANSPORTADORA: Integer;
    FID_VENDA_CABECALHO: Integer;
    FCONHECIMENTO: Integer;
    FRESPONSAVEL: String;
    FPLACA: String;
    FUF_PLACA: String;
    FSELO_FISCAL: Integer;
    FQUANTIDADE_VOLUME: Extended;
    FMARCA_VOLUME: String;
    FESPECIE_VOLUME: String;
    FPESO_BRUTO: Extended;
    FPESO_LIQUIDO: Extended;

    //Transientes
    FTransportadoraNome: String;
    FVendaCabecalhoNumeroFatura: Integer;

    FTransportadoraVO: TViewPessoaTransportadoraVO;
    FVendaCabecalhoVO: TVendaCabecalhoVO;


  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdTransportadora: Integer  read FID_TRANSPORTADORA write FID_TRANSPORTADORA;
    property TransportadoraNome: String read FTransportadoraNome write FTransportadoraNome;

    property IdVendaCabecalho: Integer  read FID_VENDA_CABECALHO write FID_VENDA_CABECALHO;
    property VendaCabecalhoNumeroFatura: Integer read FVendaCabecalhoNumeroFatura write FVendaCabecalhoNumeroFatura;

    property Conhecimento: Integer  read FCONHECIMENTO write FCONHECIMENTO;
    property Responsavel: String  read FRESPONSAVEL write FRESPONSAVEL;
    property Placa: String  read FPLACA write FPLACA;
    property UfPlaca: String  read FUF_PLACA write FUF_PLACA;
    property SeloFiscal: Integer  read FSELO_FISCAL write FSELO_FISCAL;
    property QuantidadeVolume: Extended  read FQUANTIDADE_VOLUME write FQUANTIDADE_VOLUME;
    property MarcaVolume: String  read FMARCA_VOLUME write FMARCA_VOLUME;
    property EspecieVolume: String  read FESPECIE_VOLUME write FESPECIE_VOLUME;
    property PesoBruto: Extended  read FPESO_BRUTO write FPESO_BRUTO;
    property PesoLiquido: Extended  read FPESO_LIQUIDO write FPESO_LIQUIDO;


    //Transientes
    property TransportadoraVO: TViewPessoaTransportadoraVO read FTransportadoraVO write FTransportadoraVO;

    property VendaCabecalhoVO: TVendaCabecalhoVO read FVendaCabecalhoVO write FVendaCabecalhoVO;



  end;

  TListaVendaFreteVO = specialize TFPGObjectList<TVendaFreteVO>;

implementation

constructor TVendaFreteVO.Create;
begin
  inherited;

  FTransportadoraVO := TViewPessoaTransportadoraVO.Create;
  FVendaCabecalhoVO := TVendaCabecalhoVO.Create;
end;

destructor TVendaFreteVO.Destroy;
begin
  FreeAndNil(FTransportadoraVO);
  FreeAndNil(FVendaCabecalhoVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TVendaFreteVO);

finalization
  Classes.UnRegisterClass(TVendaFreteVO);

end.
