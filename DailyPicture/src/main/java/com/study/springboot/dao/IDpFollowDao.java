package com.study.springboot.dao;



import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.DpFollowDto;
import com.study.springboot.dto.FollowMemberDto;
import com.study.springboot.dto.MemberDto;



@Mapper
public interface IDpFollowDao {
	public int follow(String following, String follower);
	public ArrayList<DpFollowDto> followlist();
	public int unfollow(String following, String follower);
	public ArrayList<DpFollowDto> unfollowlist(@Param("follower") String follower);
	public ArrayList<MemberDto> memberlist(@Param("id") String id);
	public ArrayList<DpFollowDto> followerlist(@Param("following") String following);
	public ArrayList<FollowMemberDto> fmlist(@Param("following") String following);
	public ArrayList<FollowMemberDto> ufmlist(@Param("follower") String follower);
	public int delete(@Param("following") String following, @Param("follower") String follower);
	
}
