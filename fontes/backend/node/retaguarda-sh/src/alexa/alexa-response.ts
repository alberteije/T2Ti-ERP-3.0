import { AlexaOutputSpeech } from "./alexa-output-speech";

export class AlexaResponse {

	shouldEndSession: boolean;
    outputSpeech: AlexaOutputSpeech;

	/**
	* Constructor
	*/
	constructor(objetoJson: object) {
		if (objetoJson != null) {
			this.shouldEndSession = objetoJson['shouldEndSession'];
			this.outputSpeech = objetoJson['outputSpeech'];
		}	
	}

}