	package com.springboot.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfigure extends WebSecurityConfigurerAdapter {
	///
	@Autowired
	DataSource securityDataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(securityDataSource);
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.sessionManagement()
		.maximumSessions(1);
		http.authorizeRequests()
		
		// guest
		.antMatchers("/source/**").permitAll()
		.antMatchers("/").permitAll()
		.antMatchers("/loginPage/**").permitAll()
		.antMatchers("/home/**").permitAll()
		.antMatchers("/search/**").permitAll()
		.antMatchers("/product/**").permitAll()
		.antMatchers("/cart/**").permitAll()
		
		// payment
		.antMatchers("/pay/**").hasRole("CUSTOMER") 
		
		// (edit account for personal user)
		.antMatchers("/account/**").hasRole("CUSTOMER") 
		
		// (add, update product) & (manage order, orderDetail)
		.antMatchers("/employee/**").hasRole("EMPLOYEE") 
		
		// (manage all account, system...)
		.antMatchers("/system/**").hasRole("ADMIN") 
		
		.and()
		.formLogin()
		.loginPage("/")
		.loginProcessingUrl("/loginPage/loging")
		.failureUrl("/loginPage/view?error")
		.defaultSuccessUrl("/index",true)
		.permitAll()
		.and()
		.logout()
		.logoutSuccessUrl("/index")
		.permitAll()
		.and()
		.exceptionHandling().accessDeniedPage("/error/access-denied");
		
	}
	
}
