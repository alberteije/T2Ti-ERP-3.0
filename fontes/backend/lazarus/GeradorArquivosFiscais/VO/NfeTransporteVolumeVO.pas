{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_TRANSPORTE_VOLUME] 
                                                                                
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
unit NfeTransporteVolumeVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL, NfeTransporteVolumeLacreVO;

type
  TNfeTransporteVolumeVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_TRANSPORTE: Integer;
    FQUANTIDADE: Integer;
    FESPECIE: String;
    FMARCA: String;
    FNUMERACAO: String;
    FPESO_LIQUIDO: Extended;
    FPESO_BRUTO: Extended;

    // Grupo X - X33
    FListaNfeTransporteVolumeLacreVO: TListaNfeTransporteVolumeLacreVO; //0:5000

  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdNfeTransporte: Integer  read FID_NFE_TRANSPORTE write FID_NFE_TRANSPORTE;
    property Quantidade: Integer  read FQUANTIDADE write FQUANTIDADE;
    property Especie: String  read FESPECIE write FESPECIE;
    property Marca: String  read FMARCA write FMARCA;
    property Numeracao: String  read FNUMERACAO write FNUMERACAO;
    property PesoLiquido: Extended  read FPESO_LIQUIDO write FPESO_LIQUIDO;
    property PesoBruto: Extended  read FPESO_BRUTO write FPESO_BRUTO;

    property ListaNfeTransporteVolumeLacreVO: TListaNfeTransporteVolumeLacreVO read FListaNfeTransporteVolumeLacreVO write FListaNfeTransporteVolumeLacreVO;

  end;


  TListaNfeTransporteVolumeVO = specialize TFPGObjectList<TNfeTransporteVolumeVO>;

implementation

constructor TNfeTransporteVolumeVO.Create;
begin
  inherited;
  FListaNfeTransporteVolumeLacreVO := TListaNfeTransporteVolumeLacreVO.Create;
end;

destructor TNfeTransporteVolumeVO.Destroy;
begin
  FreeAndNil(FListaNfeTransporteVolumeLacreVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TNfeTransporteVolumeVO);

finalization
  Classes.UnRegisterClass(TNfeTransporteVolumeVO);

end.
