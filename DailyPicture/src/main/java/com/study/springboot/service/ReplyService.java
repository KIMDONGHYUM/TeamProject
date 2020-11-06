package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IReplyDao;
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
	
    
	
	
}
