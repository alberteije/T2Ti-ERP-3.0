{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FOLHA_PPP] 
                                                                                
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
unit FolhaPppVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ViewPessoaColaboradorVO, FolhaPppCatVO, FolhaPppAtividadeVO, FolhaPppFatorRiscoVO,
  FolhaPppExameMedicoVO;

type
  TFolhaPppVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FOBSERVACAO: String;

    //Transientes
    FColaboradorNome: String;

    FColaboradorVO: TViewPessoaColaboradorVO;

    FListaFolhaPppCatVO: TListaFolhaPppCatVO;
    FListaFolhaPppAtividadeVO: TListaFolhaPppAtividadeVO;
    FListaFolhaPppFatorRiscoVO: TListaFolhaPppFatorRiscoVO;
    FListaFolhaPppExameMedicoVO: TListaFolhaPppExameMedicoVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    property ColaboradorNome: String read FColaboradorNome write FColaboradorNome;

    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;


    //Transientes
    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;

    property ListaFolhaPppCatVO: TListaFolhaPppCatVO read FListaFolhaPppCatVO write FListaFolhaPppCatVO;
    property ListaFolhaPppAtividadeVO: TListaFolhaPppAtividadeVO read FListaFolhaPppAtividadeVO write FListaFolhaPppAtividadeVO;
    property ListaFolhaPppFatorRiscoVO: TListaFolhaPppFatorRiscoVO read FListaFolhaPppFatorRiscoVO write FListaFolhaPppFatorRiscoVO;
    property ListaFolhaPppExameMedicoVO: TListaFolhaPppExameMedicoVO read FListaFolhaPppExameMedicoVO write FListaFolhaPppExameMedicoVO;


  end;

  TListaFolhaPppVO = specialize TFPGObjectList<TFolhaPppVO>;

implementation

constructor TFolhaPppVO.Create;
begin
  inherited;

  FColaboradorVO := TViewPessoaColaboradorVO.Create;

  FListaFolhaPppCatVO := TListaFolhaPppCatVO.Create;
  FListaFolhaPppAtividadeVO := TListaFolhaPppAtividadeVO.Create;
  FListaFolhaPppFatorRiscoVO := TListaFolhaPppFatorRiscoVO.Create;
  FListaFolhaPppExameMedicoVO := TListaFolhaPppExameMedicoVO.Create;
end;

destructor TFolhaPppVO.Destroy;
begin
  FreeAndNil(FColaboradorVO);

  FreeAndNil(FListaFolhaPppCatVO);
  FreeAndNil(FListaFolhaPppAtividadeVO);
  FreeAndNil(FListaFolhaPppFatorRiscoVO);
  FreeAndNil(FListaFolhaPppExameMedicoVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TFolhaPppVO);

finalization
  Classes.UnRegisterClass(TFolhaPppVO);

end.
