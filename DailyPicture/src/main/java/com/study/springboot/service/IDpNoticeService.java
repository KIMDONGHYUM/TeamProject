package com.study.springboot.service;

import java.util.ArrayList;


import com.study.springboot.dto.DpNoticeDto;

public interface IDpNoticeService {
	
	public int writeNotice(DpNoticeDto dto);
	public ArrayList<DpNoticeDto> list();
	public DpNoticeDto view_notice(String board_no_str);
	public int upHit(String board_no);

}
