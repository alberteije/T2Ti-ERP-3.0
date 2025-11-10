{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: VO relacionado à tabela [USUARIO]
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2010 T2Ti.COM                                          
                                                                                
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
           t2ti.com@gmail.com</p>                                               
                                                                                
@author Albert Eije (T2Ti.COM)
@version 1.0
*******************************************************************************}
unit UsuarioVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ColaboradorVO, PapelVO;

type
  TUsuarioVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FID_PAPEL: Integer;
    FLOGIN: String;
    FSENHA: String;
    FDATA_CADASTRO: TDateTime;
    FADMINISTRADOR: String;

    FColaboradorVO: TColaboradorVO;
    FPapelVO: TPapelVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;


    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    property IdPapel: Integer  read FID_PAPEL write FID_PAPEL;

    property Login: String  read FLOGIN write FLOGIN;
    property Senha: String  read FSENHA write FSENHA;
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    property Administrador: String read FADMINISTRADOR write FADMINISTRADOR;

    property ColaboradorVO: TColaboradorVO read FColaboradorVO write FColaboradorVO;

    property PapelVO: TPapelVO read FPapelVO write FPapelVO;
  end;

  TListaUsuarioVO = specialize TFPGObjectList<TUsuarioVO>;

implementation

constructor TUsuarioVO.Create;
begin
  inherited;

  FColaboradorVO := TColaboradorVO.Create;
  FPapelVO := TPapelVO.Create;
end;

destructor TUsuarioVO.Destroy;
begin
  FreeAndNil(FColaboradorVO);
  FreeAndNil(FPapelVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TUsuarioVO);

finalization
  Classes.UnRegisterClass(TUsuarioVO);

end.
