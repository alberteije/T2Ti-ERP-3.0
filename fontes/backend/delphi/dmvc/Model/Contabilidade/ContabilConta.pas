{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTABIL_CONTA] 
                                                                                
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
unit ContabilConta;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TContabilConta = class(TModelBase)
  private
    FId: Integer;
    FIdPlanoConta: Integer;
    FIdContabilConta: Integer;
    FIdPlanoContaRefSped: Integer;
    FClassificacao: string;
    FTipo: string;
    FDescricao: string;
    FDataInclusao: TDateTime;
    FSituacao: string;
    FNatureza: string;
    FPatrimonioResultado: string;
    FLivroCaixa: string;
    FDfc: string;
    FOrdem: string;
    FCodigoReduzido: string;
    FCodigoEfd: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_PLANO_CONTA')]
		[MVCNameAsAttribute('idPlanoConta')]
		property IdPlanoConta: Integer read FIdPlanoConta write FIdPlanoConta;
    [MVCColumnAttribute('ID_CONTABIL_CONTA')]
		[MVCNameAsAttribute('idContabilConta')]
		property IdContabilConta: Integer read FIdContabilConta write FIdContabilConta;
    [MVCColumnAttribute('ID_PLANO_CONTA_REF_SPED')]
		[MVCNameAsAttribute('idPlanoContaRefSped')]
		property IdPlanoContaRefSped: Integer read FIdPlanoContaRefSped write FIdPlanoContaRefSped;
    [MVCColumnAttribute('CLASSIFICACAO')]
		[MVCNameAsAttribute('classificacao')]
		property Classificacao: string read FClassificacao write FClassificacao;
    [MVCColumnAttribute('TIPO')]
		[MVCNameAsAttribute('tipo')]
		property Tipo: string read FTipo write FTipo;
    [MVCColumnAttribute('DESCRICAO')]
		[MVCNameAsAttribute('descricao')]
		property Descricao: string read FDescricao write FDescricao;
    [MVCColumnAttribute('DATA_INCLUSAO')]
		[MVCNameAsAttribute('dataInclusao')]
		property DataInclusao: TDateTime read FDataInclusao write FDataInclusao;
    [MVCColumnAttribute('SITUACAO')]
		[MVCNameAsAttribute('situacao')]
		property Situacao: string read FSituacao write FSituacao;
    [MVCColumnAttribute('NATUREZA')]
		[MVCNameAsAttribute('natureza')]
		property Natureza: string read FNatureza write FNatureza;
    [MVCColumnAttribute('PATRIMONIO_RESULTADO')]
		[MVCNameAsAttribute('patrimonioResultado')]
		property PatrimonioResultado: string read FPatrimonioResultado write FPatrimonioResultado;
    [MVCColumnAttribute('LIVRO_CAIXA')]
		[MVCNameAsAttribute('livroCaixa')]
		property LivroCaixa: string read FLivroCaixa write FLivroCaixa;
    [MVCColumnAttribute('DFC')]
		[MVCNameAsAttribute('dfc')]
		property Dfc: string read FDfc write FDfc;
    [MVCColumnAttribute('ORDEM')]
		[MVCNameAsAttribute('ordem')]
		property Ordem: string read FOrdem write FOrdem;
    [MVCColumnAttribute('CODIGO_REDUZIDO')]
		[MVCNameAsAttribute('codigoReduzido')]
		property CodigoReduzido: string read FCodigoReduzido write FCodigoReduzido;
    [MVCColumnAttribute('CODIGO_EFD')]
		[MVCNameAsAttribute('codigoEfd')]
		property CodigoEfd: string read FCodigoEfd write FCodigoEfd;
      
  end;

implementation

{ TContabilConta }



end.