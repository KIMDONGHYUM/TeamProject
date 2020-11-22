package com.study.springboot.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class DpFollowDto {
	private int id;				//조인넘버
	private String following;	//팔로우를 받는 사람
	private String follower;	//팔로우를 거는 사람(세션아이디)
}
