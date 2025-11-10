{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [COMPRA_REQUISICAO] 
                                                                                
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
unit CompraRequisicaoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ViewPessoaColaboradorVO, CompraTipoRequisicaoVO, CompraRequisicaoDetalheVO;

type
  TCompraRequisicaoVO = class(TVO)
  private
    FID: Integer;
    FID_COMPRA_TIPO_REQUISICAO: Integer;
    FID_COLABORADOR: Integer;
    FDATA_REQUISICAO: TDateTime;
    FOBSERVACAO: String;

    //Transientes
    FColaboradorPessoaNome: String;
    FCompraTipoRequisicaoNome: String;

    FColaboradorVO: TViewPessoaColaboradorVO;
    FCompraTipoRequisicaoVO: TCompraTipoRequisicaoVO;

    FListaCompraRequisicaoDetalheVO: TListaCompraRequisicaoDetalheVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdCompraTipoRequisicao: Integer  read FID_COMPRA_TIPO_REQUISICAO write FID_COMPRA_TIPO_REQUISICAO;
    property CompraTipoRequisicaoNome: String read FCompraTipoRequisicaoNome write FCompraTipoRequisicaoNome;

    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    property ColaboradorPessoaNome: String read FColaboradorPessoaNome write FColaboradorPessoaNome;

    property DataRequisicao: TDateTime  read FDATA_REQUISICAO write FDATA_REQUISICAO;
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;


    //Transientes
    property CompraTipoRequisicaoVO: TCompraTipoRequisicaoVO read FCompraTipoRequisicaoVO write FCompraTipoRequisicaoVO;

    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;

    property ListaCompraRequisicaoDetalheVO: TListaCompraRequisicaoDetalheVO read FListaCompraRequisicaoDetalheVO write FListaCompraRequisicaoDetalheVO;

  end;

  TListaCompraRequisicaoVO = specialize TFPGObjectList<TCompraRequisicaoVO>;

implementation

constructor TCompraRequisicaoVO.Create;
begin
  inherited;

  FCompraTipoRequisicaoVO := TCompraTipoRequisicaoVO.Create;
  FColaboradorVO := TViewPessoaColaboradorVO.Create;

  FListaCompraRequisicaoDetalheVO := TListaCompraRequisicaoDetalheVO.Create;
end;

destructor TCompraRequisicaoVO.Destroy;
begin
  FreeAndNil(FCompraTipoRequisicaoVO);
  FreeAndNil(FColaboradorVO);

  FreeAndNil(FListaCompraRequisicaoDetalheVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TCompraRequisicaoVO);

finalization
  Classes.UnRegisterClass(TCompraRequisicaoVO);

end.
