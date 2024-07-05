package com.t2ti.retaguarda_sh.model.alexa;

import java.io.Serializable;

public class ObjetoAlexaRequest implements Serializable {
	private static final long serialVersionUID = 1L;

	private String version;
	private AlexaSession session;
	private AlexaContext context;
	private AlexaRequest request;

	public ObjetoAlexaRequest() {}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public AlexaSession getSession() {
		return session;
	}

	public void setSession(AlexaSession session) {
		this.session = session;
	}

	public AlexaContext getContext() {
		return context;
	}

	public void setContext(AlexaContext context) {
		this.context = context;
	}

	public AlexaRequest getRequest() {
		return request;
	}

	public void setRequest(AlexaRequest request) {
		this.request = request;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}