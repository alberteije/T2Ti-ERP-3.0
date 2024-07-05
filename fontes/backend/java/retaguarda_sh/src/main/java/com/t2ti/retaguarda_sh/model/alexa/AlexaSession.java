package com.t2ti.retaguarda_sh.model.alexa;

import java.io.Serializable;

public class AlexaSession implements Serializable {
	private static final long serialVersionUID = 1L;
	
	public boolean neu;
	public String sessionId;
	
	public AlexaSession() {}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public boolean isNeu() {
		return neu;
	}

	public void setNeu(boolean neu) {
		this.neu = neu;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}


}