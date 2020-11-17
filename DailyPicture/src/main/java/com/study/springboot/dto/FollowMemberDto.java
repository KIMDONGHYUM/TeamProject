package com.study.springboot.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class FollowMemberDto {
	private String name;
	private String id; 	// 비밀번호
	private String password;		// 이름
	private String phone;
	private String mail;		// 성별
	private Date reg;
	private String picture;
	private String following;	//팔로우를 받는 사람
	private String follower;	//팔로우를 거는 사람(세션아이디)
}
