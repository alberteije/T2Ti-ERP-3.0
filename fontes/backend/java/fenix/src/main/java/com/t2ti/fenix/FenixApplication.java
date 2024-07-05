package com.t2ti.fenix;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class FenixApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(FenixApplication.class, args);
	}

}
