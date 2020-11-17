package com.study.springboot.service;



import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IDpFollowDao;
import com.study.springboot.dto.DpFollowDto;
import com.study.springboot.dto.FollowMemberDto;
import com.study.springboot.dto.MemberDto;

@Service
public class DpFollowService implements IDpFollowService{

	@Autowired
	IDpFollowDao dao;
	
	@Override
	public int follow(String following, String follower) {
		int nResult = dao.follow(following, follower);
		return nResult;
	}

	@Override
	public int unfollow(String following, String follower) {
		int nResult = dao.unfollow(following, follower);
		return nResult;
	}

	@Override
	public ArrayList<DpFollowDto> followlist() {
		return dao.followlist();
	}

	@Override
	public ArrayList<DpFollowDto> unfollowlist(String follower) {
		return dao.unfollowlist(follower);
	}

	@Override
	public ArrayList<MemberDto> memberlist(String id) {
		return dao.memberlist(id);
	}

	@Override
	public ArrayList<DpFollowDto> followerlist(String following) {
		return dao.followerlist(following);
	}

	@Override
	public ArrayList<FollowMemberDto> fmlist(String following) {
		return dao.fmlist(following);
	}

	@Override
	public ArrayList<FollowMemberDto> ufmlist(String follower) {
		return dao.ufmlist(follower);
	}

	@Override
	public int delete(String following, String follower) {
		int nResult = dao.delete(following, follower);
		return nResult;
	}

	

}
