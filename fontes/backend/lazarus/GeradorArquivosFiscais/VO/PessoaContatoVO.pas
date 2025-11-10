{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PESSOA_CONTATO] 
                                                                                
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
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                    
@version 1.0                                                                    
*******************************************************************************}
unit PessoaContatoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TPessoaContatoVO = class(TVO)
  private
    FID: Integer;
    FID_PESSOA: Integer;
    FNOME: String;
    FEMAIL: String;
    FFONE_COMERCIAL: String;
    FFONE_RESIDENCIAL: String;
    FFONE_CELULAR: String;

    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;

  published
    property Id: Integer  read FID write FID;
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    property Nome: String  read FNOME write FNOME;
    property Email: String  read FEMAIL write FEMAIL;
    property FoneComercial: String  read FFONE_COMERCIAL write FFONE_COMERCIAL;
    property FoneResidencial: String  read FFONE_RESIDENCIAL write FFONE_RESIDENCIAL;
    property FoneCelular: String  read FFONE_CELULAR write FFONE_CELULAR;

    property Persiste: String  read FPersiste write FPersiste;
  end;

  TListaPessoaContatoVO = specialize TFPGObjectList<TPessoaContatoVO>;

implementation


initialization
  Classes.RegisterClass(TPessoaContatoVO);

finalization
  Classes.UnRegisterClass(TPessoaContatoVO);

end.
