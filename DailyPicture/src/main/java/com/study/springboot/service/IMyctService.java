package com.study.springboot.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.MyctDto;

public interface IMyctService {
		
	public int insertCt(MyctDto content);
	
	public ArrayList<MyctDto> cList(String id);
	
	public int deletePan(int board_no, String id);
	
	public int updatePan(MyctDto content);
}
