package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.DpReasonDto;

@Mapper
public interface IDpReasonDao {
	//회원탈퇴 시 탈퇴사유
	public int InsertReason(DpReasonDto dto);
	
	//탈퇴사유 리스트
	public List<DpReasonDto> list();
}
