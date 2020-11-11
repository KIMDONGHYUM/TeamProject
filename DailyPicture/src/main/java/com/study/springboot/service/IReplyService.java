package com.study.springboot.service;

import java.util.List;

import com.study.springboot.dto.ReplyDto;



public interface IReplyService {
		
	
	
	public int replyInsert(ReplyDto rep) throws Exception;
	
	
	public List<ReplyDto> replyList(int myct_no, int board_no) throws Exception;
}
