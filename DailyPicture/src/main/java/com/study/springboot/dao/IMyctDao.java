package com.study.springboot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.MyctDto;
import com.study.springboot.dto.SearchCriteria;

//MyBatis와 객체를 연결하는 어노테이션.
@Mapper
public interface IMyctDao 
{
	
	
	public int insertCtDao(MyctDto content);
	
	
	
	/* public ArrayList<MyctDto> cListDao(String id); */
	//가서 물어보기 
	public ArrayList<MyctDto> cListDao(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;

	
	public int deletePanDao(int board_no, String id);
	
	public int updatePan(MyctDto content);
	
	
	public  MyctDto viewPanDao(String board_no);

}

