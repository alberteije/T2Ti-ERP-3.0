package com.t2ti.retaguarda_sh.model.alexa;

import java.io.Serializable;

public class AlexaResponse implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private boolean shouldEndSession;
	private AlexaOutputSpeech outputSpeech;

	public AlexaResponse() {}

	public boolean isShouldEndSession() {
		return shouldEndSession;
	}

	public void setShouldEndSession(boolean shouldEndSession) {
		this.shouldEndSession = shouldEndSession;
	}

	public AlexaOutputSpeech getOutputSpeech() {
		return outputSpeech;
	}

	public void setOutputSpeech(AlexaOutputSpeech outputSpeech) {
		this.outputSpeech = outputSpeech;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}