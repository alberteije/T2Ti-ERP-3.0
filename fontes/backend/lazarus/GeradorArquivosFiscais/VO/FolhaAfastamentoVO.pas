{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FOLHA_AFASTAMENTO] 
                                                                                
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
unit FolhaAfastamentoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ViewPessoaColaboradorVO, FolhaTipoAfastamentoVO;

type
  TFolhaAfastamentoVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FID_FOLHA_TIPO_AFASTAMENTO: Integer;
    FDATA_INICIO: TDateTime;
    FDATA_FIM: TDateTime;
    FDIAS_AFASTADO: Integer;

    //Transientes
    FColaboradorNome: String;
    FTipoAfastamentoNome: String;

    FColaboradorVO: TViewPessoaColaboradorVO;
    FFolhaTipoAfastamentoVO: TFolhaTipoAfastamentoVO;


  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    property ColaboradorNome: String read FColaboradorNome write FColaboradorNome;

    property IdFolhaTipoAfastamento: Integer  read FID_FOLHA_TIPO_AFASTAMENTO write FID_FOLHA_TIPO_AFASTAMENTO;
    property TipoAfastamentoNome: String read FTipoAfastamentoNome write FTipoAfastamentoNome;

    property DataInicio: TDateTime  read FDATA_INICIO write FDATA_INICIO;
    property DataFim: TDateTime  read FDATA_FIM write FDATA_FIM;
    property DiasAfastado: Integer  read FDIAS_AFASTADO write FDIAS_AFASTADO;


    //Transientes
    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;

    property FolhaTipoAfastamentoVO: TFolhaTipoAfastamentoVO read FFolhaTipoAfastamentoVO write FFolhaTipoAfastamentoVO;


  end;

  TListaFolhaAfastamentoVO = specialize TFPGObjectList<TFolhaAfastamentoVO>;

implementation

constructor TFolhaAfastamentoVO.Create;
begin
  inherited;

  FColaboradorVO := TViewPessoaColaboradorVO.Create;
  FFolhaTipoAfastamentoVO := TFolhaTipoAfastamentoVO.Create;
end;

destructor TFolhaAfastamentoVO.Destroy;
begin
  FreeAndNil(FColaboradorVO);
  FreeAndNil(FFolhaTipoAfastamentoVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TFolhaAfastamentoVO);

finalization
  Classes.UnRegisterClass(TFolhaAfastamentoVO);

end.
