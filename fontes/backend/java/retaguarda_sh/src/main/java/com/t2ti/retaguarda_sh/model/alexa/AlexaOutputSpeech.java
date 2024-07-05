package com.t2ti.retaguarda_sh.model.alexa;

import java.io.Serializable;

public class AlexaOutputSpeech implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String type;
	private String text;
	private String playBehavior;

	public AlexaOutputSpeech() {}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getPlayBehavior() {
		return playBehavior;
	}

	public void setPlayBehavior(String playBehavior) {
		this.playBehavior = playBehavior;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}