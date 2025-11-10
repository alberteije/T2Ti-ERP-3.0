{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VENDA_ROMANEIO_ENTREGA] 
                                                                                
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
unit VendaRomaneioEntregaVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ViewPessoaColaboradorVO;

type
  TVendaRomaneioEntregaVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FDESCRICAO: String;
    FDATA_EMISSAO: TDateTime;
    FDATA_PREVISTA: TDateTime;
    FDATA_SAIDA: TDateTime;
    FSITUACAO: String;
    FDATA_ENCERRAMENTO: TDateTime;
    FOBSERVACAO: String;

    //Transientes
    FVendasVinculadas: String; //Vai subir apenas os IDs separados por pipes "|"

    FColaboradorPessoaNome: String;

    FColaboradorVO: TViewPessoaColaboradorVO;


  published 
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    property ColaboradorPessoaNome: String read FColaboradorPessoaNome write FColaboradorPessoaNome;

    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    property DataPrevista: TDateTime  read FDATA_PREVISTA write FDATA_PREVISTA;
    property DataSaida: TDateTime  read FDATA_SAIDA write FDATA_SAIDA;
    property Situacao: String  read FSITUACAO write FSITUACAO;
    property DataEncerramento: TDateTime  read FDATA_ENCERRAMENTO write FDATA_ENCERRAMENTO;
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;


    //Transientes
    property VendasVinculadas: String  read FVendasVinculadas write FVendasVinculadas;

    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;


  end;

  TListaVendaRomaneioEntregaVO = specialize TFPGObjectList<TVendaRomaneioEntregaVO>;

implementation

constructor TVendaRomaneioEntregaVO.Create;
begin
  inherited;

  FColaboradorVO := TViewPessoaColaboradorVO.Create;
end;

destructor TVendaRomaneioEntregaVO.Destroy;
begin
  FreeAndNil(FColaboradorVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TVendaRomaneioEntregaVO);

finalization
  Classes.UnRegisterClass(TVendaRomaneioEntregaVO);

end.
