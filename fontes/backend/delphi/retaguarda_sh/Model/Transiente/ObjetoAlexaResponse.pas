unit ObjetoAlexaResponse;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase, System.SysUtils;

type

  [MVCNameCase(ncLowerCase)]
  TAlexaOutputSpeech = class(TModelBase)
  private
    FTypeSpeech: string;
    FText: string;
    FPlayBehavior: string;
  public
		[MVCNameAsAttribute('type')]
		property TypeSpeech: string read FTypeSpeech write FTypeSpeech;
		[MVCNameAsAttribute('text')]
		property Text: string read FText write FText;
		[MVCNameAsAttribute('playBehavior')]
		property PlayBehavior: string read FPlayBehavior write FPlayBehavior;
  end;

  [MVCNameCase(ncLowerCase)]
  TAlexaResponse = class(TModelBase)
  private
    FShouldEndSession: Boolean;
    FAlexaOutputSpeech: TAlexaOutputSpeech;
  public
		[MVCNameAsAttribute('shouldEndSession')]
		property ShouldEndSession: Boolean read FShouldEndSession write FShouldEndSession;
		[MVCNameAsAttribute('outputSpeech')]
		property AlexaOutputSpeech: TAlexaOutputSpeech read FAlexaOutputSpeech write FAlexaOutputSpeech;
  end;

  [MVCNameCase(ncLowerCase)]
  TObjetoAlexaResponse = class(TModelBase)
  private
    FVersion: string;
    FAlexaResponse: TAlexaResponse;
  public
    constructor Create; virtual;
    destructor Destroy; override;

		[MVCNameAsAttribute('version')]
		property Version: string read FVersion write FVersion;
		[MVCNameAsAttribute('response')]
		property AlexaResponse: TAlexaResponse read FAlexaResponse write FAlexaResponse;
  end;

implementation

constructor TObjetoAlexaResponse.Create;
begin
  inherited;

  FAlexaResponse := TAlexaResponse.Create;
  FAlexaResponse.FAlexaOutputSpeech := TAlexaOutputSpeech.Create;
end;

destructor TObjetoAlexaResponse.Destroy;
begin
  FreeAndNil(FAlexaResponse.FAlexaOutputSpeech);
  FreeAndNil(FAlexaResponse);
  inherited;
end;



end.
