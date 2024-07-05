unit ObjetoAlexaRequest;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase, System.SysUtils, Generics.Collections;

type

  [MVCNameCase(ncLowerCase)]
  TAlexaSession = class(TModelBase)
  private
    FNew: Boolean;
    FSessionId: string;
  public
		[MVCNameAsAttribute('new')]
		property New: Boolean read FNew write FNew;
		[MVCNameAsAttribute('sessionId')]
		property SessionId: string read FSessionId write FSessionId;
  end;

  [MVCNameCase(ncLowerCase)]
  TAlexaContext = class(TModelBase)
  private
  public
  end;

  [MVCNameCase(ncLowerCase)]
  TAlexaSlotObjeto = class(TModelBase)
  private
    FName: string;
    FValor: string;
    FConfirmationStatus: string;
  public
		[MVCNameAsAttribute('name')]
		property Name: string read FName write FName;
		[MVCNameAsAttribute('value')]
		property Valor: string read FValor write FValor;
		[MVCNameAsAttribute('confirmationStatus')]
		property ConfirmationStatus: string read FConfirmationStatus write FConfirmationStatus;
  end;

  [MVCNameCase(ncLowerCase)]
  TAlexaSlot = class(TModelBase)
  private
    FObjetoSlot: TAlexaSlotObjeto;
  public
		[MVCNameAsAttribute('nomeUsuario')]
		property ObjetoSlot: TAlexaSlotObjeto read FObjetoSlot write FObjetoSlot;
  end;

  [MVCNameCase(ncLowerCase)]
  TAlexaIntent = class(TModelBase)
  private
    FName: string;
    FConfirmationStatus: string;
    FSlot: TAlexaSlot;
  public
		[MVCNameAsAttribute('name')]
		property Name: string read FName write FName;
		[MVCNameAsAttribute('confirmationStatus')]
		property ConfirmationStatus: string read FConfirmationStatus write FConfirmationStatus;
		[MVCNameAsAttribute('slots')]
		property Slot: TAlexaSlot read FSlot write FSlot;
  end;

  [MVCNameCase(ncLowerCase)]
  TAlexaRequest = class(TModelBase)
  private
    FTypeRequest: string;
    FRequestId: string;
    FTimestamp: string;
    FLocale: string;
    FDialogState: string;
    FAlexaIntent: TAlexaIntent;
  public
		[MVCNameAsAttribute('type')]
		property TypeRequest: string read FTypeRequest write FTypeRequest;
		[MVCNameAsAttribute('requestId')]
		property RequestId: string read FRequestId write FRequestId;
		[MVCNameAsAttribute('timestamp')]
		property Timestamp: string read FTimestamp write FTimestamp;
		[MVCNameAsAttribute('locale')]
		property Locale: string read FLocale write FLocale;

		[MVCNameAsAttribute('dialogState')]
		property DialogState: string read FDialogState write FDialogState;
		[MVCNameAsAttribute('intent')]
		property AlexaIntent: TAlexaIntent read FAlexaIntent write FAlexaIntent;
  end;

  [MVCNameCase(ncLowerCase)]
  TObjetoAlexaRequest = class(TModelBase)
  private
    FVersion: string;
    FAlexaSession: TAlexaSession;
    FAlexaContext: TAlexaContext;
    FAlexaRequest: TAlexaRequest;
  public
    constructor Create; virtual;
    destructor Destroy; override;

		[MVCNameAsAttribute('version')]
		property Version: string read FVersion write FVersion;
		[MVCNameAsAttribute('session')]
		property AlexaSession: TAlexaSession read FAlexaSession write FAlexaSession;
		[MVCNameAsAttribute('context')]
		property AlexaContext: TAlexaContext read FAlexaContext write FAlexaContext;
		[MVCNameAsAttribute('request')]
		property AlexaRequest: TAlexaRequest read FAlexaRequest write FAlexaRequest;
  end;

implementation

constructor TObjetoAlexaRequest.Create;
begin
  inherited;

  FAlexaSession := TAlexaSession.Create;
  FAlexaContext := TAlexaContext.Create;
  FAlexaRequest := TAlexaRequest.Create;
  FAlexaRequest.FAlexaIntent := TAlexaIntent.Create;
  FAlexaRequest.FAlexaIntent.FSlot := TAlexaSlot.Create;
  FAlexaRequest.FAlexaIntent.FSlot.FObjetoSlot := TAlexaSlotObjeto.Create;
end;

destructor TObjetoAlexaRequest.Destroy;
begin
  FreeAndNil(FAlexaSession);
  FreeAndNil(FAlexaContext);
  FreeAndNil(FAlexaRequest.FAlexaIntent.FSlot.FObjetoSlot);
  FreeAndNil(FAlexaRequest.FAlexaIntent.FSlot);
  FreeAndNil(FAlexaRequest.FAlexaIntent);
  FreeAndNil(FAlexaRequest);
  inherited;
end;


end.
