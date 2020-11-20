package com.study.springboot.service;

import java.util.ArrayList;

import com.study.springboot.dto.MyctDto;
import com.study.springboot.dto.SearchCriteria;

public interface IMyctService {
		
	public int insertCt(MyctDto content);
	
//	public ArrayList<MyctDto> cList(String id);
	
	public ArrayList<MyctDto> cList(SearchCriteria scri) throws Exception;
	
	public ArrayList<MyctDto> ccList(SearchCriteria scri) throws Exception;
	
	public int Changno(int board_no, int no);
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public int deletePan(int board_no, String id);
	
	public int updatePan(MyctDto content);
	
	public MyctDto viewPan(String board_no);
}
