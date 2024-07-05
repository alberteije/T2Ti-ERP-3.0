package com.t2ti.retaguarda_sh.model.alexa;

import java.io.Serializable;

public class AlexaRequest implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String type;
	private String requestId;
	private String timestamp;
	private String locale;
	private String dialogState;
	private AlexaIntent intent;	

	public AlexaRequest() {}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRequestId() {
		return requestId;
	}

	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public String getLocale() {
		return locale;
	}

	public void setLocale(String locale) {
		this.locale = locale;
	}

	public String getDialogState() {
		return dialogState;
	}

	public void setDialogState(String dialogState) {
		this.dialogState = dialogState;
	}

	public AlexaIntent getIntent() {
		return intent;
	}

	public void setIntent(AlexaIntent intent) {
		this.intent = intent;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}