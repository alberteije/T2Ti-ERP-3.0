package com.t2ti.retaguarda_sh.model.alexa;

import java.io.Serializable;

public class AlexaIntent implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String name;
	private String confirmationStatus;
	private AlexaSlot slots;

	public AlexaIntent() {}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getConfirmationStatus() {
		return confirmationStatus;
	}

	public void setConfirmationStatus(String confirmationStatus) {
		this.confirmationStatus = confirmationStatus;
	}

	public AlexaSlot getSlots() {
		return slots;
	}

	public void setSlots(AlexaSlot slots) {
		this.slots = slots;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}