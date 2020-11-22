package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IDpReasonDao;
import com.study.springboot.dto.DpReasonDto;

@Service
public class DpReasonService implements IDpReasonService{

	@Autowired
	IDpReasonDao dao;
	
	@Override
	public int InsertReason(DpReasonDto dto) {
		int nResult = dao.InsertReason(dto);
		return nResult;
	}

	@Override
	public List<DpReasonDto> list() {
		return dao.list();
	}

}
