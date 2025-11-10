unit ViewSpedI155VO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TViewSpedI155VO = class(TVO)
  private
    FMES_ANO: String;
    FID_CONTABIL_CONTA: Integer;
    FCLASSIFICACAO: String;
    FTIPO: String;
    FSOMA_VALOR: Extended;

    //Transientes



  published 
    property MesAno: String  read FMES_ANO write FMES_ANO;
    property IdContabilConta: Integer  read FID_CONTABIL_CONTA write FID_CONTABIL_CONTA;
    property Classificacao: String  read FCLASSIFICACAO write FCLASSIFICACAO;
    property Tipo: String  read FTIPO write FTIPO;
    property SomaValor: Extended  read FSOMA_VALOR write FSOMA_VALOR;


    //Transientes



  end;

  TListaViewSpedI155VO = specialize TFPGObjectList<TViewSpedI155VO>;

implementation


initialization
  Classes.RegisterClass(TViewSpedI155VO);

finalization
  Classes.UnRegisterClass(TViewSpedI155VO);

end.
