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
	public ArrayList<DpNoticeDto> list() {
		ArrayList<DpNoticeDto> list=dao.list();
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
}
