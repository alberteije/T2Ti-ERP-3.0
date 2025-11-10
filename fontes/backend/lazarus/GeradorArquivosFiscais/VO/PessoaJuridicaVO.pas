{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PESSOA_JURIDICA]
                                                                                
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
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                            
@version 1.0                                                                    
*******************************************************************************}
unit PessoaJuridicaVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TPessoaJuridicaVO = class(TVO)
  private
    FID: Integer;
    FID_PESSOA: Integer;
    FCNPJ: String;
    FFANTASIA: String;
    FINSCRICAO_MUNICIPAL: String;
    FINSCRICAO_ESTADUAL: String;
    FDATA_CONSTITUICAO: TDateTime;
    FTIPO_REGIME: String;
    FCRT: String;
    FSUFRAMA: String;

  published 
    property Id: Integer  read FID write FID;
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    property Cnpj: String  read FCNPJ write FCNPJ;
    property Fantasia: String  read FFANTASIA write FFANTASIA;
    property InscricaoMunicipal: String  read FINSCRICAO_MUNICIPAL write FINSCRICAO_MUNICIPAL;
    property InscricaoEstadual: String  read FINSCRICAO_ESTADUAL write FINSCRICAO_ESTADUAL;
    property DataConstituicao: TDateTime  read FDATA_CONSTITUICAO write FDATA_CONSTITUICAO;
    property TipoRegime: String  read FTIPO_REGIME write FTIPO_REGIME;
    property Crt: String  read FCRT write FCRT;
    property Suframa: String  read FSUFRAMA write FSUFRAMA;

  end;

  TListaPessoaJuridicaVO = specialize TFPGObjectList<TPessoaJuridicaVO>;

implementation

initialization
  Classes.RegisterClass(TPessoaJuridicaVO);

finalization
  Classes.UnRegisterClass(TPessoaJuridicaVO);

end.
