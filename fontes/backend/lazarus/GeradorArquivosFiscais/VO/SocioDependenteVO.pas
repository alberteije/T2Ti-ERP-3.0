{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [SOCIO_DEPENDENTE] 
                                                                                
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
unit SocioDependenteVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TSocioDependenteVO = class(TVO)
  private
    FID: Integer;
    FID_SOCIO: Integer;
    FID_TIPO_RELACIONAMENTO: Integer;
    FNOME: String;
    FDATA_NASCIMENTO: TDateTime;
    FDATA_INICIO_DEPEDENCIA: TDateTime;
    FDATA_FIM_DEPENDENCIA: TDateTime;
    FCPF: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdSocio: Integer  read FID_SOCIO write FID_SOCIO;
    property IdTipoRelacionamento: Integer  read FID_TIPO_RELACIONAMENTO write FID_TIPO_RELACIONAMENTO;
    property Nome: String  read FNOME write FNOME;
    property DataNascimento: TDateTime  read FDATA_NASCIMENTO write FDATA_NASCIMENTO;
    property DataInicioDepedencia: TDateTime  read FDATA_INICIO_DEPEDENCIA write FDATA_INICIO_DEPEDENCIA;
    property DataFimDependencia: TDateTime  read FDATA_FIM_DEPENDENCIA write FDATA_FIM_DEPENDENCIA;
    property Cpf: String  read FCPF write FCPF;


    //Transientes



  end;

  TListaSocioDependenteVO = specialize TFPGObjectList<TSocioDependenteVO>;

implementation


initialization
  Classes.RegisterClass(TSocioDependenteVO);

finalization
  Classes.UnRegisterClass(TSocioDependenteVO);

end.
