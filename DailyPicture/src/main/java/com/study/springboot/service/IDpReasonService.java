package com.study.springboot.service;

import java.util.List;

import com.study.springboot.dto.DpReasonDto;

public interface IDpReasonService {
	//회원탈퇴 시 탈퇴사유
	public int InsertReason(DpReasonDto dto);
	
	//탈퇴사유 리스트
	public List<DpReasonDto> list();
}
