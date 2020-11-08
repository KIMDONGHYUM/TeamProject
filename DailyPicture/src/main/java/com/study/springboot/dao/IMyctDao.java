package com.study.springboot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.MyctDto;

//MyBatis와 객체를 연결하는 어노테이션.
@Mapper
public interface IMyctDao 
{
	
	
	public int insertCtDao(MyctDto content);
	
	
	
	public ArrayList<MyctDto> cListDao(String id);
	
	
	public int deletePanDao(int board_no, String id);
	
	public int updatePan(MyctDto content);
	
	
}

