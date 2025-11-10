{*******************************************************************************
Title: T2Ti ERP
Description:  VO  relacionado à tabela [PCP_SERVICO]

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
unit PcpServicoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, PcpServicoColaboradorVO, PcpServicoEquipamentoVO, Classes, SysUtils, FGL;

type
  TPcpServicoVO = class(TVO)
  private
    FID: Integer;
    FID_PCP_OP_DETALHE: Integer;
    FINICIO_REALIZADO: TDateTime;
    FTERMINO_REALIZADO: TDateTime;
    FHORAS_REALIZADO: Integer;
    FMINUTOS_REALIZADO: Integer;
    FSEGUNDOS_REALIZADO: Integer;
    FCUSTO_REALIZADO: Extended;
    FINICIO_PREVISTO: TDateTime;
    FTERMINO_PREVISTO: TDateTime;
    FHORAS_PREVISTO: Integer;
    FMINUTOS_PREVISTO: Integer;
    FSEGUNDOS_PREVISTO: Integer;
    FCUSTO_PREVISTO: Extended;

    FListaPcpServicoColaboradorVO: TListaPcpServicoColaboradorVO;
    FListaPcpServicoEquipamentoVO: TListaPcpServicoEquipamentoVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdPcpOpDetalhe: Integer  read FID_PCP_OP_DETALHE write FID_PCP_OP_DETALHE;
    property InicioRealizado: TDateTime  read FINICIO_REALIZADO write FINICIO_REALIZADO;
    property TerminoRealizado: TDateTime  read FTERMINO_REALIZADO write FTERMINO_REALIZADO;
    property HorasRealizado: Integer  read FHORAS_REALIZADO write FHORAS_REALIZADO;
    property MinutosRealizado: Integer  read FMINUTOS_REALIZADO write FMINUTOS_REALIZADO;
    property SegundosRealizado: Integer  read FSEGUNDOS_REALIZADO write FSEGUNDOS_REALIZADO;
    property CustoRealizado: Extended  read FCUSTO_REALIZADO write FCUSTO_REALIZADO;
    property InicioPrevisto: TDateTime  read FINICIO_PREVISTO write FINICIO_PREVISTO;
    property TerminoPrevisto: TDateTime  read FTERMINO_PREVISTO write FTERMINO_PREVISTO;
    property HorasPrevisto: Integer  read FHORAS_PREVISTO write FHORAS_PREVISTO;
    property MinutosPrevisto: Integer  read FMINUTOS_PREVISTO write FMINUTOS_PREVISTO;
    property SegundosPrevisto: Integer  read FSEGUNDOS_PREVISTO write FSEGUNDOS_PREVISTO;
    property CustoPrevisto: Extended  read FCUSTO_PREVISTO write FCUSTO_PREVISTO;

    property ListaPcpColabradorVO: TListaPcpServicoColaboradorVO read FListaPcpServicoColaboradorVO write FListaPcpServicoColaboradorVO;
    property ListaPcpServicoEquipamentoVO: TListaPcpServicoEquipamentoVO read FListaPcpServicoEquipamentoVO write FListaPcpServicoEquipamentoVO;


  end;

  TListaPcpServicoVO = specialize TFPGObjectList<TPcpServicoVO>;

implementation


{ TPcpServicoVO }

constructor TPcpServicoVO.Create;
begin
  inherited;
  FListaPcpServicoColaboradorVO := TListaPcpServicoColaboradorVO.Create;
  FListaPcpServicoEquipamentoVO := TListaPcpServicoEquipamentoVO.Create;

end;

destructor TPcpServicoVO.Destroy;
begin
  if Assigned(FListaPcpServicoColaboradorVO) then
    FreeAndNil(FListaPcpServicoColaboradorVO);
  if Assigned(FListaPcpServicoEquipamentoVO) then
    FreeAndNil(FListaPcpServicoEquipamentoVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TPcpServicoVO);

finalization
  Classes.UnRegisterClass(TPcpServicoVO);

end.
