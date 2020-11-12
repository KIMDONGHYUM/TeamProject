package com.study.springboot.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.MemberDto;

 
public interface IMemberService {
	
	/* public Date stringToDate(MemberDto member); */
	
	public int insertMember(MemberDto member);
	
	public MemberDto getUserInfo(String id);
	
	public int updateMember(MemberDto member);
	
	public int deleteMember(@Param("id") String id,@Param("pw") String pw);
	
	public int loginCheck(String id, String pw);
	
	public ArrayList<MemberDto> userList();
	
	public int idCheck(String id);
	
	public int updatePicture(MemberDto member);
	
	public int insertPicture(MemberDto member);

	public ArrayList<MemberDto> mlist(String id);
	
	public int deletePicture(MemberDto member);
	
	public int updatePassword(@Param("id") String id,  @Param("password") String password);
	
	public int getPassword(@Param("id") String id);
}
