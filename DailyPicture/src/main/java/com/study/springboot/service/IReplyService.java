package com.study.springboot.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.ReplyDto;



 public interface IReplyService {
		
	public int replyset(@Param("id") String id,  @Param("picture") String picture);	
	
	public int replyInsert(ReplyDto rep) throws Exception;
	
	public List<ReplyDto> replyList(int myct_no, int board_no) throws Exception;
	
	public int deleteRList(int board_no) throws Exception; 
	
	public int deleteReply(int reply_no) throws Exception;
	
	public int replyUpdate(int reply_no, String content) throws Exception;
	 
	// 댓글 신고
	public int SingoreplyInsert(ReplyDto rep) throws Exception;
	
	// 댓글 신고 리스트
	public List<ReplyDto> SingoreplyList(int myct_no) throws Exception;
	
	// 댓글 신고 강퇴
    public int Singodelete(@Param("id") String id) throws Exception;

    // 아이디 정지했을 시 댓글 삭제
    public int SingodeleteReply(int board_no, String id, String content) throws Exception;
}
