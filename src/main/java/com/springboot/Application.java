package com.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {

	public static void main(String[] args) {
		System.setProperty("server.servlet.context-path", "/salehat");
		SpringApplication.run(Application.class, args);
	}

}
