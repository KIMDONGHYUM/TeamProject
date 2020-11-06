package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.ReplyDto;



//MyBatis와 객체를 연결하는 어노테이션.
@Mapper
public interface IReplyDao 
{
	
	
	public int insertReplyDao(ReplyDto reply);
		
}

