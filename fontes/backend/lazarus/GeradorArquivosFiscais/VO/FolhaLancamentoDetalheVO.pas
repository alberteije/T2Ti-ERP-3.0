{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FOLHA_LANCAMENTO_DETALHE] 
                                                                                
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
unit FolhaLancamentoDetalheVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  FolhaEventoVO;

type
  TFolhaLancamentoDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_FOLHA_EVENTO: Integer;
    FID_FOLHA_LANCAMENTO_CABECALHO: Integer;
    FORIGEM: Extended;
    FPROVENTO: Extended;
    FDESCONTO: Extended;

    //Transientes
    FFolhaEventoNome: String;

    FFolhaEventoVO: TFolhaEventoVO;


  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdFolhaEvento: Integer  read FID_FOLHA_EVENTO write FID_FOLHA_EVENTO;
    property FolhaEventoNome: String read FFolhaEventoNome write FFolhaEventoNome;

    property IdFolhaLancamentoCabecalho: Integer  read FID_FOLHA_LANCAMENTO_CABECALHO write FID_FOLHA_LANCAMENTO_CABECALHO;
    property Origem: Extended  read FORIGEM write FORIGEM;
    property Provento: Extended  read FPROVENTO write FPROVENTO;
    property Desconto: Extended  read FDESCONTO write FDESCONTO;


    //Transientes
    property FolhaEventoVO: TFolhaEventoVO read FFolhaEventoVO write FFolhaEventoVO;



  end;

  TListaFolhaLancamentoDetalheVO = specialize TFPGObjectList<TFolhaLancamentoDetalheVO>;

implementation

constructor TFolhaLancamentoDetalheVO.Create;
begin
  inherited;

  FFolhaEventoVO := TFolhaEventoVO.Create;
end;

destructor TFolhaLancamentoDetalheVO.Destroy;
begin
  FreeAndNil(FFolhaEventoVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TFolhaLancamentoDetalheVO);

finalization
  Classes.UnRegisterClass(TFolhaLancamentoDetalheVO);

end.
