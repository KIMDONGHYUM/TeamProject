package com.study.springboot.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IMyctDao;
import com.study.springboot.dto.MyctDto;

@Service
public class MyctService  implements IMyctService{
    
	@Autowired
	IMyctDao mdao;
    
	@Override
	public int insertCt(MyctDto content) {
		int nResult = mdao.insertCtDao(content);
		return nResult;
	}

	@Override
	public ArrayList<MyctDto> cList(String id) {
		ArrayList<MyctDto> clist = mdao.cListDao(id);
		return clist;
	}
	
	
	@Override
	public int deletePan(int board_no, String id) {
		int nResult = mdao.deletePanDao(board_no, id);
		return nResult;
	}

	
}
