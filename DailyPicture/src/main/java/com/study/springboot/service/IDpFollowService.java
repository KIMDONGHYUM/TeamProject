package com.study.springboot.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.DpFollowDto;
import com.study.springboot.dto.MemberDto;

public interface IDpFollowService {
	public int follow(String following, String follower);
	public ArrayList<DpFollowDto> followlist();
	public int unfollow(String following, String follower);
	public ArrayList<DpFollowDto> unfollowlist(@Param("follower") String follower);
	public ArrayList<MemberDto> memberlist(@Param("id") String id);
}
