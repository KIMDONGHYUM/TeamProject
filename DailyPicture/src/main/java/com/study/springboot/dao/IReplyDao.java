package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.ReplyDto;



//MyBatis와 객체를 연결하는 어노테이션.
@Mapper
public interface IReplyDao {
	
	 public int replyCount() throws Exception;

	
	 
    public int replyInsert(ReplyDto rep) throws Exception;
	
	public List<ReplyDto> replyList(int myct_no, int board_no) throws Exception;
	
	 // 댓글 수정
    public int replyUpdate(ReplyDto rep) throws Exception;
 
    // 댓글 삭제
    public int replyDelete(int reply_no) throws Exception;

		
}







