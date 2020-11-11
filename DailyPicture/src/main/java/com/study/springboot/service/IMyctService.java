package com.study.springboot.service;

import java.util.ArrayList;

import com.study.springboot.dto.Criteria;
import com.study.springboot.dto.MyctDto;

public interface IMyctService {
		
	public int insertCt(MyctDto content);
	
//	public ArrayList<MyctDto> cList(String id);
	
	public ArrayList<MyctDto> cList(Criteria cri) throws Exception;
	
	public int listCount(String id) throws Exception;
	
	public int deletePan(int board_no, String id);
	
	public int updatePan(MyctDto content);
	
	public MyctDto viewPan(String board_no);
}
