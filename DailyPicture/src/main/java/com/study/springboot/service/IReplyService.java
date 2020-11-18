package com.study.springboot.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.ReplyDto;



public interface IReplyService {
		
	public int replyset(@Param("id") String id,  @Param("picture") String picture);	
	
	public int replyInsert(ReplyDto rep) throws Exception;
	
	
	public List<ReplyDto> replyList(int myct_no, int board_no) throws Exception;
	
	public List<ReplyDto> commentList() throws Exception;
	
	
	
	public int deleteRList(int board_no) throws Exception; 
	
	public int deleteReply(int reply_no) throws Exception;
	
	 public int replyUpdate(int reply_no, String content) throws Exception;
	 
	 
	
	
	
}
