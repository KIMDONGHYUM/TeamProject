package com.study.springboot.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class DpNoticeDto {
	private int board_no;
	private String title;
	private String content;
	private String file1;
	private String file2;
	private String writer;
	private Date reg;
	private int hit;
}
