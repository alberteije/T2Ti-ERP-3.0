{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PATRIM_GRUPO_BEM] 
                                                                                
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
unit PatrimGrupoBemVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ContabilContaVO, ContabilHistoricoVO;

type
  TPatrimGrupoBemVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FCODIGO: String;
    FNOME: String;
    FDESCRICAO: String;
    FCONTA_ATIVO_IMOBILIZADO: String;
    FCONTA_DEPRECIACAO_ACUMULADA: String;
    FCONTA_DESPESA_DEPRECIACAO: String;
    FCODIGO_HISTORICO: Integer;

    //Transientes
    FDescricaoContaAtivoImobilizado: String;
    FDescricaoContaDepreciacaoAcumulada: String;
    FDescricaoContaDespesaDepreciacao: String;
    FDescricaoHistorico: String;

    FDescricaoContaAtivoImobilizadoVO: TContabilContaVO;
    FDescricaoContaDepreciacaoAcumuladaVO: TContabilContaVO;
    FDescricaoContaDespesaDepreciacaoVO: TContabilContaVO;
    FDescricaoHistoricoVO: TContabilHistoricoVO;


  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property Codigo: String  read FCODIGO write FCODIGO;
    property Nome: String  read FNOME write FNOME;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;

    property ContaAtivoImobilizado: String  read FCONTA_ATIVO_IMOBILIZADO write FCONTA_ATIVO_IMOBILIZADO;
    property DescricaoContaAtivoImobilizado: String read FDescricaoContaAtivoImobilizado write FDescricaoContaAtivoImobilizado;

    property ContaDepreciacaoAcumulada: String  read FCONTA_DEPRECIACAO_ACUMULADA write FCONTA_DEPRECIACAO_ACUMULADA;
    property DescricaoContaDepreciacaoAcumulada: String read FDescricaoContaDepreciacaoAcumulada write FDescricaoContaDepreciacaoAcumulada;

    property ContaDespesaDepreciacao: String  read FCONTA_DESPESA_DEPRECIACAO write FCONTA_DESPESA_DEPRECIACAO;
    property DescricaoContaDespesaDepreciacao: String read FDescricaoContaDespesaDepreciacao write FDescricaoContaDespesaDepreciacao;

    property CodigoHistorico: Integer  read FCODIGO_HISTORICO write FCODIGO_HISTORICO;
    property DescricaoHistorico: String read FDescricaoHistorico write FDescricaoHistorico;


    //Transientes
    property DescricaoContaAtivoImobilizadoVO: TContabilContaVO read FDescricaoContaAtivoImobilizadoVO write FDescricaoContaAtivoImobilizadoVO;

    property DescricaoContaDepreciacaoAcumuladaVO: TContabilContaVO read FDescricaoContaDepreciacaoAcumuladaVO write FDescricaoContaDepreciacaoAcumuladaVO;

    property DescricaoContaDespesaDepreciacaoVO: TContabilContaVO read FDescricaoContaDespesaDepreciacaoVO write FDescricaoContaDespesaDepreciacaoVO;

    property DescricaoHistoricoVO: TContabilHistoricoVO read FDescricaoHistoricoVO write FDescricaoHistoricoVO;


  end;

  TListaPatrimGrupoBemVO = specialize TFPGObjectList<TPatrimGrupoBemVO>;

implementation

constructor TPatrimGrupoBemVO.Create;
begin
  inherited;

  FDescricaoContaAtivoImobilizadoVO := TContabilContaVO.Create;
  FDescricaoContaDepreciacaoAcumuladaVO := TContabilContaVO.Create;
  FDescricaoContaDespesaDepreciacaoVO := TContabilContaVO.Create;
  FDescricaoHistoricoVO := TContabilHistoricoVO.Create;
end;

destructor TPatrimGrupoBemVO.Destroy;
begin
  FreeAndNil(FDescricaoContaAtivoImobilizadoVO);
  FreeAndNil(FDescricaoContaDepreciacaoAcumuladaVO);
  FreeAndNil(FDescricaoContaDespesaDepreciacaoVO);
  FreeAndNil(FDescricaoHistoricoVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TPatrimGrupoBemVO);

finalization
  Classes.UnRegisterClass(TPatrimGrupoBemVO);

end.
