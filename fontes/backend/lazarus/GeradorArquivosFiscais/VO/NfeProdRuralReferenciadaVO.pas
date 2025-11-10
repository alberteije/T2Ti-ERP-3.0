{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_PROD_RURAL_REFERENCIADA] 
                                                                                
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
unit NfeProdRuralReferenciadaVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TNfeProdRuralReferenciadaVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FCODIGO_UF: Integer;
    FANO_MES: String;
    FCNPJ: String;
    FCPF: String;
    FINSCRICAO_ESTADUAL: String;
    FMODELO: String;
    FSERIE: String;
    FNUMERO_NF: Integer;

  published 
    property Id: Integer  read FID write FID;
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    property CodigoUf: Integer  read FCODIGO_UF write FCODIGO_UF;
    property AnoMes: String  read FANO_MES write FANO_MES;
    property Cnpj: String  read FCNPJ write FCNPJ;
    property Cpf: String  read FCPF write FCPF;
    property InscricaoEstadual: String  read FINSCRICAO_ESTADUAL write FINSCRICAO_ESTADUAL;
    property Modelo: String  read FMODELO write FMODELO;
    property Serie: String  read FSERIE write FSERIE;
    property NumeroNf: Integer  read FNUMERO_NF write FNUMERO_NF;

  end;

  TListaNfeProdRuralReferenciadaVO = specialize TFPGObjectList<TNfeProdRuralReferenciadaVO>;

implementation


initialization
  Classes.RegisterClass(TNfeProdRuralReferenciadaVO);

finalization
  Classes.UnRegisterClass(TNfeProdRuralReferenciadaVO);

end.
