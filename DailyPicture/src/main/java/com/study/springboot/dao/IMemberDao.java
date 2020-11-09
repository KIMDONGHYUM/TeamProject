package com.study.springboot.dao;

import java.sql.Date;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.MemberDto;

//MyBatis와 객체를 연결하는 어노테이션.
@Mapper
public interface IMemberDao 
{
	public Date stringToDateDao(MemberDto member);
	
	public int insertMemberDao(MemberDto member);
	
	public MemberDto getUserInfoDao(String id);
	
	//추가한 파일
	public MemberDto UserInfoDao(String id);
	
	public int updateMemberDao(MemberDto member);
	
	public int deleteMemberDao(@Param("id") String id,@Param("pw") String pw);
	
	public int loginCheckDao(@Param("id") String id, @Param("pw") String pw);
	
	public ArrayList<MemberDto> userListDao();
	
	public int idCheckDao(@Param("id") String id);
	
	public int updatePicture(MemberDto member);
	
	public int insertPicture(MemberDto member);
	
	public ArrayList<MemberDto> mlistDao(String id);
	
	public int deletePicture(MemberDto member);
	
	public int updatePassword(@Param("id") String id, @Param("password") String password);
	
	public int getPassword(@Param("id") String id);
}

