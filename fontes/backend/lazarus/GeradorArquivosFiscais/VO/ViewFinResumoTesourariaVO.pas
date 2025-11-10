{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_FIN_RESUMO_TESOURARIA] 
                                                                                
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
unit ViewFinResumoTesourariaVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TViewFinResumoTesourariaVO = class(TVO)
  private
    FID_CONTA_CAIXA: Integer;
    FNOME_CONTA_CAIXA: String;
    FNOME_PESSOA: String;
    FDATA_LANCAMENTO: TDateTime;
    FDATA_PAGO_RECEBIDO: TDateTime;
    FHISTORICO: String;
    FVALOR: Extended;
    FDESCRICAO_DOCUMENTO_ORIGEM: String;
    FOPERACAO: String;

    //Transientes



  published 
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    property NomeContaCaixa: String  read FNOME_CONTA_CAIXA write FNOME_CONTA_CAIXA;
    property NomePessoa: String  read FNOME_PESSOA write FNOME_PESSOA;
    property DataLancamento: TDateTime  read FDATA_LANCAMENTO write FDATA_LANCAMENTO;
    property DataPagoRecebido: TDateTime  read FDATA_PAGO_RECEBIDO write FDATA_PAGO_RECEBIDO;
    property Historico: String  read FHISTORICO write FHISTORICO;
    property Valor: Extended  read FVALOR write FVALOR;
    property DescricaoDocumentoOrigem: String  read FDESCRICAO_DOCUMENTO_ORIGEM write FDESCRICAO_DOCUMENTO_ORIGEM;
    property Operacao: String  read FOPERACAO write FOPERACAO;


    //Transientes



  end;

  TListaViewFinResumoTesourariaVO = specialize TFPGObjectList<TViewFinResumoTesourariaVO>;

implementation


initialization
  Classes.RegisterClass(TViewFinResumoTesourariaVO);

finalization
  Classes.UnRegisterClass(TViewFinResumoTesourariaVO);

end.
