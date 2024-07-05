import { AlexaIntent } from "./alexa-intent";

export class AlexaRequest  {

	type: string;
    requestId: string;
    timestamp: string;
    locale: string;
    dialogState: string;
    intent: AlexaIntent;

	/**
	* Constructor
	*/
	constructor(objetoJson: object) {
		if (objetoJson != null) {
			this.type = objetoJson['type'];
			this.requestId = objetoJson['requestId'];
			this.timestamp = objetoJson['timestamp'];
			this.locale = objetoJson['locale'];
			this.dialogState = objetoJson['dialogState'];
			this.intent = objetoJson['intent'];
		}	
	}

}