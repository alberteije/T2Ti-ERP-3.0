import { AlexaResponse } from "./alexa-response";

export class ObjetoAlexaResponse {
    version: string;
    response: AlexaResponse;

	/**
	* Constructor
	*/
	constructor(objetoJson: object) {
		if (objetoJson != null) {
			this.version = objetoJson['version'];
			this.response = objetoJson['response'];
		}	
	}

}