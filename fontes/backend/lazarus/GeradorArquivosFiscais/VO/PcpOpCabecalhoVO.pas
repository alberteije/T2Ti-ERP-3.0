{*******************************************************************************
Title: T2Ti ERP
Description:  VO  relacionado à tabela [PCP_OP_CABECALHO]

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
unit PcpOpCabecalhoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, PcpOpDetalheVO, PcpInstrucaoOpVO, Classes, SysUtils, FGL;

type
  TPcpOpCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FINICIO: TDateTime;
    FPREVISAO_ENTREGA: TDateTime;
    FTERMINO: TDateTime;
    FCUSTO_TOTAL_PREVISTO: Extended;
    FCUSTO_TOTAL_REALIZADO: Extended;
    FPORCENTO_VENDA: Extended;
    FPORCENTO_ESTOQUE: Extended;

    FListaPcpOpDetalheVO: TListaPcpOpDetalheVO;
    FListaInstrucaoOpVO: TListaPcpInstrucaoOpVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property Inicio: TDateTime  read FINICIO write FINICIO;
    property PrevisaoEntrega: TDateTime  read FPREVISAO_ENTREGA write FPREVISAO_ENTREGA;
    property Termino: TDateTime  read FTERMINO write FTERMINO;
    property CustoTotalPrevisto: Extended  read FCUSTO_TOTAL_PREVISTO write FCUSTO_TOTAL_PREVISTO;
    property CustoTotalRealizado: Extended  read FCUSTO_TOTAL_REALIZADO write FCUSTO_TOTAL_REALIZADO;
    property PorcentoVenda: Extended  read FPORCENTO_VENDA write FPORCENTO_VENDA;
    property PorcentoEstoque: Extended  read FPORCENTO_ESTOQUE write FPORCENTO_ESTOQUE;

    property ListaPcpOpDetalheVO: TListaPcpOpDetalheVO read FListaPcpOpDetalheVO write FListaPcpOpDetalheVO;

    property ListaPcpInstrucaoOpVO: TListaPcpInstrucaoOpVO read FListaInstrucaoOpVO write FListaInstrucaoOpVO;

  end;

  TListaPcpOpCabecalhoVO = specialize TFPGObjectList<TPcpOpCabecalhoVO>;

implementation

{ TPcpOpCabecalhoVO }

constructor TPcpOpCabecalhoVO.Create;
begin
  inherited;
  FListaPcpOpDetalheVO := TListaPcpOpDetalheVO.Create;
  FListaInstrucaoOpVO := TListaPcpInstrucaoOpVO.Create;
end;

destructor TPcpOpCabecalhoVO.Destroy;
begin
  FreeAndNil(FListaPcpOpDetalheVO);
  FreeAndNil(FListaInstrucaoOpVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TPcpOpCabecalhoVO);

finalization
  Classes.UnRegisterClass(TPcpOpCabecalhoVO);

end.
