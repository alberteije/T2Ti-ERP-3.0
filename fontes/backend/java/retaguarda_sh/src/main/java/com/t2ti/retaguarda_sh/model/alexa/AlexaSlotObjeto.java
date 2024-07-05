package com.t2ti.retaguarda_sh.model.alexa;

import java.io.Serializable;

public class AlexaSlotObjeto implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String name;
	private String value;
	private String confirmationStatus;

	public AlexaSlotObjeto() {}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getConfirmationStatus() {
		return confirmationStatus;
	}

	public void setConfirmationStatus(String confirmationStatus) {
		this.confirmationStatus = confirmationStatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}



}