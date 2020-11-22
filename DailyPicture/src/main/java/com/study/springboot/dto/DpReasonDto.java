package com.study.springboot.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class DpReasonDto {
	private int no;
	private String id;
	private String reason;
	private String opinion;
	private Date reg;
}
