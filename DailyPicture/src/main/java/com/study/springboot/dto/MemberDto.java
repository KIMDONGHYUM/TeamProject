package com.study.springboot.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MemberDto 
{
	private String name;
	private String id; 	
	private String password;	
	private String phone;
	private String mail;		
	private Date reg;
	private String picture;

	
	
}
