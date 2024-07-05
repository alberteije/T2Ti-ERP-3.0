package com.t2ti.retaguarda_sh.model.alexa;

import java.io.Serializable;

public class AlexaSlot implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private AlexaSlotObjeto nomeUsuario;

	public AlexaSlot() {}

	public AlexaSlotObjeto getNomeUsuario() {
		return nomeUsuario;
	}

	public void setNomeUsuario(AlexaSlotObjeto nomeUsuario) {
		this.nomeUsuario = nomeUsuario;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}