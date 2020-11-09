package com.study.springboot.service;

import java.util.ArrayList;

import com.study.springboot.dto.MyctDto;

public interface IMyctService {
		
	public int insertCt(MyctDto content);
	
	public ArrayList<MyctDto> cList(String id);
	
	public int deletePan(int board_no, String id);
	
	public int updatePan(MyctDto content);
	
	public MyctDto viewPan(String board_no);
}
