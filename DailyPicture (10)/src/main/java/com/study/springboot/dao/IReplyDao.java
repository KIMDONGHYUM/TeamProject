package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.ReplyDto;



//MyBatis와 객체를 연결하는 어노테이션.
@Mapper
public interface IReplyDao {
	
	public int replyset(@Param("id") String id, @Param("picture") String picture);
	
	 public int replyCount() throws Exception;

	
	 
    public int replyInsert(ReplyDto rep) throws Exception;
	
	public List<ReplyDto> replyList(int myct_no, int board_no) throws Exception;
	
	public List<ReplyDto> commentList() throws Exception;
	
	public int deleteRList(int board_no) throws Exception; 
	
	
	 // 댓글 수정
    public int replyUpdate(int reply_no, String content) throws Exception;
 
    // 댓글 삭제
    public int deleteReply(int reply_no) throws Exception;

		
}







