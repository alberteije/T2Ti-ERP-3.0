{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_RESCISAO] 
                                                                                
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
unit FolhaRescisao;

interface

uses
  Generics.Collections, System.SysUtils,
  Colaborador, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TFolhaRescisao = class(TModelBase)
  private
    FId: Integer;
    FIdColaborador: Integer;
    FDataDemissao: TDateTime;
    FDataPagamento: TDateTime;
    FMotivo: string;
    FMotivoEsocial: string;
    FDataAvisoPrevio: TDateTime;
    FDiasAvisoPrevio: Integer;
    FComprovouNovoEmprego: string;
    FDispensouEmpregado: string;
    FPensaoAlimenticia: Extended;
    FPensaoAlimenticiaFgts: Extended;
    FFgtsValorRescisao: Extended;
    FFgtsSaldoBanco: Extended;
    FFgtsComplementoSaldo: Extended;
    FFgtsCodigoAfastamento: string;
    FFgtsCodigoSaque: string;
      
    FColaborador: TColaborador;
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_COLABORADOR')]
		[MVCNameAsAttribute('idColaborador')]
		property IdColaborador: Integer read FIdColaborador write FIdColaborador;
    [MVCColumnAttribute('DATA_DEMISSAO')]
		[MVCNameAsAttribute('dataDemissao')]
		property DataDemissao: TDateTime read FDataDemissao write FDataDemissao;
    [MVCColumnAttribute('DATA_PAGAMENTO')]
		[MVCNameAsAttribute('dataPagamento')]
		property DataPagamento: TDateTime read FDataPagamento write FDataPagamento;
    [MVCColumnAttribute('MOTIVO')]
		[MVCNameAsAttribute('motivo')]
		property Motivo: string read FMotivo write FMotivo;
    [MVCColumnAttribute('MOTIVO_ESOCIAL')]
		[MVCNameAsAttribute('motivoEsocial')]
		property MotivoEsocial: string read FMotivoEsocial write FMotivoEsocial;
    [MVCColumnAttribute('DATA_AVISO_PREVIO')]
		[MVCNameAsAttribute('dataAvisoPrevio')]
		property DataAvisoPrevio: TDateTime read FDataAvisoPrevio write FDataAvisoPrevio;
    [MVCColumnAttribute('DIAS_AVISO_PREVIO')]
		[MVCNameAsAttribute('diasAvisoPrevio')]
		property DiasAvisoPrevio: Integer read FDiasAvisoPrevio write FDiasAvisoPrevio;
    [MVCColumnAttribute('COMPROVOU_NOVO_EMPREGO')]
		[MVCNameAsAttribute('comprovouNovoEmprego')]
		property ComprovouNovoEmprego: string read FComprovouNovoEmprego write FComprovouNovoEmprego;
    [MVCColumnAttribute('DISPENSOU_EMPREGADO')]
		[MVCNameAsAttribute('dispensouEmpregado')]
		property DispensouEmpregado: string read FDispensouEmpregado write FDispensouEmpregado;
    [MVCColumnAttribute('PENSAO_ALIMENTICIA')]
		[MVCNameAsAttribute('pensaoAlimenticia')]
		property PensaoAlimenticia: Extended read FPensaoAlimenticia write FPensaoAlimenticia;
    [MVCColumnAttribute('PENSAO_ALIMENTICIA_FGTS')]
		[MVCNameAsAttribute('pensaoAlimenticiaFgts')]
		property PensaoAlimenticiaFgts: Extended read FPensaoAlimenticiaFgts write FPensaoAlimenticiaFgts;
    [MVCColumnAttribute('FGTS_VALOR_RESCISAO')]
		[MVCNameAsAttribute('fgtsValorRescisao')]
		property FgtsValorRescisao: Extended read FFgtsValorRescisao write FFgtsValorRescisao;
    [MVCColumnAttribute('FGTS_SALDO_BANCO')]
		[MVCNameAsAttribute('fgtsSaldoBanco')]
		property FgtsSaldoBanco: Extended read FFgtsSaldoBanco write FFgtsSaldoBanco;
    [MVCColumnAttribute('FGTS_COMPLEMENTO_SALDO')]
		[MVCNameAsAttribute('fgtsComplementoSaldo')]
		property FgtsComplementoSaldo: Extended read FFgtsComplementoSaldo write FFgtsComplementoSaldo;
    [MVCColumnAttribute('FGTS_CODIGO_AFASTAMENTO')]
		[MVCNameAsAttribute('fgtsCodigoAfastamento')]
		property FgtsCodigoAfastamento: string read FFgtsCodigoAfastamento write FFgtsCodigoAfastamento;
    [MVCColumnAttribute('FGTS_CODIGO_SAQUE')]
		[MVCNameAsAttribute('fgtsCodigoSaque')]
		property FgtsCodigoSaque: string read FFgtsCodigoSaque write FFgtsCodigoSaque;
      
    [MVCNameAsAttribute('colaborador')]
		property Colaborador: TColaborador read FColaborador write FColaborador;
  end;

implementation

{ TFolhaRescisao }

constructor TFolhaRescisao.Create;
begin
  inherited;
  FColaborador := TColaborador.Create;
end;

destructor TFolhaRescisao.Destroy;
begin
  FreeAndNil(FColaborador);
  inherited;
end;

end.