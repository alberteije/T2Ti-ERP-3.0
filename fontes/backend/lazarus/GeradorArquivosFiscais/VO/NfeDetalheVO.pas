{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_DETALHE] 
                                                                                
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
unit NfeDetalheVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,

  NfeDetEspecificoVeiculoVO, NfeDetEspecificoCombustivelVO,
  NfeDetalheImpostoIcmsVO, NfeDetalheImpostoIpiVO, NfeDetalheImpostoIiVO,
  NfeDetalheImpostoPisVO, NfeDetalheImpostoCofinsVO, NfeDetalheImpostoIssqnVO,

  NfeDeclaracaoImportacaoVO, NfeExportacaoVO, NfeDetEspecificoMedicamentoVO,
  NfeDetEspecificoArmamentoVO;

type
  TNfeDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_PRODUTO: Integer;
    FID_NFE_CABECALHO: Integer;
    FNUMERO_ITEM: Integer;
    FCODIGO_PRODUTO: String;
    FGTIN: String;
    FNOME_PRODUTO: String;
    FNCM: String;
    FNVE: String;
    FEX_TIPI: Integer;
    FCFOP: Integer;
    FUNIDADE_COMERCIAL: String;
    FQUANTIDADE_COMERCIAL: Extended;
    FVALOR_UNITARIO_COMERCIAL: Extended;
    FVALOR_BRUTO_PRODUTO: Extended;
    FGTIN_UNIDADE_TRIBUTAVEL: String;
    FUNIDADE_TRIBUTAVEL: String;
    FQUANTIDADE_TRIBUTAVEL: Extended;
    FVALOR_UNITARIO_TRIBUTAVEL: Extended;
    FVALOR_FRETE: Extended;
    FVALOR_SEGURO: Extended;
    FVALOR_DESCONTO: Extended;
    FVALOR_OUTRAS_DESPESAS: Extended;
    FENTRA_TOTAL: Integer;
    FVALOR_SUBTOTAL: Extended;
    FVALOR_TOTAL: Extended;
    FNUMERO_PEDIDO_COMPRA: String;
    FITEM_PEDIDO_COMPRA: Integer;
    FINFORMACOES_ADICIONAIS: String;
    FNUMERO_FCI: String;
    FNUMERO_RECOPI: String;
    FVALOR_TOTAL_TRIBUTOS: Extended;
    FPERCENTUAL_DEVOLVIDO: Extended;
    FVALOR_IPI_DEVOLVIDO: Extended;


    // Grupo JA
    FNfeDetEspecificoVeiculoVO: TNfeDetEspecificoVeiculoVO; //0:1
    // Grupo LA
    FNfeDetEspecificoCombustivelVO: TNfeDetEspecificoCombustivelVO; //0:1
    // Grupo N
    FNfeDetalheImpostoIcmsVO: TNfeDetalheImpostoIcmsVO; //1:1
    // Grupo O
    FNfeDetalheImpostoIpiVO: TNfeDetalheImpostoIpiVO; //0:1
    // Grupo P
    FNfeDetalheImpostoIiVO: TNfeDetalheImpostoIiVO; //0:1
    // Grupo Q
    FNfeDetalheImpostoPisVO: TNfeDetalheImpostoPisVO; //0:1
    // Grupo S
    FNfeDetalheImpostoCofinsVO: TNfeDetalheImpostoCofinsVO; //0:1
    // Grupo U
    FNfeDetalheImpostoIssqnVO: TNfeDetalheImpostoIssqnVO; //0:1


    // Grupo I01
    FListaNfeDeclaracaoImportacaoVO: TListaNfeDeclaracaoImportacaoVO; //0:100
    // Grupo I03
    FListaNfeExportacaoVO: TListaNfeExportacaoVO; //0:500
    // Grupo K
    FListaNfeDetEspecificoMedicamentoVO: TListaNfeDetEspecificoMedicamentoVO; //0:500
    // Grupo L
    FListaNfeDetEspecificoArmamentoVO: TListaNfeDetEspecificoArmamentoVO; //0:500

  published 
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdProduto: Integer  read FID_PRODUTO write FID_PRODUTO;
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    property NumeroItem: Integer  read FNUMERO_ITEM write FNUMERO_ITEM;
    property CodigoProduto: String  read FCODIGO_PRODUTO write FCODIGO_PRODUTO;
    property Gtin: String  read FGTIN write FGTIN;
    property NomeProduto: String  read FNOME_PRODUTO write FNOME_PRODUTO;
    property Ncm: String  read FNCM write FNCM;
    property Nve: String  read FNVE write FNVE;
    property ExTipi: Integer  read FEX_TIPI write FEX_TIPI;
    property Cfop: Integer  read FCFOP write FCFOP;
    property UnidadeComercial: String  read FUNIDADE_COMERCIAL write FUNIDADE_COMERCIAL;
    property QuantidadeComercial: Extended  read FQUANTIDADE_COMERCIAL write FQUANTIDADE_COMERCIAL;
    property ValorUnitarioComercial: Extended  read FVALOR_UNITARIO_COMERCIAL write FVALOR_UNITARIO_COMERCIAL;
    property ValorBrutoProduto: Extended  read FVALOR_BRUTO_PRODUTO write FVALOR_BRUTO_PRODUTO;
    property GtinUnidadeTributavel: String  read FGTIN_UNIDADE_TRIBUTAVEL write FGTIN_UNIDADE_TRIBUTAVEL;
    property UnidadeTributavel: String  read FUNIDADE_TRIBUTAVEL write FUNIDADE_TRIBUTAVEL;
    property QuantidadeTributavel: Extended  read FQUANTIDADE_TRIBUTAVEL write FQUANTIDADE_TRIBUTAVEL;
    property ValorUnitarioTributavel: Extended  read FVALOR_UNITARIO_TRIBUTAVEL write FVALOR_UNITARIO_TRIBUTAVEL;
    property ValorFrete: Extended  read FVALOR_FRETE write FVALOR_FRETE;
    property ValorSeguro: Extended  read FVALOR_SEGURO write FVALOR_SEGURO;
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    property ValorOutrasDespesas: Extended  read FVALOR_OUTRAS_DESPESAS write FVALOR_OUTRAS_DESPESAS;
    property EntraTotal: Integer  read FENTRA_TOTAL write FENTRA_TOTAL;
    property ValorSubtotal: Extended  read FVALOR_SUBTOTAL write FVALOR_SUBTOTAL;
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    property NumeroPedidoCompra: String  read FNUMERO_PEDIDO_COMPRA write FNUMERO_PEDIDO_COMPRA;
    property ItemPedidoCompra: Integer  read FITEM_PEDIDO_COMPRA write FITEM_PEDIDO_COMPRA;
    property InformacoesAdicionais: String  read FINFORMACOES_ADICIONAIS write FINFORMACOES_ADICIONAIS;
    property NumeroFci: String  read FNUMERO_FCI write FNUMERO_FCI;
    property NumeroRecopi: String  read FNUMERO_RECOPI write FNUMERO_RECOPI;
    property ValorTotalTributos: Extended  read FVALOR_TOTAL_TRIBUTOS write FVALOR_TOTAL_TRIBUTOS;
    property PercentualDevolvido: Extended  read FPERCENTUAL_DEVOLVIDO write FPERCENTUAL_DEVOLVIDO;
    property ValorIpiDevolvido: Extended  read FVALOR_IPI_DEVOLVIDO write FVALOR_IPI_DEVOLVIDO;

    property NfeDetEspecificoVeiculoVO: TNfeDetEspecificoVeiculoVO read FNfeDetEspecificoVeiculoVO write FNfeDetEspecificoVeiculoVO;
    property NfeDetEspecificoCombustivelVO: TNfeDetEspecificoCombustivelVO read FNfeDetEspecificoCombustivelVO write FNfeDetEspecificoCombustivelVO;
    property NfeDetalheImpostoIcmsVO: TNfeDetalheImpostoIcmsVO read FNfeDetalheImpostoIcmsVO write FNfeDetalheImpostoIcmsVO;
    property NfeDetalheImpostoIpiVO: TNfeDetalheImpostoIpiVO read FNfeDetalheImpostoIpiVO write FNfeDetalheImpostoIpiVO;
    property NfeDetalheImpostoIiVO: TNfeDetalheImpostoIiVO read FNfeDetalheImpostoIiVO write FNfeDetalheImpostoIiVO;
    property NfeDetalheImpostoPisVO: TNfeDetalheImpostoPisVO read FNfeDetalheImpostoPisVO write FNfeDetalheImpostoPisVO;
    property NfeDetalheImpostoCofinsVO: TNfeDetalheImpostoCofinsVO read FNfeDetalheImpostoCofinsVO write FNfeDetalheImpostoCofinsVO;
    property NfeDetalheImpostoIssqnVO: TNfeDetalheImpostoIssqnVO read FNfeDetalheImpostoIssqnVO write FNfeDetalheImpostoIssqnVO;


    property ListaNfeDeclaracaoImportacaoVO: TListaNfeDeclaracaoImportacaoVO read FListaNfeDeclaracaoImportacaoVO write FListaNfeDeclaracaoImportacaoVO;
    property ListaNfeExportacaoVO: TListaNfeExportacaoVO read FListaNfeExportacaoVO write FListaNfeExportacaoVO;
    property ListaNfeDetEspecificoMedicamentoVO: TListaNfeDetEspecificoMedicamentoVO read FListaNfeDetEspecificoMedicamentoVO write FListaNfeDetEspecificoMedicamentoVO;
    property ListaNfeDetEspecificoArmamentoVO: TListaNfeDetEspecificoArmamentoVO read FListaNfeDetEspecificoArmamentoVO write FListaNfeDetEspecificoArmamentoVO;

  end;

  TListaNfeDetalheVO = specialize TFPGObjectList<TNfeDetalheVO>;

implementation

constructor TNfeDetalheVO.Create;
begin
  inherited;
  FNfeDetEspecificoVeiculoVO := TNfeDetEspecificoVeiculoVO.Create;
  FNfeDetEspecificoCombustivelVO := TNfeDetEspecificoCombustivelVO.Create;
  FNfeDetalheImpostoIcmsVO := TNfeDetalheImpostoIcmsVO.Create;
  FNfeDetalheImpostoIpiVO := TNfeDetalheImpostoIpiVO.Create;
  FNfeDetalheImpostoIiVO := TNfeDetalheImpostoIiVO.Create;
  FNfeDetalheImpostoPisVO := TNfeDetalheImpostoPisVO.Create;
  FNfeDetalheImpostoCofinsVO := TNfeDetalheImpostoCofinsVO.Create;
  FNfeDetalheImpostoIssqnVO := TNfeDetalheImpostoIssqnVO.Create;

  FListaNfeDeclaracaoImportacaoVO := TListaNfeDeclaracaoImportacaoVO.Create;
  FListaNfeExportacaoVO := TListaNfeExportacaoVO.Create;
  FListaNfeDetEspecificoMedicamentoVO := TListaNfeDetEspecificoMedicamentoVO.Create;
  FListaNfeDetEspecificoArmamentoVO := TListaNfeDetEspecificoArmamentoVO.Create;
end;

destructor TNfeDetalheVO.Destroy;
begin
  FreeAndNil(FNfeDetEspecificoVeiculoVO);
  FreeAndNil(FNfeDetEspecificoCombustivelVO);
  FreeAndNil(FNfeDetalheImpostoIcmsVO);
  FreeAndNil(FNfeDetalheImpostoIpiVO);
  FreeAndNil(FNfeDetalheImpostoIiVO);
  FreeAndNil(FNfeDetalheImpostoPisVO);
  FreeAndNil(FNfeDetalheImpostoCofinsVO);
  FreeAndNil(FNfeDetalheImpostoIssqnVO);

  FreeAndNil(FListaNfeDeclaracaoImportacaoVO);
  FreeAndNil(FListaNfeExportacaoVO);
  FreeAndNil(FListaNfeDetEspecificoMedicamentoVO);
  FreeAndNil(FListaNfeDetEspecificoArmamentoVO);
  inherited;
end;


initialization
  Classes.RegisterClass(TNfeDetalheVO);

finalization
  Classes.UnRegisterClass(TNfeDetalheVO);

end.
