package com.study.springboot.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MemberDto 
{
	private String name;
	private String id; 	// 비밀번호
	private String password;		// 이름
	private String phone;
	private String mail;		// 성별
	private Date reg;
	private String picture;
	//기본생성자함수
//	public SimpleBbsDto() {
//		
//	}
	//Getter/Setter함수
	
	
	
}
