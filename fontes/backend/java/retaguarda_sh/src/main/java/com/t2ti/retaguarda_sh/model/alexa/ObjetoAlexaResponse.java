package com.t2ti.retaguarda_sh.model.alexa;

import java.io.Serializable;

public class ObjetoAlexaResponse implements Serializable {
	private static final long serialVersionUID = 1L;

	private String version;
	private AlexaResponse response;

	public ObjetoAlexaResponse() {}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public AlexaResponse getResponse() {
		return response;
	}

	public void setResponse(AlexaResponse response) {
		this.response = response;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}