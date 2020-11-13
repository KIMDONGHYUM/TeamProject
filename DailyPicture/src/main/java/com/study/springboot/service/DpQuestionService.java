package com.study.springboot.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IDpQuestionDao;
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
	public ArrayList<DpQuestionDto> list() {
		ArrayList<DpQuestionDto> list=dao.list();
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
