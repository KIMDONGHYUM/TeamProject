package com.study.springboot.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IMyctDao;
import com.study.springboot.dto.MyctDto;
import com.study.springboot.dto.SearchCriteria;


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
	public ArrayList<MyctDto> cList(SearchCriteria scri) throws Exception {
		ArrayList<MyctDto> clist = mdao.cListDao(scri);
		return clist;
	}
	
	@Override
	public ArrayList<MyctDto> ccList(SearchCriteria scri) throws Exception {
		
		ArrayList<MyctDto> cclist = mdao.ccListDao(scri);
		
		return cclist;
	}
	
	@Override
	public int Changno(int board_no, int no) {
	    int nResult = mdao.ChangnoDao(board_no, no);
		return nResult;
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return mdao.listCount(scri);
	}
	
	
	@Override
	public int deletePan(int board_no, String id) {
		int nResult = mdao.deletePanDao(board_no, id);
		return nResult;
	}
	
	@Override
	public int updatePan(MyctDto content) {
			int nResult = mdao.updatePan(content);
			return nResult;
		}

	@Override
	public MyctDto viewPan(String board_no) {
		 
		return mdao.viewPanDao(board_no);
	}

	
	

	
	
	

	
}
