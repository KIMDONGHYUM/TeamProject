package com.study.springboot.dao;



import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.DpFollowDto;
import com.study.springboot.dto.MemberDto;



@Mapper
public interface IDpFollowDao {
	public int follow(String following, String follower);
	public ArrayList<DpFollowDto> followlist();
	public int unfollow(String following, String follower);
	public ArrayList<DpFollowDto> unfollowlist(@Param("follower") String follower);
	public ArrayList<MemberDto> memberlist(@Param("id") String id);
}
