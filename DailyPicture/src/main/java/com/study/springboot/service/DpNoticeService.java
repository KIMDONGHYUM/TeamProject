package com.study.springboot.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IDpNoticeDao;
import com.study.springboot.dto.DpNoticeDto;

@Service
public class DpNoticeService implements IDpNoticeService {
	
	@Autowired
	IDpNoticeDao dao;


	@Override
	public ArrayList<DpNoticeDto> list(String page) {
		int num_page_no = Integer.parseInt(page);	//page번호 
		int num_page_size = 10;	// 한 페이지당 줄갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; //페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size);	//페이지 끝 줄번호
		
		System.out.println("startRowNum:"+startRowNum);
		System.out.println("endRowNum:"+endRowNum);
		
		ArrayList<DpNoticeDto> list=dao.list(startRowNum, endRowNum);
		return list;
	}

	@Override
	public int writeNotice(DpNoticeDto dto) {
		int nResult = dao.writeNotice(dto);
		return nResult;
	}

	@Override
	public DpNoticeDto view_notice(String board_no_str) {
		dao.upHit(board_no_str);
		return dao.view_notice(board_no_str);
	}

	@Override
	public int upHit(String board_no) {
		int nResult = dao.upHit(board_no);
		return nResult;
	}

	@Override
	public int modify(String board_no, String title, String content, Date reg) {
		int nResult = dao.modify(board_no, title, content, reg);
		return nResult;
	}

	@Override
	public int delete(String board_no) {
		int nResult = dao.delete(board_no);
		return nResult;
	}

	
}
