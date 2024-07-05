{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_INSS_RETENCAO] 
                                                                                
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
unit FolhaInssRetencao;

interface

uses
  Generics.Collections, System.SysUtils,
  FolhaInssServico, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TFolhaInssRetencao = class(TModelBase)
  private
    FId: Integer;
    FIdFolhaInss: Integer;
    FIdFolhaInssServico: Integer;
    FValorMensal: Extended;
    FValor13: Extended;
      
    FFolhaInssServico: TFolhaInssServico;
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_FOLHA_INSS')]
		[MVCNameAsAttribute('idFolhaInss')]
		property IdFolhaInss: Integer read FIdFolhaInss write FIdFolhaInss;
    [MVCColumnAttribute('ID_FOLHA_INSS_SERVICO')]
		[MVCNameAsAttribute('idFolhaInssServico')]
		property IdFolhaInssServico: Integer read FIdFolhaInssServico write FIdFolhaInssServico;
    [MVCColumnAttribute('VALOR_MENSAL')]
		[MVCNameAsAttribute('valorMensal')]
		property ValorMensal: Extended read FValorMensal write FValorMensal;
    [MVCColumnAttribute('VALOR_13')]
		[MVCNameAsAttribute('valor13')]
		property Valor13: Extended read FValor13 write FValor13;
      
    [MVCNameAsAttribute('folhaInssServico')]
		property FolhaInssServico: TFolhaInssServico read FFolhaInssServico write FFolhaInssServico;
  end;

implementation

{ TFolhaInssRetencao }

constructor TFolhaInssRetencao.Create;
begin
  inherited;
  FFolhaInssServico := TFolhaInssServico.Create;
end;

destructor TFolhaInssRetencao.Destroy;
begin
  FreeAndNil(FFolhaInssServico);
  inherited;
end;

end.