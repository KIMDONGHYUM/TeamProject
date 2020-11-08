package com.study.springboot.service;

import java.util.ArrayList;


import com.study.springboot.dto.ReplyDto;



public interface IReplyService {
		
	
	
	public int inesrtReply(ReplyDto reply);
	
	
	public ArrayList<ReplyDto> replyList(int myct_no, int board_no, String writer_id);
}
