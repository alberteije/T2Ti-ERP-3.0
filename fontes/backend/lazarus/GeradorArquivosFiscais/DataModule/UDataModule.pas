unit UDataModule;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZDataset, ZConnection, ACBrSpedFiscal, ACBrSpedContabil,
  ACBrSpedPisCofins, ACBrSintegra, ACBrReinf, ACBreSocial;

type

  { TFDataModule }

  TFDataModule = class(TDataModule)
    ACBreSocial: TACBreSocial;
    ACBrReinf: TACBrReinf;
    ACBrSintegra: TACBrSintegra;
    ACBrSPEDContabil: TACBrSPEDContabil;
    ACBrSPEDFiscal: TACBrSPEDFiscal;
    ACBrSpedContribuicoes: TACBrSPEDPisCofins;
    procedure DataModuleCreate(Sender: TObject);
  private

  public

  end;

var
  FDataModule: TFDataModule;

implementation

{$R *.lfm}

{ TFDataModule }

procedure TFDataModule.DataModuleCreate(Sender: TObject);
begin

end;

end.

