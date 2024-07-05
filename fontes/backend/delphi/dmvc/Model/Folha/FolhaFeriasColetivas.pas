{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_FERIAS_COLETIVAS] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
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
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************}
unit FolhaFeriasColetivas;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TFolhaFeriasColetivas = class(TModelBase)
  private
    FId: Integer;
    FDataInicio: TDateTime;
    FDataFim: TDateTime;
    FDiasGozo: Integer;
    FAbonoPecuniarioInicio: TDateTime;
    FAbonoPecuniarioFim: TDateTime;
    FDiasAbono: Integer;
    FDataPagamento: TDateTime;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('DATA_INICIO')]
		[MVCNameAsAttribute('dataInicio')]
		property DataInicio: TDateTime read FDataInicio write FDataInicio;
    [MVCColumnAttribute('DATA_FIM')]
		[MVCNameAsAttribute('dataFim')]
		property DataFim: TDateTime read FDataFim write FDataFim;
    [MVCColumnAttribute('DIAS_GOZO')]
		[MVCNameAsAttribute('diasGozo')]
		property DiasGozo: Integer read FDiasGozo write FDiasGozo;
    [MVCColumnAttribute('ABONO_PECUNIARIO_INICIO')]
		[MVCNameAsAttribute('abonoPecuniarioInicio')]
		property AbonoPecuniarioInicio: TDateTime read FAbonoPecuniarioInicio write FAbonoPecuniarioInicio;
    [MVCColumnAttribute('ABONO_PECUNIARIO_FIM')]
		[MVCNameAsAttribute('abonoPecuniarioFim')]
		property AbonoPecuniarioFim: TDateTime read FAbonoPecuniarioFim write FAbonoPecuniarioFim;
    [MVCColumnAttribute('DIAS_ABONO')]
		[MVCNameAsAttribute('diasAbono')]
		property DiasAbono: Integer read FDiasAbono write FDiasAbono;
    [MVCColumnAttribute('DATA_PAGAMENTO')]
		[MVCNameAsAttribute('dataPagamento')]
		property DataPagamento: TDateTime read FDataPagamento write FDataPagamento;
      
  end;

implementation

{ TFolhaFeriasColetivas }



end.