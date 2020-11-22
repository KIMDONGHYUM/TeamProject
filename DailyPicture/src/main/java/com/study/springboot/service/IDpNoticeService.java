package com.study.springboot.service;

import java.util.ArrayList;
import java.util.Date;

import com.study.springboot.dto.DpNoticeDto;

public interface IDpNoticeService {
	
	public int writeNotice(DpNoticeDto dto);
	public ArrayList<DpNoticeDto> list(String page);
	public DpNoticeDto view_notice(String board_no_str);
	public int upHit(String board_no);
	public int modify(String board_no, String title, String content, Date reg);
	public int delete(String board_no);
}
