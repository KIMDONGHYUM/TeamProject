package com.study.springboot.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ReplyDto {
	 private int myct_no;  //게시판 구분 번호 ex)상담게시판인지 게시글 게시판인지
	 private int board_no; //게시판의 번호 
	 private String user_id; //사용자 아이디
	 private String content; //내용
	 private Date reg; //날짜
	 private String writer;   //게시판게시자
	 
	 
		
		

		
		
	}


