package com.study.springboot.service;

import java.util.ArrayList;
import java.util.Date;

import com.study.springboot.dto.Dp1on1Dto;

public interface IDp1on1Service {
	public int write1on1(Dp1on1Dto dto);
	public ArrayList<Dp1on1Dto> list();
	public Dp1on1Dto view_1on1(String board_no_str);
	public int modify(String board_no, String title, String category, String content, Date reg);
	public int delete(String board_no);
	public String getWriter(String board_no);
}
