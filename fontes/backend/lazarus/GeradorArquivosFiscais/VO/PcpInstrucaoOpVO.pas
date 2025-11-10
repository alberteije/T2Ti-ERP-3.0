{*******************************************************************************
Title: T2Ti ERP
Description:  VO  relacionado à tabela [PCP_INSTRUCAO_OP]

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
unit PcpInstrucaoOpVO;

{$mode objfpc}{$H+}

interface

uses
  VO, PcpInstrucaoVO, Classes, SysUtils, FGL;

type
  TPcpInstrucaoOpVO = class(TVO)
  private
    FID: Integer;
    FID_PCP_INSTRUCAO: Integer;
    FID_PCP_OP_CABECALHO: Integer;

    FInstrucaoCodigo: string;
    FInstrucaoDescricao: string;

    FInstrucao: TPcpInstrucaoVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdPcpInstrucao: Integer  read FID_PCP_INSTRUCAO write FID_PCP_INSTRUCAO;
    property InstrucaoCodigo: string  read FInstrucaoCodigo write FInstrucaoCodigo ;
    property InstrucaoDescricao: string  read FInstrucaoDescricao write FInstrucaoDescricao;
    property IdPcpOpCabecalho: Integer  read FID_PCP_OP_CABECALHO write FID_PCP_OP_CABECALHO;

    property Instrucao: TPcpInstrucaoVO read FInstrucao write FInstrucao;

  end;

  TListaPcpInstrucaoOpVO = specialize TFPGObjectList<TPcpInstrucaoOpVO>;

implementation

{ TPcpInstrucaoOpVO }

constructor TPcpInstrucaoOpVO.Create;
begin
  inherited;
  FInstrucao := TPcpInstrucaoVO.Create;
end;

destructor TPcpInstrucaoOpVO.Destroy;
begin
  FreeAndNil(FInstrucao);
  inherited;
end;

initialization
  Classes.RegisterClass(TPcpInstrucaoOpVO);

finalization
  Classes.UnRegisterClass(TPcpInstrucaoOpVO);

end.

