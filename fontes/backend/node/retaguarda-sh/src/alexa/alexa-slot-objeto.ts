export class AlexaSlotObjeto {

	name: string;
    value: string;
    confirmationStatus: string;

	/**
	* Constructor
	*/
	constructor(objetoJson: object) {
		if (objetoJson != null) {
			this.name = objetoJson['name'];
			this.value = objetoJson['value'];
			this.confirmationStatus = objetoJson['confirmationStatus'];
		}	
	}

}