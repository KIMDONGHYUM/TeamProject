package com.study.springboot.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IDpQuestionDao;
import com.study.springboot.dto.DpNoticeDto;
import com.study.springboot.dto.DpQuestionDto;

@Service
public class DpQuestionService implements IDpQuestionService{
	
	@Autowired
	IDpQuestionDao dao;

	@Override
	public int writeQuestion(DpQuestionDto dto) {
		int nResult = dao.writeQuestion(dto);
		return nResult;
	}

	@Override
	public ArrayList<DpQuestionDto> list(String page) {
		int num_page_no = Integer.parseInt(page);	//page번호 
		int num_page_size = 10;	// 한 페이지당 줄갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; //페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size);	//페이지 끝 줄번호
		
		System.out.println("startRowNum:"+startRowNum);
		System.out.println("endRowNum:"+endRowNum);
		
		ArrayList<DpQuestionDto> list=dao.list(startRowNum, endRowNum);
		return list;
	}

	@Override
	public DpQuestionDto view_question(String board_no_str) {
		return dao.view_question(board_no_str);
	}

	@Override
	public int modify(String board_no, String title, String category, String content, Date reg) {
		int nResult = dao.modify(board_no, title, category, content, reg);
		return nResult;
	}

	@Override
	public int delete(String board_no) {
		int nResult = dao.delete(board_no);
		return nResult;
	}

	

	
	
	
}
