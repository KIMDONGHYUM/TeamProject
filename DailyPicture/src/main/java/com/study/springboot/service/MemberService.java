package com.study.springboot.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IMemberDao;
import com.study.springboot.dto.MemberDto;


//@Service, @Controller, @Repository가 동일한 기능을 한다.
//해당 클래스의 객체들을 빈으로 등록하고 만들때 사용.

@Service
public class MemberService implements IMemberService{

	@Autowired
	IMemberDao dao;
	
	/*
	 * @Override public Date stringToDate(MemberDto member) { Date birthday =
	 * (Date)member.getBirth();
	 * 
	 * return birthday; }
	 */

	@Override
	public int insertMember(MemberDto member) {
		int nResult = dao.insertMemberDao(member);
		return nResult;
	}

	@Override
	public MemberDto getUserInfo(String id) {
		return dao.getUserInfoDao(id);
	}

	@Override
	public int updateMember(MemberDto member) {
		int nResult = dao.updateMemberDao(member);
		return nResult;
	}

	@Override
	public int deleteMember(String id, String pw) {
		int nResult = dao.deleteMemberDao(id,pw);
		return nResult;
	}


	@Override
	public int loginCheck(String id, String pw){
		int nResult = dao.loginCheckDao(id, pw);  //dto
		return  nResult;
	}
		
	
        
//		try {
//			 x = dao.loginCheckDao(id, pw);
//			
//			if(x != null)
//			{
//				
//				if(pw.equals(pw))
//					x = 1; //넘겨 받은 비번과 꺼내온 비번 비교. 같으면 인증 성공
//				else 
//					x = 0; // 인증실패
//			}else {
//				x = -1; //해당아이디가 없을 경우
//			}
//		
//	
//	
//		}catch(Exception e) {
//			throw new RuntimeException(e.getMessage());
//		}
//	}
		
	

	@Override
	public ArrayList<MemberDto> userList() {
		ArrayList<MemberDto> list = dao.userListDao();
		return list;
	}

	@Override
	public int idCheck(String id) {
		int nResult = dao.idCheckDao(id);
		return nResult;
	}

	@Override
	public int updatePicture(MemberDto member) {
		int nResult = dao.updatePicture(member);
		return nResult;
	}
	@Override
	public int insertPicture(MemberDto member) {
		int nResult = dao.insertPicture(member);
		return nResult;
	}

	@Override
	public ArrayList<MemberDto> mlist(String id) {
		ArrayList<MemberDto> mlist = dao.mlistDao(id);
		return mlist;
	}

	@Override
	public int deletePicture(MemberDto member) {
		int nResult = dao.deletePicture(member);
		return nResult;
	}

	@Override
	public int updatePassword(String id, String password) {
		int nResult = dao.updatePassword(id, password);
		return nResult;
	}

	@Override
	public int getPassword(String id) {
		int nResult = dao.getPassword(id);
		return nResult;
	}
}
