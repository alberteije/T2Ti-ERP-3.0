export class AlexaSession  {
	
    new: boolean;
    sessionId: string;

	/**
	* Constructor
	*/
	constructor(objetoJson: object) {
		if (objetoJson != null) {
			this.new = objetoJson['new'];
			this.sessionId = objetoJson['sessionId'];
		}	
	}

}