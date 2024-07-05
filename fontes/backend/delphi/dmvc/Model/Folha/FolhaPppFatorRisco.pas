{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_PPP_FATOR_RISCO] 
                                                                                
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
unit FolhaPppFatorRisco;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TFolhaPppFatorRisco = class(TModelBase)
  private
    FId: Integer;
    FIdFolhaPpp: Integer;
    FDataInicio: TDateTime;
    FDataFim: TDateTime;
    FTipo: string;
    FFatorRisco: string;
    FIntensidade: string;
    FTecnicaUtilizada: string;
    FEpcEficaz: string;
    FEpiEficaz: string;
    FCaEpi: Integer;
    FAtendimentoNr061: string;
    FAtendimentoNr062: string;
    FAtendimentoNr063: string;
    FAtendimentoNr064: string;
    FAtendimentoNr065: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_FOLHA_PPP')]
		[MVCNameAsAttribute('idFolhaPpp')]
		property IdFolhaPpp: Integer read FIdFolhaPpp write FIdFolhaPpp;
    [MVCColumnAttribute('DATA_INICIO')]
		[MVCNameAsAttribute('dataInicio')]
		property DataInicio: TDateTime read FDataInicio write FDataInicio;
    [MVCColumnAttribute('DATA_FIM')]
		[MVCNameAsAttribute('dataFim')]
		property DataFim: TDateTime read FDataFim write FDataFim;
    [MVCColumnAttribute('TIPO')]
		[MVCNameAsAttribute('tipo')]
		property Tipo: string read FTipo write FTipo;
    [MVCColumnAttribute('FATOR_RISCO')]
		[MVCNameAsAttribute('fatorRisco')]
		property FatorRisco: string read FFatorRisco write FFatorRisco;
    [MVCColumnAttribute('INTENSIDADE')]
		[MVCNameAsAttribute('intensidade')]
		property Intensidade: string read FIntensidade write FIntensidade;
    [MVCColumnAttribute('TECNICA_UTILIZADA')]
		[MVCNameAsAttribute('tecnicaUtilizada')]
		property TecnicaUtilizada: string read FTecnicaUtilizada write FTecnicaUtilizada;
    [MVCColumnAttribute('EPC_EFICAZ')]
		[MVCNameAsAttribute('epcEficaz')]
		property EpcEficaz: string read FEpcEficaz write FEpcEficaz;
    [MVCColumnAttribute('EPI_EFICAZ')]
		[MVCNameAsAttribute('epiEficaz')]
		property EpiEficaz: string read FEpiEficaz write FEpiEficaz;
    [MVCColumnAttribute('CA_EPI')]
		[MVCNameAsAttribute('caEpi')]
		property CaEpi: Integer read FCaEpi write FCaEpi;
    [MVCColumnAttribute('ATENDIMENTO_NR06_1')]
		[MVCNameAsAttribute('atendimentoNr061')]
		property AtendimentoNr061: string read FAtendimentoNr061 write FAtendimentoNr061;
    [MVCColumnAttribute('ATENDIMENTO_NR06_2')]
		[MVCNameAsAttribute('atendimentoNr062')]
		property AtendimentoNr062: string read FAtendimentoNr062 write FAtendimentoNr062;
    [MVCColumnAttribute('ATENDIMENTO_NR06_3')]
		[MVCNameAsAttribute('atendimentoNr063')]
		property AtendimentoNr063: string read FAtendimentoNr063 write FAtendimentoNr063;
    [MVCColumnAttribute('ATENDIMENTO_NR06_4')]
		[MVCNameAsAttribute('atendimentoNr064')]
		property AtendimentoNr064: string read FAtendimentoNr064 write FAtendimentoNr064;
    [MVCColumnAttribute('ATENDIMENTO_NR06_5')]
		[MVCNameAsAttribute('atendimentoNr065')]
		property AtendimentoNr065: string read FAtendimentoNr065 write FAtendimentoNr065;
      
  end;

implementation

{ TFolhaPppFatorRisco }



end.