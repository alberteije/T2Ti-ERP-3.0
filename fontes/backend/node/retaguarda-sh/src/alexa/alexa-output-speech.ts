export class AlexaOutputSpeech {
    type: string;
    text: string;
    playBehavior: string;

	/**
	* Constructor
	*/
	constructor(objetoJson: object) {
		if (objetoJson != null) {
			this.type = objetoJson['type'];
			this.text = objetoJson['text'];
			this.playBehavior = objetoJson['playBehavior'];
		}	
	}

}