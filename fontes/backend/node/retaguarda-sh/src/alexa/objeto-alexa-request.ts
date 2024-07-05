import { AlexaSession } from "./alexa-session";
import { AlexaContext } from "./alexa-context";
import { AlexaRequest } from "./alexa-request";

export class ObjetoAlexaRequest {

    version: string;
    session: AlexaSession;
    context: AlexaContext;
    request: AlexaRequest;

	/**
	* Constructor
	*/
	constructor(objetoJson: object) {
		if (objetoJson != null) {
			this.version = objetoJson['version'];
			this.session = objetoJson['session'];
			this.context = objetoJson['context'];
			this.request = objetoJson['request'];
		}	
	}

}