package com.study.springboot.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IDp1on1Dao;
import com.study.springboot.dto.Dp1on1Dto;
import com.study.springboot.dto.DpQuestionDto;

@Service
public class Dp1on1Service implements IDp1on1Service{

	@Autowired
	IDp1on1Dao dao;
	
	@Override
	public int write1on1(Dp1on1Dto dto) {
		int nResult = dao.write1on1(dto);
		return nResult;
	}

	@Override
	public ArrayList<Dp1on1Dto> list() {
		ArrayList<Dp1on1Dto> list=dao.list();
		return list;
	}

	@Override
	public Dp1on1Dto view_1on1(String board_no_str) {
		return dao.view_1on1(board_no_str);
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

	@Override
	public String getWriter(String board_no) {
		String writer = dao.getWriter(board_no);
		return writer;
	}

}
