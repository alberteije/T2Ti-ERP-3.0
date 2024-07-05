import { AlexaSlot } from "./alexa-slot";

export class AlexaIntent {

    name: string;
    confirmationStatus: string;
    slots: AlexaSlot;

	/**
	* Constructor
	*/
	constructor(objetoJson: object) {
		if (objetoJson != null) {
			this.name = objetoJson['name'];
			this.confirmationStatus = objetoJson['confirmationStatus'];
			this.slots = objetoJson['slots'];
		}	
	}

}