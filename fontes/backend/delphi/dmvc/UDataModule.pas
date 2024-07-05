unit UDataModule;

interface

uses
  System.SysUtils, System.Classes, ACBrBase, ACBrSpedFiscal, ACBrSpedContabil;

type
  TFDataModule = class(TDataModule)
    ACBrSPEDContabil: TACBrSPEDContabil;
    ACBrSPEDFiscal: TACBrSPEDFiscal;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDataModule: TFDataModule;

implementation

{$R *.dfm}

end.
