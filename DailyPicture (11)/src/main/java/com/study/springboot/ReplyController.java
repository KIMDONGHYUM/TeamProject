package com.study.springboot;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.ReplyDto;
import com.study.springboot.service.MemberService;
import com.study.springboot.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	
	@Autowired
	 ReplyService rReplyService;
	
	@Autowired
	 MemberService mservice;
	
	@RequestMapping("/list")
	@ResponseBody
	private List<ReplyDto> rReplyServiceList(Model model, HttpServletRequest req) throws Exception{
	
	 int myct_no = 0;
	 int board_no = Integer.parseInt(req.getParameter("board_no"));
		/* String writer_id = req.getParameter("writer_id"); */
		
	 return rReplyService.replyList(myct_no, board_no);

	
		

	}
	
	   @RequestMapping("/rinsert") //댓글 작성 
	    @ResponseBody
	    private int mCommentServiceInsert(@RequestParam String writer, @RequestParam int board_no, @RequestParam String content) throws Exception{
	         
		
			////////추가 user아이디로 member에 사진을 가져온다 ////////////
			
		    MemberDto mdto = mservice.getUserInfo(writer);
			String picture = mdto.getPicture();
		
			System.out.println(picture);
			
	
			/////////////////////////////////////////////
			System.out.println(board_no);
			System.out.println(content);
			
			int myct_no = 0;
			ReplyDto reply = new ReplyDto();
			
			reply.setMyct_no(myct_no);
			
			reply.setBoard_no(board_no);
			reply.setUser_id(writer);
			reply.setContent(content);
			reply.setPicture(picture);
			reply.setReg(new Date());
		  
	        
	        return rReplyService.replyInsert(reply);
	    }

}
