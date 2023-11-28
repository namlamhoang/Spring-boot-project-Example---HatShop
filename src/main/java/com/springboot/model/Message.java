package com.springboot.model;

public class Message {
	
	private boolean error = false;
	
	private String message;
	
	public Message() {
		// TODO Auto-generated constructor stub
	}

	public Message(boolean error, String message) {
		super();
		this.error = error;
		this.message = message;
	}

	public boolean isError() {
		return error;
	}

	public void setError(boolean error) {
		this.error = error;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
