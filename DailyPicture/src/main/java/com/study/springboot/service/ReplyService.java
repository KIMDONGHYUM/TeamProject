package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IReplyDao;
import com.study.springboot.dto.ReplyDto;

@Service("com.study.springboot.service.ReplySerivce")
public class ReplyService  implements IReplyService{
     
	
	
	@Autowired
	IReplyDao rdao;

	@Override
	public int replyInsert(ReplyDto rep) throws Exception {
		
			 return rdao.replyInsert(rep);
			
		}

	

	@Override
	public List<ReplyDto> replyList(int myct_no, int board_no) throws Exception {
	
		return rdao.replyList(myct_no, board_no);
	}



	@Override
	public int replyset(String id, String picture) {
		
		return rdao.replyset(id, picture);
	}




	
    
	
	
}
