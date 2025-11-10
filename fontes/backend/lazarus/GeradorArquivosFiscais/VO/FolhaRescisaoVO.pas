{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FOLHA_RESCISAO] 
                                                                                
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
unit FolhaRescisaoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ViewPessoaColaboradorVO;

type
  TFolhaRescisaoVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FDATA_DEMISSAO: TDateTime;
    FDATA_PAGAMENTO: TDateTime;
    FMOTIVO: String;
    FMOTIVO_ESOCIAL: String;
    FDATA_AVISO_PREVIO: TDateTime;
    FDIAS_AVISO_PREVIO: Integer;
    FCOMPROVOU_NOVO_EMPREGO: String;
    FDISPENSOU_EMPREGADO: String;
    FPENSAO_ALIMENTICIA: Extended;
    FPENSAO_ALIMENTICIA_FGTS: Extended;
    FFGTS_VALOR_RESCISAO: Extended;
    FFGTS_SALDO_BANCO: Extended;
    FFGTS_COMPLEMENTO_SALDO: Extended;
    FFGTS_CODIGO_AFASTAMENTO: String;
    FFGTS_CODIGO_SAQUE: String;

    //Transientes
    FColaboradorNome: String;

    FColaboradorVO: TViewPessoaColaboradorVO;



  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    property ColaboradorNome: String read FColaboradorNome write FColaboradorNome;

    property DataDemissao: TDateTime  read FDATA_DEMISSAO write FDATA_DEMISSAO;
    property DataPagamento: TDateTime  read FDATA_PAGAMENTO write FDATA_PAGAMENTO;
    property Motivo: String  read FMOTIVO write FMOTIVO;
    property MotivoEsocial: String  read FMOTIVO_ESOCIAL write FMOTIVO_ESOCIAL;
    property DataAvisoPrevio: TDateTime  read FDATA_AVISO_PREVIO write FDATA_AVISO_PREVIO;
    property DiasAvisoPrevio: Integer  read FDIAS_AVISO_PREVIO write FDIAS_AVISO_PREVIO;
    property ComprovouNovoEmprego: String  read FCOMPROVOU_NOVO_EMPREGO write FCOMPROVOU_NOVO_EMPREGO;
    property DispensouEmpregado: String  read FDISPENSOU_EMPREGADO write FDISPENSOU_EMPREGADO;
    property PensaoAlimenticia: Extended  read FPENSAO_ALIMENTICIA write FPENSAO_ALIMENTICIA;
    property PensaoAlimenticiaFgts: Extended  read FPENSAO_ALIMENTICIA_FGTS write FPENSAO_ALIMENTICIA_FGTS;
    property FgtsValorRescisao: Extended  read FFGTS_VALOR_RESCISAO write FFGTS_VALOR_RESCISAO;
    property FgtsSaldoBanco: Extended  read FFGTS_SALDO_BANCO write FFGTS_SALDO_BANCO;
    property FgtsComplementoSaldo: Extended  read FFGTS_COMPLEMENTO_SALDO write FFGTS_COMPLEMENTO_SALDO;
    property FgtsCodigoAfastamento: String  read FFGTS_CODIGO_AFASTAMENTO write FFGTS_CODIGO_AFASTAMENTO;
    property FgtsCodigoSaque: String  read FFGTS_CODIGO_SAQUE write FFGTS_CODIGO_SAQUE;


    //Transientes
    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;



  end;

  TListaFolhaRescisaoVO = specialize TFPGObjectList<TFolhaRescisaoVO>;

implementation

constructor TFolhaRescisaoVO.Create;
begin
  inherited;

  FColaboradorVO := TViewPessoaColaboradorVO.Create;
end;

destructor TFolhaRescisaoVO.Destroy;
begin
  FreeAndNil(FColaboradorVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TFolhaRescisaoVO);

finalization
  Classes.UnRegisterClass(TFolhaRescisaoVO);

end.
