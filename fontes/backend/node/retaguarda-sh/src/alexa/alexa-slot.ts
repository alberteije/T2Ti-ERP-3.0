import { AlexaSlotObjeto } from "./alexa-slot-objeto";

export class AlexaSlot {

	nomeUsuario: AlexaSlotObjeto;

	/**
	* Constructor
	*/
	constructor(objetoJson: object) {
		if (objetoJson != null) {
			this.nomeUsuario = objetoJson['nomeUsuario'];
		}	
	}

}