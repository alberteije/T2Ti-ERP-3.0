{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_AEREO] 
                                                                                
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
unit CteAereo;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TCteAereo = class(TModelBase)
  private
    FId: Integer;
    FIdCteCabecalho: Integer;
    FNumeroMinuta: Integer;
    FNumeroConhecimento: Integer;
    FDataPrevistaEntrega: TDateTime;
    FIdEmissor: string;
    FIdInternaTomador: string;
    FTarifaClasse: string;
    FTarifaCodigo: string;
    FTarifaValor: Extended;
    FCargaDimensao: string;
    FCargaInformacaoManuseio: string;
    FCargaEspecial: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_CTE_CABECALHO')]
		[MVCNameAsAttribute('idCteCabecalho')]
		property IdCteCabecalho: Integer read FIdCteCabecalho write FIdCteCabecalho;
    [MVCColumnAttribute('NUMERO_MINUTA')]
		[MVCNameAsAttribute('numeroMinuta')]
		property NumeroMinuta: Integer read FNumeroMinuta write FNumeroMinuta;
    [MVCColumnAttribute('NUMERO_CONHECIMENTO')]
		[MVCNameAsAttribute('numeroConhecimento')]
		property NumeroConhecimento: Integer read FNumeroConhecimento write FNumeroConhecimento;
    [MVCColumnAttribute('DATA_PREVISTA_ENTREGA')]
		[MVCNameAsAttribute('dataPrevistaEntrega')]
		property DataPrevistaEntrega: TDateTime read FDataPrevistaEntrega write FDataPrevistaEntrega;
    [MVCColumnAttribute('ID_EMISSOR')]
		[MVCNameAsAttribute('idEmissor')]
		property IdEmissor: string read FIdEmissor write FIdEmissor;
    [MVCColumnAttribute('ID_INTERNA_TOMADOR')]
		[MVCNameAsAttribute('idInternaTomador')]
		property IdInternaTomador: string read FIdInternaTomador write FIdInternaTomador;
    [MVCColumnAttribute('TARIFA_CLASSE')]
		[MVCNameAsAttribute('tarifaClasse')]
		property TarifaClasse: string read FTarifaClasse write FTarifaClasse;
    [MVCColumnAttribute('TARIFA_CODIGO')]
		[MVCNameAsAttribute('tarifaCodigo')]
		property TarifaCodigo: string read FTarifaCodigo write FTarifaCodigo;
    [MVCColumnAttribute('TARIFA_VALOR')]
		[MVCNameAsAttribute('tarifaValor')]
		property TarifaValor: Extended read FTarifaValor write FTarifaValor;
    [MVCColumnAttribute('CARGA_DIMENSAO')]
		[MVCNameAsAttribute('cargaDimensao')]
		property CargaDimensao: string read FCargaDimensao write FCargaDimensao;
    [MVCColumnAttribute('CARGA_INFORMACAO_MANUSEIO')]
		[MVCNameAsAttribute('cargaInformacaoManuseio')]
		property CargaInformacaoManuseio: string read FCargaInformacaoManuseio write FCargaInformacaoManuseio;
    [MVCColumnAttribute('CARGA_ESPECIAL')]
		[MVCNameAsAttribute('cargaEspecial')]
		property CargaEspecial: string read FCargaEspecial write FCargaEspecial;
      
  end;

implementation

{ TCteAereo }



end.