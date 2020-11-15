package com.study.springboot.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class DpFollowDto {
	private int id;
	private String following;
	private String follower;
}
