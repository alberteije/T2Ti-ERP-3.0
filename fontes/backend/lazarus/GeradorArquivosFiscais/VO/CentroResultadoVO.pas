{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CENTRO_RESULTADO] 
                                                                                
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
unit CentroResultadoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  PlanoCentroResultadoVO;

type
  TCentroResultadoVO = class(TVO)
  private
    FID: Integer;
    FID_PLANO_CENTRO_RESULTADO: Integer;
    FCLASSIFICACAO: String;
    FDESCRICAO: String;
    FSOFRE_RATEIRO: String;

    //Transientes
    FPlanoCentroResultadoNome: String;
    FPlanoCentroResultadoVO: TPlanoCentroResultadoVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdPlanoCentroResultado: Integer  read FID_PLANO_CENTRO_RESULTADO write FID_PLANO_CENTRO_RESULTADO;
    property PlanoCentroResultadoNome: String read FPlanoCentroResultadoNome write FPlanoCentroResultadoNome;

    property Classificacao: String  read FCLASSIFICACAO write FCLASSIFICACAO;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property SofreRateiro: String  read FSOFRE_RATEIRO write FSOFRE_RATEIRO;

    //Transientes
    property PlanoCentroResultadoVO: TPlanoCentroResultadoVO read FPlanoCentroResultadoVO write FPlanoCentroResultadoVO;

  end;

  TListaCentroResultadoVO = specialize TFPGObjectList<TCentroResultadoVO>;

implementation

constructor TCentroResultadoVO.Create;
begin
  inherited;

  FPlanoCentroResultadoVO := TPlanoCentroResultadoVO.Create;
end;

destructor TCentroResultadoVO.Destroy;
begin
  FreeAndNil(FPlanoCentroResultadoVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TCentroResultadoVO);

finalization
  Classes.UnRegisterClass(TCentroResultadoVO);

end.
