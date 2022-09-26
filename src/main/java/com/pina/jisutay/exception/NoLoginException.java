package com.pina.jisutay.exception;

public class NoLoginException extends RuntimeException {
	public NoLoginException(String url) {
		super(url);
	}
}
