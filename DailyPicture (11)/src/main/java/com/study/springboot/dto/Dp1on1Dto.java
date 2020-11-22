package com.study.springboot.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Dp1on1Dto {
	private int bid;
	private int board_no;
	private String title;
	private String category;
	private String content;
	private String writer;
	private String picture;
	private Date reg;
}
