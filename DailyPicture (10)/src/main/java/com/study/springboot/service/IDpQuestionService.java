package com.study.springboot.service;

import java.util.ArrayList;
import java.util.Date;

import com.study.springboot.dto.DpQuestionDto;

public interface IDpQuestionService {

	public int writeQuestion(DpQuestionDto dto);
	public ArrayList<DpQuestionDto> list();
	public DpQuestionDto view_question(String board_no_str);
	public int modify(String board_no, String title, String category, String content, Date reg);
	public int delete(String board_no);
}
