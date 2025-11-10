{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_TRANSPORTE] 
                                                                                
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
unit NfeTransporteVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,

  NfeTransporteReboqueVO, NfeTransporteVolumeVO;

type
  TNfeTransporteVO = class(TVO)
  private
    FID: Integer;
    FID_TRANSPORTADORA: Integer;
    FID_NFE_CABECALHO: Integer;
    FMODALIDADE_FRETE: Integer;
    FCPF_CNPJ: String;
    FNOME: String;
    FINSCRICAO_ESTADUAL: String;
    FEMPRESA_ENDERECO: String;
    FNOME_MUNICIPIO: String;
    FUF: String;
    FVALOR_SERVICO: Extended;
    FVALOR_BC_RETENCAO_ICMS: Extended;
    FALIQUOTA_RETENCAO_ICMS: Extended;
    FVALOR_ICMS_RETIDO: Extended;
    FCFOP: Integer;
    FMUNICIPIO: Integer;
    FPLACA_VEICULO: String;
    FUF_VEICULO: String;
    FRNTC_VEICULO: String;
    FVAGAO: String;
    FBALSA: String;

    // Grupo X - X22
    FListaNfeTransporteReboqueVO: TListaNfeTransporteReboqueVO; //0:5
    // Grupo X - X26
    FListaNfeTransporteVolumeVO: TListaNfeTransporteVolumeVO; //0:5000

  published 
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdTransportadora: Integer  read FID_TRANSPORTADORA write FID_TRANSPORTADORA;
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    property ModalidadeFrete: Integer  read FMODALIDADE_FRETE write FMODALIDADE_FRETE;
    property CpfCnpj: String  read FCPF_CNPJ write FCPF_CNPJ;
    property Nome: String  read FNOME write FNOME;
    property InscricaoEstadual: String  read FINSCRICAO_ESTADUAL write FINSCRICAO_ESTADUAL;
    property EmpresaEndereco: String  read FEMPRESA_ENDERECO write FEMPRESA_ENDERECO;
    property NomeMunicipio: String  read FNOME_MUNICIPIO write FNOME_MUNICIPIO;
    property Uf: String  read FUF write FUF;
    property ValorServico: Extended  read FVALOR_SERVICO write FVALOR_SERVICO;
    property ValorBcRetencaoIcms: Extended  read FVALOR_BC_RETENCAO_ICMS write FVALOR_BC_RETENCAO_ICMS;
    property AliquotaRetencaoIcms: Extended  read FALIQUOTA_RETENCAO_ICMS write FALIQUOTA_RETENCAO_ICMS;
    property ValorIcmsRetido: Extended  read FVALOR_ICMS_RETIDO write FVALOR_ICMS_RETIDO;
    property Cfop: Integer  read FCFOP write FCFOP;
    property Municipio: Integer  read FMUNICIPIO write FMUNICIPIO;
    property PlacaVeiculo: String  read FPLACA_VEICULO write FPLACA_VEICULO;
    property UfVeiculo: String  read FUF_VEICULO write FUF_VEICULO;
    property RntcVeiculo: String  read FRNTC_VEICULO write FRNTC_VEICULO;
    property Vagao: String  read FVAGAO write FVAGAO;
    property Balsa: String  read FBALSA write FBALSA;

    property ListaNfeTransporteReboqueVO: TListaNfeTransporteReboqueVO read FListaNfeTransporteReboqueVO write FListaNfeTransporteReboqueVO;
    property ListaNfeTransporteVolumeVO: TListaNfeTransporteVolumeVO read FListaNfeTransporteVolumeVO write FListaNfeTransporteVolumeVO;
  end;

  TListaNfeTransporteVO = specialize TFPGObjectList<TNfeTransporteVO>;

implementation

constructor TNfeTransporteVO.Create;
begin
  inherited;
  FListaNfeTransporteReboqueVO := TListaNfeTransporteReboqueVO.Create;
  FListaNfeTransporteVolumeVO := TListaNfeTransporteVolumeVO.Create;
end;

destructor TNfeTransporteVO.Destroy;
begin
  FreeAndNil(FListaNfeTransporteReboqueVO);
  FreeAndNil(FListaNfeTransporteVolumeVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TNfeTransporteVO);

finalization
  Classes.UnRegisterClass(TNfeTransporteVO);

end.
