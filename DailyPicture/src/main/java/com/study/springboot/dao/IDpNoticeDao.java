package com.study.springboot.dao;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.DpNoticeDto;

@Mapper
public interface IDpNoticeDao {
	public int writeNotice(DpNoticeDto dto);
	public ArrayList<DpNoticeDto> list();
	public DpNoticeDto view_notice(String board_no_str);
	public int upHit(String board_no);
	public int modify(String board_no, String title, String content, Date reg);
	public int delete(String board_no);
	
	
}
