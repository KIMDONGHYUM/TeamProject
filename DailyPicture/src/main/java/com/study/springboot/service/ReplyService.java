package com.study.springboot.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IReplyDao;
import com.study.springboot.dto.MyctDto;
import com.study.springboot.dto.ReplyDto;

@Service
public class ReplyService  implements IReplyService{
    
	@Autowired
	IReplyDao rdao;

	@Override
	public int inesrtReply(ReplyDto reply) {
		int nResult = rdao.insertReplyDao(reply);
		return nResult;
	}

	@Override
	public ArrayList<ReplyDto> replyList(int myct_no, int board_no, String writer_id) {
		ArrayList<ReplyDto> replyList = rdao.replyListDao(myct_no, board_no, writer_id);

		return replyList;
	}


	
    
	
	
}
