package com.study.springboot;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.study.springboot.dto.Dp1on1Dto;
import com.study.springboot.dto.DpFollowDto;
import com.study.springboot.dto.DpNoticeDto;
import com.study.springboot.dto.DpQuestionDto;
import com.study.springboot.dto.DpReasonDto;
import com.study.springboot.dto.FollowMemberDto;
import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.MyctDto;
import com.study.springboot.dto.PageMaker;
import com.study.springboot.dto.ReplyDto;
import com.study.springboot.dto.SearchCriteria;
import com.study.springboot.service.IDp1on1Service;
import com.study.springboot.service.IDpFollowService;
import com.study.springboot.service.IDpNoticeService;
import com.study.springboot.service.IDpQuestionService;
import com.study.springboot.service.IDpReasonService;
import com.study.springboot.service.IMemberService;
import com.study.springboot.service.IMyctService;
import com.study.springboot.service.ReplyService;
@Controller
public class MyController {

    @Autowired
    IMemberService mservice;

    @Autowired
    IMyctService ctservice;

    @Autowired
    ReplyService rReplyService;

    @Autowired
    FileUploadService fileUploadService;

    @Autowired
    IDpNoticeService dpservice;

    @Autowired
    IDpQuestionService dqservice;

    @Autowired
    IDp1on1Service oneservice;

    @Autowired
    IDpFollowService fservice;

    @Autowired
    IDpReasonService reasonservice;



    @RequestMapping("/")
    public String root() throws Exception {
        return "redirect:LoginPage";
    }

    @RequestMapping("/LoginPage")
    public String LoginPage() {
        return "LoginPage";
    }



    @RequestMapping("/MainPage")
    public String MainPage(HttpServletRequest req, Model model, SearchCriteria scri) throws Exception {

        // 로그인 성공 -> 세션에 아이디를 저장
        HttpSession session = req.getSession();


        //내정보를 가져와서 프로필 정보 넣기
        String sId = (String) session.getAttribute("sessionID");
        MemberDto dto = mservice.getUserInfo(sId);
        req.getSession().setAttribute("memberInfo", dto);

        //유저 리스트를 뿌려줌
        List < MemberDto > mmlist = mservice.mmlist();
        req.getSession().setAttribute("mmlist", mmlist);


        scri.setId(sId);
        System.out.println(scri);
        ArrayList < MyctDto > clist = ctservice.cList(scri);
        System.out.println("clist:" + clist.toString());
        req.getSession().setAttribute("clist", clist);

        PageMaker pageMaker = new PageMaker();

        pageMaker.setCri(scri);
        pageMaker.setTotalCount(ctservice.listCount(scri));
        System.out.println(ctservice.listCount(scri));

        System.out.println(pageMaker.getStartPage());
        System.out.println(pageMaker.getEndPage());

        return "/MainPage"; // MainForm.jsp 호출			 

    }



    /////////// 댓글쓰기 or 글 뿌리기/////////////////////
    @RequestMapping("/Replyinsert") // 댓글 
    private String rReplyServiceInsert(HttpServletRequest req, Model model) throws Exception {

        String user_id = (String) req.getParameter("writer");
        System.out.println("writer : " + user_id);

        ////////추가 user아이디로 member에 사진을 가져온다 ////////////
        MemberDto mdto = mservice.getUserInfo(user_id);
        String picture = mdto.getPicture();
        System.out.println(picture);

        int myct_no = 0;
        int board_no = Integer.parseInt(req.getParameter("board_no"));
        String content = req.getParameter("content");

        System.out.println(board_no);
        System.out.println(content);

        ReplyDto reply = new ReplyDto();
        reply.setMyct_no(myct_no);
        reply.setBoard_no(board_no);
        reply.setUser_id(user_id);
        reply.setContent(content);
        reply.setPicture(picture);
        reply.setReg(new Date());

        /////////// 11-09 이동 글쓰기 or 글 뿌리기/////////////////////
        String board_no1 = Integer.toString(board_no);
        model.addAttribute("dto", ctservice.viewPan(board_no1));
        ReplyDto replydto = new ReplyDto();

        System.out.println(replydto);
        rReplyService.replyInsert(reply);

        int board_no2 = Integer.parseInt(board_no1);
        List < ReplyDto > replylist = rReplyService.replyList(myct_no, board_no2);
        req.getSession().setAttribute("rlist", replylist);


        return "profile/MyProfileView";
    }



    /////////////// 댓글 삭제 //////////////////
    @RequestMapping("/DeleteReplyAction")
    public String DeleteReply(HttpServletRequest req, Model model) throws Exception {

        int reply_no = Integer.parseInt(req.getParameter("reply_no"));
        rReplyService.deleteReply(reply_no);

        // 바로 화면에 뜨게하기 안써주면 화면에서 삭제로 넘어가지 않는다.
        int board_no = Integer.parseInt(req.getParameter("board_no"));
        String board_no1 = Integer.toString(board_no);
        model.addAttribute("dto", ctservice.viewPan(board_no1));

        int myct_no = 0;
        int board_no2 = Integer.parseInt(board_no1);
        List < ReplyDto > replylist = rReplyService.replyList(myct_no, board_no2);
        req.getSession().setAttribute("rlist", replylist);

        return "profile/MyProfileView";
    }

    ///////////////// 댓글 수정 /////////////////////
    @RequestMapping("/ReplyUpdateAction")
    public String UpdateReply(HttpServletRequest req, Model model) throws Exception {

        int reply_no = Integer.parseInt(req.getParameter("reply_no"));
        String content = req.getParameter("content");
        rReplyService.replyUpdate(reply_no, content);

        int board_no = Integer.parseInt(req.getParameter("board_no"));
        String board_no1 = Integer.toString(board_no);
        model.addAttribute("dto", ctservice.viewPan(board_no1));

        int myct_no = 0;
        int board_no2 = Integer.parseInt(board_no1);
        List < ReplyDto > replylist = rReplyService.replyList(myct_no, board_no2);
        req.getSession().setAttribute("rlist", replylist);

        return "profile/MyProfileView";

    }


    /////////////////내 프로필 게시글///////////////
    @RequestMapping("/MyProfile")
    public String MyProfilPage(HttpServletRequest req, RedirectAttributes redirect, Model model, SearchCriteria scri) throws Exception {

        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("sessionID");
        scri.setId(id);
        int no = 0;
        scri.setNo(no);
        System.out.println(scri);
        ArrayList < MyctDto > clist = ctservice.ccList(scri);
        System.out.println("clist:" + clist.toString());
        req.getSession().setAttribute("clist", clist);

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(scri);
        pageMaker.setTotalCount(ctservice.listCount(scri));
        System.out.println(ctservice.listCount(scri));

        System.out.println(pageMaker.getStartPage());
        System.out.println(pageMaker.getEndPage());

        model.addAttribute("pageMaker", pageMaker);
        return "profile/MyProfile";
    }
     
    
    /////////////나만보기/////////////////////////
    @RequestMapping("/MyProfileSecret")
    public String MyProfileSecretPage(HttpServletRequest req, Model model, SearchCriteria scri) throws Exception {
     
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("sessionID");
        scri.setId(id);

        //숨긴 컨텐츠만 가져오는 파일  
        int no = 1;
        scri.setNo(no);

        System.out.println(scri);

        ArrayList < MyctDto > cclist = ctservice.ccList(scri);
        System.out.println("clist:" + cclist.toString());
        req.getSession().setAttribute("cclist", cclist);

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(scri);
        pageMaker.setTotalCount(ctservice.listCount(scri));
        System.out.println(ctservice.listCount(scri));

        System.out.println(pageMaker.getStartPage());
        System.out.println(pageMaker.getEndPage());

        model.addAttribute("pageMaker", pageMaker);

        return "profile/MyProfileSecret";
    }

    ////////////////나만보기로 변환//////////////////
    @RequestMapping("/MyProfileSecretChange")
    public String MyProfileSecretChangePage(HttpServletRequest req, Model model, SearchCriteria scri) throws Exception {
        int no = Integer.parseInt(req.getParameter("no"));

        System.out.println(no);
        int board_no = Integer.parseInt(req.getParameter("board_no"));
        System.out.println(board_no);
        // 일반 게시판을 나만보기로 바꿈
        if (no == 0) {

            no = 1;

            ctservice.Changno(board_no, no);

            HttpSession session = req.getSession();
            String id = (String) session.getAttribute("sessionID");
            scri.setId(id);

            //숨긴 컨텐츠만 가져오는 파일 
            scri.setNo(no);

            System.out.println(scri);

            ArrayList < MyctDto > cclist = ctservice.ccList(scri);
            System.out.println("clist:" + cclist.toString());
            req.getSession().setAttribute("cclist", cclist);

            PageMaker pageMaker = new PageMaker();
            pageMaker.setCri(scri);
            pageMaker.setTotalCount(ctservice.listCount(scri));
            System.out.println(ctservice.listCount(scri));

            System.out.println(pageMaker.getStartPage());
            System.out.println(pageMaker.getEndPage());

            model.addAttribute("pageMaker", pageMaker);

            return "profile/MyProfileSecret";

        }
        
        //나만보기 게시판일경우 일반 게시판 페이지로 넘김
        else if (no == 1) {

            no = 0;
            ctservice.Changno(board_no, no);

            HttpSession session = req.getSession();
            String id = (String) session.getAttribute("sessionID");
            scri.setId(id);

            scri.setNo(no);
            System.out.println(scri);
            ArrayList < MyctDto > clist = ctservice.ccList(scri);
            System.out.println("clist:" + clist.toString());
            req.getSession().setAttribute("clist", clist);

            PageMaker pageMaker = new PageMaker();
            pageMaker.setCri(scri);
            pageMaker.setTotalCount(ctservice.listCount(scri));
            System.out.println(ctservice.listCount(scri));

            System.out.println(pageMaker.getStartPage());
            System.out.println(pageMaker.getEndPage());

            model.addAttribute("pageMaker", pageMaker);

            return "profile/MyProfile";

        } else {
        	
            return "profile/MyProfileView";
        }
    }

    ////////////////////게시판 상세보기 //////////
    @RequestMapping("/MyProfileView")
    public String view(HttpServletRequest request, Model model) throws Exception {

        String writer = request.getParameter("writer");
        MemberDto mdto = mservice.getUserInfo(writer);
        String picture = mdto.getPicture();
        rReplyService.replyset(writer, picture);
        
        System.out.println(writer);

        request.getSession().setAttribute("mdto", mdto);
        
        String board_no = request.getParameter("board_no");
        model.addAttribute("dto", ctservice.viewPan(board_no));

        int myct_no = 0;
        int board_no1 = Integer.parseInt(board_no);
        List < ReplyDto > replylist = rReplyService.replyList(myct_no, board_no1);
        request.getSession().setAttribute("rlist", replylist);

        return "profile/MyProfileView";

    }

    ////////////////////다른 유저 게시판 보기////////////////////////
    @RequestMapping("/UserProfileView")
    public String userview(HttpServletRequest req, Model model, SearchCriteria scri) throws Exception {

        String sid = req.getParameter("id");
        scri.setId(sid);
        System.out.println(sid);

        int no = 0;
        scri.setNo(no);
        MemberDto mdto = mservice.getUserInfo(sid);
        req.getSession().setAttribute("mdto", mdto);

        System.out.println(scri);
        ArrayList < MyctDto > clist = ctservice.ccList(scri);
        System.out.println("clist:" + clist.toString());
        req.getSession().setAttribute("clist", clist);

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(scri);
        pageMaker.setTotalCount(ctservice.listCount(scri));
        System.out.println(ctservice.listCount(scri));

        System.out.println(pageMaker.getStartPage());
        System.out.println(pageMaker.getEndPage());

        model.addAttribute("pageMaker", pageMaker);

        return "profile/UserProfileView";

    }




    ///////////프로필 편집 페이지 ///////////////
    @RequestMapping("/ModifyProfile")
    public String ModifyProfile(HttpServletRequest req, HttpSession session) {
        String id = (String) session.getAttribute("sessionID");
        MemberDto member = mservice.getUserInfo(id);
        session.setAttribute("memberInfo", member);
        return "profile/ModifyProfile";
    }

    ///////////비밀번호 변경 페이지/////////
    @RequestMapping("/ModifyPassword")
    public String ModifyPassword(HttpServletRequest req, HttpSession session) {
      
       return "profile/ModifyPassword";
    }
   
    ///////////이메일 편집 페이지(미완성)///////////
    @RequestMapping("/ModifyEmail")
    public String ModifyEmail() {
        return "profile/ModifyEmail";
    }
    
    //////////알림설정(미완성)/////////////
    @RequestMapping("/NotifySetting")
    public String NotifySetting() {
        return "profile/NotifySetting";
    }
    
    /////////팔로우 페이지////////////////
    @RequestMapping("/FollowSetting")
    public String FollowSetting(HttpServletRequest req, HttpSession session) {
        
    	String id = req.getSession().getAttribute("sessionID").toString();
        ArrayList < DpFollowDto > unfollowlist = fservice.unfollowlist(id);
        ArrayList < DpFollowDto > followerlist = fservice.followerlist(id);
        ArrayList < FollowMemberDto > fmlist = fservice.fmlist(id);
        ArrayList < FollowMemberDto > ufmlist = fservice.ufmlist(id);
        session.setAttribute("followerlist", followerlist);
        session.setAttribute("unfollowlist", unfollowlist);
        session.setAttribute("fmlist", fmlist);
        session.setAttribute("ufmlist", ufmlist);
        return "profile/FollowSetting";
    }
    
    ////////////////프로필 사진 삭제 ///////////
    @RequestMapping("/DeletePicture")
    public String DeletePicture(HttpServletRequest req, Model model) {
        String id = (String) req.getSession().getAttribute("sessionID");

        MemberDto dto = new MemberDto();
        dto.setId(id);

        String picture = req.getParameter("picture");
        System.out.println(picture);
        int nResult = mservice.deletePicture(dto);
        if (nResult <= 0) {
            System.out.println("사진삭제 실패");
            model.addAttribute("msg", "실패");
            model.addAttribute("url", "/ModifyProfile");

        } else {

            dto = mservice.getUserInfo(id);
            req.getSession().setAttribute("memberInfo", dto);
            String path = "C:\\Users\\ehowlrusdn\\git\\TeamProject\\DailyPicture\\src\\main\\resources\\static\\user\\" + id + "\\" + picture;
            File file = new File(path);
            if (file.exists())
                file.delete();

            System.out.println("사진삭제 성공");
            model.addAttribute("msg", "사진삭제성공");
            model.addAttribute("url", "/ModifyProfile");
        }

        return "redirect";
    }
    
    
    /////////////소개 페이지////////////////////
    @RequestMapping("/Introduce")
    public String Introduce() {
    	return "Infomation/Introduce";    
    }
    
    
    //////////////1:1 문의 페이지///////////////
    @RequestMapping("/1on1")
    public String one(HttpServletRequest req, HttpSession session) {
        String page = req.getParameter("page");
        if (page == null)
            page = "1";
        System.out.println("page:" + page);
        ArrayList < Dp1on1Dto > qlist = oneservice.list(page);
        session.setAttribute("qlist", qlist);
        session.setAttribute("page", page);
       
        return "Infomation/1on1";
    }
    
    /////////////1:1 문의 글 작성페이지/////////////////
    @RequestMapping("/write_1on1")
    public String writeone() {	
        return "Infomation/write_1on1";
    }
    
    ///////////공지사항 글 쓰기페이지///////////////////
    @RequestMapping("/write_notice")
    public String write_notice() {
        return "Infomation/write_notice";
    }
    
    ///////////자주하는 질문 글쓰기페이지/////////
    @RequestMapping("/write_question")
    public String write_question() {
        return "Infomation/write_question";
    }
    
    ///////////자주하는 질문페이지////////////////
    @RequestMapping("/Question")
    public String Question(HttpServletRequest req, HttpSession session) {
        String admin = (String) session.getAttribute("sessionID");
        String page = req.getParameter("page");
        
        if (page == null)
            page = "1";
        System.out.println("page:" + page);
        
        if (admin.equals("hong")) {
            ArrayList < DpQuestionDto > qlist = dqservice.list(page);
            session.setAttribute("qlist", qlist);
            session.setAttribute("page", page);
            
            return "Infomation/Question-admin";
        } else {
            ArrayList < DpQuestionDto > qlist = dqservice.list(page);
            session.setAttribute("qlist", qlist);
            session.setAttribute("page", page);
           
            return "Infomation/Question";
        }
    }
    
    ////////위치 소개페이지///////////
    @RequestMapping("/Location")
    public String Location() {
        return "Infomation/Location";
    }
    
    
    ////////공지사항 상세페이지///////
    @RequestMapping("/view_notice")
    public String view_notice(HttpServletRequest req) {
        String board_no_str = req.getParameter("board_no");
        DpNoticeDto dto = dpservice.view_notice(board_no_str);
        req.getSession().setAttribute("view_notice", dto);
        String admin = req.getSession().getAttribute("sessionID").toString();
       
        if (admin.equals("hong")) {
            
        	return "Infomation/view_notice-admin";
        } else {
            
        	return "Infomation/view_notice";
        }
    }

    ///////자주하는 질문 상세페이지///////
    @RequestMapping("/view_question")
    public String view_question(HttpServletRequest req) {
        String board_no_str = req.getParameter("board_no");
        DpQuestionDto dto = dqservice.view_question(board_no_str);
        req.getSession().setAttribute("view_question", dto);
        String admin = req.getSession().getAttribute("sessionID").toString();
        
        if (admin.equals("hong")) {
           
        	return "Infomation/view_question-admin";
        } else {
            
        	return "Infomation/view_question";
        }
    }
    
    ////////1:1문의 상세 페이지/////////////
    @RequestMapping("/view_1on1")
    public String view_1on1(HttpServletRequest req, Model model) throws Exception {
        String board_no_str = req.getParameter("board_no");
        Dp1on1Dto dto = oneservice.view_1on1(board_no_str);
        req.getSession().setAttribute("view_1on1", dto);
        String id = req.getSession().getAttribute("sessionID").toString();
        String writer = oneservice.getWriter(board_no_str);
        int board_no = Integer.parseInt(board_no_str);
        int myct_no = 1;
        MemberDto mdto = mservice.getUserInfo(writer);

        System.out.println("id:" + id);
        System.out.println("writer:" + writer);
        
        if (id.equals(writer) || id.equals("hong")) {
           
        	List < ReplyDto > rlist = rReplyService.replyList(myct_no, board_no);
            req.getSession().setAttribute("rlist", rlist);
            req.getSession().setAttribute("mdto", mdto);
           
            return "Infomation/view_1on1";
        } else {
            
        	model.addAttribute("msg", "작성자만 열람할 수 있습니다.");
            model.addAttribute("url", "1on1");
            
            return "redirect";
        }
    }
    
    ///////고객센터 페이지////////
    @RequestMapping("/Infomation")
    public String Infomation(HttpServletRequest req, HttpSession session, Model model) {
        String Admin = (String) session.getAttribute("sessionID");
        String page = req.getParameter("page");
        
        if (page == null)
            page = "1";
        System.out.println("page:" + page);
        
        if (Admin.equals("hong")) {
            ArrayList < DpNoticeDto > list = dpservice.list(page);
            session.setAttribute("list", list);
            session.setAttribute("page", page);
           
            return "Infomation/Infomation-admin";
        } else {
           
        	ArrayList < DpNoticeDto > list = dpservice.list(page);
            session.setAttribute("list", list);
            session.setAttribute("page", page);
           
            return "Infomation/Infomation";
        }
    }
    
    ////////회원 탈퇴 페이지///////
    @RequestMapping("/DeleteMember")
    public String goDeleteMember() {
        return "profile/DeleteMember";
    }
    
    
    //////////회원탈퇴 기능/////////////
    @RequestMapping("/DeleteMemberAction")
    public String DeleteMember(HttpServletRequest req, Model model, HttpSession session) {
        String id = (String) session.getAttribute("sessionID");
        String pw = (String) req.getParameter("password");
        String reason = (String) req.getParameter("deletereason");
        String opinion = (String) req.getParameter("opinion");

        DpReasonDto dto = new DpReasonDto();
        dto.setId(id);
        dto.setReason(reason);
        dto.setOpinion(opinion);
        dto.setReg(new Date());
        int nResult = mservice.deleteMember(id, pw);
        
        if (nResult <= 0) {
            model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
            System.out.println("탈퇴 실패");
            model.addAttribute("url", "/DeleteMember");
        
        } else {
           
        	session.invalidate();
            fservice.delete(id, id);
            reasonservice.InsertReason(dto);
            model.addAttribute("msg", "탈퇴되셨습니다.");
            model.addAttribute("url", "/");
            System.out.println("탈퇴 성공");
        }
        
        return "redirect";
    }
    
    /////////프로필 편집 기능////////////
    @RequestMapping("ModifyProfileAction")
    public String ModifyProfileAction(HttpServletRequest req, HttpSession session, Model model) {
        String id = session.getAttribute("sessionID").toString();
        String name = req.getParameter("name");

        String mail = req.getParameter("email");
        String phone = req.getParameter("phone");


        MemberDto member = new MemberDto();
        member.setId(id);
        member.setName(name);
        member.setMail(mail);
        member.setPhone(phone);
        System.out.println(member);


        int nResult = mservice.updateMember(member);
        if (nResult <= 0) {
            model.addAttribute("msg", "수정 실패");
            model.addAttribute("url", "ModifyProfile");
      
        } else {
            session.setAttribute("memberInfo", member);

            model.addAttribute("msg", "수정 성공");
            model.addAttribute("url", "/");
        }

        return "redirect";
    }
    
    
    //////////비밀번호 변경 기능////////////
    @RequestMapping("/ModifyPasswordAction")
    public String ModifyPasswordAction(HttpServletRequest req, HttpSession session, Model model) {
        String id = session.getAttribute("sessionID").toString();
        int db_pw = mservice.getPassword(id);
        String ex_pw = req.getParameter("ex-password");
        String new_pw = req.getParameter("password");
        String pw_check = req.getParameter("password-check");
        System.out.println("db_pw:" + db_pw);
        System.out.println("ex_pw:" + ex_pw);
        System.out.println("new_pw:" + new_pw);
        System.out.println("pw_check:" + pw_check);
        System.out.println("string.valueof:" + String.valueOf(db_pw));

        if (!String.valueOf(db_pw).equals(ex_pw)) {
            model.addAttribute("msg", "기존 비밀번호를 다시 입력해주세요.");
            model.addAttribute("url", "ModifyPassword");
        } else if (!new_pw.equals(pw_check)) {
            model.addAttribute("msg", "비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
            model.addAttribute("url", "ModifyPassword");
        } else {
            
        	int nResult = mservice.updatePassword(id, new_pw);
           
            if (nResult <= 0) {
                model.addAttribute("msg", "비밀번호 변경 실패");
                model.addAttribute("url", "ModifyPassword");
            } else {
                model.addAttribute("msg", "비밀번호를 변경하였습니다.");
                model.addAttribute("url", "/");
            }
        }

        return "redirect";
    }


     //////공지사항 글작성 기능/////
    @RequestMapping("/write_noticeAction")
    public String write_noticeAction(HttpServletRequest req, HttpSession session, Model model) {

        String writer = (String) session.getAttribute("sessionID");
        String title = req.getParameter("title");
        String content = req.getParameter("editor4");
        String page = req.getParameter("page");
        DpNoticeDto dto = new DpNoticeDto();
        dto.setTitle(title);
        dto.setContent(content);
        dto.setWriter(writer);
        dto.setReg(new Date());
        
        if (page == null)
            page = "1";
        int nResult = dpservice.writeNotice(dto);
        ArrayList < DpNoticeDto > list = dpservice.list(page);
        session.setAttribute("list", list);

        if (nResult <= 0) {
            model.addAttribute("msg", "글쓰기 실패");
            model.addAttribute("url", "write_notice");
            System.out.println("글쓰기 실패");
        } else {
            model.addAttribute("msg", "게시물을 등록하였습니다.");
            model.addAttribute("url", "Infomation");
        }

        return "redirect";
    }
    
    
    //////////ckeditor 사진 업로드기능////////
    @RequestMapping(value = "/mine/imageUpload.do", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request,
        HttpServletResponse response, MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        OutputStream out = null;
        PrintWriter printWriter = null;

        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        try {

            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();

            //이미지 경로 생성
            String path = "C:\\Users\\ehowlrusdn\\git\\TeamProject\\DailyPicture\\src\\main\\resources\\static\\Question" + "ckImage/";
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);

            //해당 디렉토리 확인
            if (!folder.exists()) {
                try {
                    folder.mkdirs(); // 폴더 생성
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

            printWriter = response.getWriter();
            String fileUrl = "/mine/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

            // 업로드시 메시지 출력
            printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
            printWriter.flush();

        } catch (IOException e) {
            e.printStackTrace();
       
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        
        return;
    }

    //////////ckeditor 사진 서버전송//////////    
    @RequestMapping(value = "/mine/ckImgSubmit.do")
    public void ckSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value = "fileName") String fileName, HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        //서버에 저장된 이미지 경로
        String path = "C:\\Users\\ehowlrusdn\\git\\TeamProject\\DailyPicture\\src\\main\\resources\\static\\Question" + "ckImage/";
        String sDirPath = path + uid + "_" + fileName;
        File imgFile = new File(sDirPath);

        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if (imgFile.isFile()) {
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;

            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;

            try {
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();

                while ((readByte = fileInputStream.read(buf)) != -1) {
                    outputStream.write(buf, 0, readByte);
                }

                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();

            } catch (IOException e) {

            } finally {

            }
        }
    }
    
    ///////자주하는 질문 글작성 기능///////////
    @RequestMapping("/write_questionAction") //자주하는 질문은 bid=0;
    public String Write_questionAction(HttpServletRequest req, HttpSession session, Model model) {
        String writer = (String) session.getAttribute("sessionID");
        String title = req.getParameter("title");
        String category = req.getParameter("category");
        String content = req.getParameter("editor4");

        DpQuestionDto dto = new DpQuestionDto();
        dto.setTitle(title);
        dto.setCategory(category);
        dto.setContent(content);
        dto.setWriter(writer);
        dto.setReg(new Date());
       
        String page = req.getParameter("page");
       
        if (page == null)
            page = "1";
        
        System.out.println("page:" + page);

        int nResult = dqservice.writeQuestion(dto);
        ArrayList < DpQuestionDto > qlist = dqservice.list(page);
        session.setAttribute("qlist", qlist);

        if (nResult <= 0) {
            model.addAttribute("msg", "글쓰기 실패");
            model.addAttribute("url", "write_question");
            System.out.println("글쓰기 실패");
        } else {
            model.addAttribute("msg", "게시물을 등록하였습니다.");
            model.addAttribute("url", "Question");
        }

        return "redirect";
    }
    
    ///////////1:1문의 글작성기능//////////////
    @RequestMapping("/write_1on1Action") //1대1 문의는 bid=1;
    public String Write_1on1Action(HttpServletRequest req, HttpSession session, Model model) {
        String writer = (String) session.getAttribute("sessionID");
        String title = req.getParameter("title");
        String category = req.getParameter("category");
        String content = req.getParameter("editor4");

        Dp1on1Dto dto = new Dp1on1Dto();
        dto.setTitle(title);
        dto.setCategory(category);
        dto.setContent(content);
        dto.setWriter(writer);
        dto.setReg(new Date());
        String page = req.getParameter("page");
        
        if (page == null)
            page = "1";
        System.out.println("page:" + page);
        int nResult = oneservice.write1on1(dto);
        ArrayList < Dp1on1Dto > qlist = oneservice.list(page);
        session.setAttribute("qlist", qlist);
        session.setAttribute("page", page);
        
        if (nResult <= 0) {
            model.addAttribute("msg", "글쓰기 실패");
            model.addAttribute("url", "write_1on1");
            System.out.println("글쓰기 실패");
        } else {
            model.addAttribute("msg", "게시물을 등록하였습니다.");
            model.addAttribute("url", "1on1");
        }

        return "redirect";
    }
    
    ////////공지사항 수정 페이지/////
    @RequestMapping("/modify_notice")
    public String Modify_Notice() {
        return "Infomation/modify_notice";
    }
    
    //////공지사항 수정 기능/////////////
    @RequestMapping("/modify_noticeAction")
    public String ModifyNoticeAction(HttpServletRequest req, Model model) {
        String board_no = req.getParameter("board_no");
        String title = req.getParameter("title");
        String content = req.getParameter("editor4");
        Date reg = new Date();
        int nResult = dpservice.modify(board_no, title, content, reg);
       
        if (nResult <= 0) {
            model.addAttribute("msg", "수정 실패");
            model.addAttribute("url", "modify_notice");
        } else {
            model.addAttribute("msg", "게시글을 수정하였습니다.");
            model.addAttribute("url", "Infomation");
        }
        
        return "redirect";
    }
    
    //////////공지사항 삭제 기능/////////
    @RequestMapping("/DeleteNoticeAction")
    public String DeleteNoticeAction(HttpServletRequest req, Model model) {
        String board_no = req.getParameter("board_no");
        int nResult = dpservice.delete(board_no);
        
        if (nResult <= 0) {
            model.addAttribute("msg", "삭제 실패");
            model.addAttribute("url", "redirect");
        } else {
            model.addAttribute("msg", "게시글을 삭제하였습니다.");
            model.addAttribute("url", "Infomation");
        }
       
        return "redirect";
    }
   
    /////////자주하는 질문 수정페이지///////
    @RequestMapping("/modify_question")
    public String ModifyQuestion() {
        return "Infomation/modify_question";
    }
    
    /////////자주하는 질문 수정 기능////////////
    @RequestMapping("/modify_questionAction")
    public String modifyquestionAction(HttpServletRequest req, Model model) {
        String board_no = req.getParameter("board_no");
        String title = req.getParameter("title");
        String category = req.getParameter("category");
        String content = req.getParameter("editor4");
        Date reg = new Date();
        int nResult = dqservice.modify(board_no, title, category, content, reg);
        
        if (nResult <= 0) {
            model.addAttribute("msg", "수정 실패");
            model.addAttribute("url", "modify_question");
        } else {
            model.addAttribute("msg", "게시글을 수정하였습니다.");
            model.addAttribute("url", "Question");
        }
       
        return "redirect";
    }
    
    /////////자주하는 질문 삭제기능/////////
    @RequestMapping("/DeletequestionAction")
    public String DeletequestionAction(HttpServletRequest req, Model model) {
        String board_no = req.getParameter("board_no");
        int nResult = dqservice.delete(board_no);
        
        if (nResult <= 0) {
            model.addAttribute("msg", "삭제 실패");
            model.addAttribute("url", "view_question");
        } else {
            model.addAttribute("msg", "게시글을 삭제하였습니다.");
            model.addAttribute("url", "Question");
        }
        
        return "redirect";
    }
    
    ///////1:1문의 수정페이지///////
    @RequestMapping("/modify_1on1")
    public String Modify1on1() {
        return "Infomation/modify_1on1";
    }
    
    //////1:1문의 수정 기능//////////
    @RequestMapping("/modify_1on1Action")
    public String modify_1on1Action(HttpServletRequest req, Model model) {
        String board_no = req.getParameter("board_no");
        String title = req.getParameter("title");
        String category = req.getParameter("category");
        String content = req.getParameter("editor4");
        Date reg = new Date();
        int nResult = oneservice.modify(board_no, title, category, content, reg);
        
        if (nResult <= 0) {
            model.addAttribute("msg", "수정 실패");
            model.addAttribute("url", "modify_1on1");
        } else {
            model.addAttribute("msg", "게시글을 수정하였습니다.");
            model.addAttribute("url", "1on1");
        }
       
        return "redirect";
    }
    
    /////////1:1문의 삭제기능//////////
    @RequestMapping("/Delete1on1Action")
    public String Delete1on1Action(HttpServletRequest req, Model model) throws Exception {
        String board_no = req.getParameter("board_no").substring(0, 2);
        int board_no2 = Integer.parseInt(board_no);
        int nResult = oneservice.delete(board_no);
        
        if (nResult <= 0) {
            model.addAttribute("msg", "삭제 실패");
            model.addAttribute("url", "view_1on1");
        } else {
            model.addAttribute("msg", "게시글을 삭제하였습니다.");
            model.addAttribute("url", "1on1");
            rReplyService.deleteRList(board_no2);
        }
        
        return "redirect";
    }
   

     ///관리자페이지/////////
    @RequestMapping("/Admin")
    public String Admin(HttpSession session) throws Exception {
        List < MemberDto > userlist = mservice.mmlist();
        session.setAttribute("userlist", userlist);
        int myct_no = 2;
        List < ReplyDto > SingoList = rReplyService.SingoreplyList(myct_no);
        session.setAttribute("SingoList", SingoList);
        List < DpReasonDto > reasonlist = reasonservice.list();
        session.setAttribute("reasonlist", reasonlist);
        
        return "Admin";
    }
    
    ////////팔로우 기능////////////
    @RequestMapping("/FollowAction")
    public String FollowAction(HttpServletRequest req, Model model) {
        String following = req.getParameter("following");
        String follower = req.getSession().getAttribute("sessionID").toString();

        System.out.println("following:" + following);
        System.out.println("follower:" + follower);
        int nResult = fservice.follow(following, follower);
       
        if (nResult <= 0) {
            model.addAttribute("msg", "이미 팔로우한 회원입니다.");
            model.addAttribute("url", "FollowSetting");
        } else {
            model.addAttribute("msg", "팔로우 성공!");
            model.addAttribute("url", "FollowSetting");
        }
        
        return "redirect";
    }
    
    /////////언팔로우 기능///////////
    @RequestMapping("/UnFollowAction")
    public String UnFollowAction(HttpServletRequest req, Model model) {
        String following = req.getParameter("following");
        String follower = req.getSession().getAttribute("sessionID").toString();

        System.out.println("unfollowing:" + following);
        System.out.println("unfollower:" + follower);
        int nResult = fservice.unfollow(following, follower);
        
        if (nResult <= 0) {
            model.addAttribute("msg", "실패");
            model.addAttribute("url", "FollowSetting");
        } else {
            model.addAttribute("msg", "언팔로우 성공!");
            model.addAttribute("url", "FollowSetting");
        }
       
        return "redirect";
    }
    
    ////////////1:1문의 댓글 쓰기 기능//////////
    @RequestMapping("/ReplyInsertAction")
    public String ReplyInsertAction(HttpServletRequest req, Model model) throws Exception {
        
        String user_id = (String) req.getSession().getAttribute("sessionID");
        System.out.println("writer : " + user_id);

        ////////추가 user아이디로 member에 사진을 가져온다 ////////////
        MemberDto mdto = mservice.getUserInfo(user_id);
        String picture = mdto.getPicture();
        System.out.println(picture);

        // 고객센터 1대1문의 댓글은 1//
        int myct_no = 1; 

        String board_no_str = req.getParameter("board_no").trim();
        System.out.println("board_no " + board_no_str);
        int board_no = Integer.parseInt(board_no_str);
        System.out.println("board_no " + board_no);
        String content = req.getParameter("content");
        
        System.out.println("content " + content);

        ReplyDto reply = new ReplyDto();
        reply.setMyct_no(myct_no);
        reply.setBoard_no(board_no);
        reply.setUser_id(user_id);
        reply.setContent(content);
        reply.setPicture(picture);
        reply.setReg(new Date());
        rReplyService.replyInsert(reply);
        List < ReplyDto > replylist = rReplyService.replyList(myct_no, board_no);
        req.getSession().setAttribute("rlist", replylist);
        String referer = req.getHeader("Referer"); //리다이렉트 후 이전페이지 이동

        return "redirect:" + referer; //리다이렉트 후 이전페이지 이동	
    }
    
    //1대1문의 댓글 삭제//
    @RequestMapping("/DeleteCommentAction") 
    public String DeleteComment(HttpServletRequest req) throws Exception {
        String rn = req.getParameter("reply_no");
        int reply_no = Integer.parseInt(rn);
        rReplyService.deleteReply(reply_no);
        System.out.println("rn:" + rn);
        System.out.println("reply_no:" + reply_no);
        String referer = req.getHeader("Referer"); //리다이렉트 후 이전페이지 이동
       
        return "redirect:" + referer; //리다이렉트 후 이전페이지 이동
    }
    
    //댓글 신고//
    @RequestMapping("/SingoAction") 
    public String SingoAction(HttpServletRequest req, Model model) throws Exception {
        String reply_no_str = req.getParameter("reply_no").trim();
        int reply_no = Integer.parseInt(reply_no_str);
        String board_no_str = req.getParameter("board_no").trim();
        int board_no = Integer.parseInt(board_no_str);
        String user_id = req.getParameter("user_id");
        String content = req.getParameter("content");
        String picture = req.getParameter("picture");
        int myct_no = 2; // 댓글 신고 리스트는 dp_reply myct_no 2에 저장

        System.out.println("reply_no: " + reply_no);
        ReplyDto rep = new ReplyDto();
        rep.setReply_no(reply_no);
        rep.setBoard_no(board_no);
        rep.setMyct_no(myct_no);
        rep.setUser_id(user_id);
        rep.setContent(content);
        rep.setPicture(picture);
        rep.setReg(new Date());
        int nResult = rReplyService.SingoreplyInsert(rep);
        
        String referer = req.getHeader("Referer");
        if (nResult <= 0) {
            model.addAttribute("msg", "신고 실패!");
            model.addAttribute("url", referer);
        } else {
            model.addAttribute("msg", "신고 성공!");
            model.addAttribute("url", referer);
        }


        return "redirect";
    }
    
    //댓글 신고받은 아이디 정지//
    @RequestMapping("/SingoDeleteAction") 
    public String SingoDeleteAction(HttpServletRequest req, Model model) throws Exception {
        String id = req.getParameter("user_id");
        String content = req.getParameter("content");
        String board_no_str = req.getParameter("board_no").trim();
        System.out.println("board_no_str:" + board_no_str + "111");
        int board_no = Integer.parseInt(board_no_str);

        System.out.println("id:" + id);
        System.out.println("board_no:" + board_no);
        int nResult = rReplyService.Singodelete(id);
        
        String referer = req.getHeader("Referer");
        if (nResult <= 0) {
            model.addAttribute("msg", "정지 실패");
            model.addAttribute("url", referer);
        } else {
            rReplyService.SingodeleteReply(board_no, id, content);
            fservice.delete(id, id);
            model.addAttribute("msg", "정지 성공");
            model.addAttribute("url", referer);
        }
        
        return "redirect";
    }

    //로그인 기능//
    @RequestMapping("/MemberLoginAction")
    public String MemberLogin(HttpServletRequest request, Model model, RedirectAttributes redirect, SearchCriteria scri) throws Exception {

        redirect.addAttribute("contentPage", "member/JoinForm.jsp");
      
        // 로그인 성공과 동시에 섹션에 사진을 담아서 뿌려줌 
        // 로그인 or 내정보에서 사진 뿌리기.
        String id = request.getParameter("id"); // input 태그에 name으로 있는걸 쓴 것.
        String password = request.getParameter("password");

        int check = mservice.loginCheck(id, password);
        if (check <= 0) {
            System.out.println("로그인 실패");
            model.addAttribute("msg", "로그인 실패 - 아이디나 암호를 확인해주세요");
            model.addAttribute("url", "/LoginPage");
        } else {
            System.out.println("로그인 성공");
            // 로그인 성공 -> 세션에 아이디를 저장
            HttpSession session = request.getSession();
            session.setAttribute("sessionID", id);
            model.addAttribute("msg", "로그인 성공");
            model.addAttribute("url", "/MainPage");
        }

        return "redirect"; // redirect.jsp
    }

    //////////헤더 기능////////
    @RequestMapping("/Header")
    public String MListActionPage(HttpServletRequest request, RedirectAttributes redirect, Model model) {

        List < MemberDto > mlist = mservice.mmlist();
        WebUtils.setSessionAttribute(request, "mlist", mlist);
        redirect.addAttribute("contentPage", "profile/Header");
        
        return "redirect:MainForm";
    }
    
    //로그아웃 기능//
    @RequestMapping("/MemberLogoutAction")
    public String MemberLogoutActionPage(Model model, HttpServletRequest request) {
        request.getSession().invalidate();
        System.out.println("로그아웃");
        model.addAttribute("msg", "로그아웃");
        model.addAttribute("url", "/");
       
        return "redirect"; // MemberLogoutAction.jsp 호출
    }

 

    
    //회원 가입 페이지//
    @RequestMapping("/JoinForm")
    public String JoinFormPage(RedirectAttributes redirect) {
        redirect.addAttribute("contentPage", "member/JoinForm.jsp");
        return "member/JoinForm";
    }
    
    //회원 가입기능 및 회원별 컨텐츠 폴더생성//
    @RequestMapping(value = "/MemberJoinAction", method = RequestMethod.POST)
    public String MemberJoinActionPage(HttpServletRequest req, Model model) {

        MemberDto dto = new MemberDto();
        dto.setName(req.getParameter("name"));
        dto.setId(req.getParameter("id"));
        dto.setPassword(req.getParameter("password"));
        dto.setMail(req.getParameter("mail"));
        dto.setPhone(req.getParameter("phone"));
        dto.setReg(new Date());
        
        System.out.println(dto.getId());
        System.out.println(dto.getName());
        System.out.println(dto.getPassword());
        System.out.println(dto.getMail());

        int nResult = mservice.insertMember(dto);
        if (nResult <= 0) {
            System.out.println("회원가입 실패");
            model.addAttribute("msg", "회원가입 실패");
            model.addAttribute("url", "/");
        } else {
            System.out.println("회원가입 성공");
            String path = "C:\\Users\\ehowlrusdn\\git\\TeamProject\\DailyPicture\\src\\main\\resources\\static\\user" + req.getParameter("id"); // 폴더 경로 경로
            File Folder = new File(path);

            // 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
            if (!Folder.exists()) {
                try {
                    Folder.mkdir(); // 폴더 생성합니다.
                    System.out.println("폴더가 생성되었습니다.");
                } catch (Exception e) {
                    e.getStackTrace();
                }
                
            } else {
                System.out.println("이미 폴더가 생성되어 있습니다.");
            }

            model.addAttribute("msg", "회원가입 성공");
            model.addAttribute("url", "/");

        }

        return "redirect";
    }
    
    
    //중복확인//
    @RequestMapping(value = "/IdCheckAction", method = RequestMethod.GET)
    public @ResponseBody String IdCheckAction(HttpServletRequest req, Model model) {

        System.out.println("userID:" + req.getParameter("id"));
        int nResult = mservice.idCheck(req.getParameter("id"));
        if (nResult > 0) {
            System.out.println("중복된 아이디 있음");

        } else {
            System.out.println("중복된 아이디 없음");

        }

        return String.valueOf(nResult);
    }

    
    //////////////////////// 사진 전송////////////////////////////////////
    @Autowired
    private ServletContext context;

    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(200000000);
        multipartResolver.setMaxInMemorySize(200000000);
        multipartResolver.setDefaultEncoding("utf-8");
        
        return multipartResolver;
    }

    //게시판 만들기//
    @RequestMapping(value = "/uploadOk", method = RequestMethod.POST)
    public /* ResponsBody */ String uploadOk(Model model, HttpServletRequest req,
        @RequestParam("filename") MultipartFile file) {
        // ResponsBody : retrun; 할때 주소로 넘어가지않고 화면에 return을 써줌 그러므로 빼준다.

        // 섹션아이디를 보내서 회원가입할때 만들어준 폴더로 경로를 설정할 수 있다.
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("sessionID");
        String filename = fileUploadService.restore(file, id);
        System.out.println("url:" + filename);
        model.addAttribute("url", filename);

        MyctDto dto = new MyctDto();
        dto.setId(id);
        dto.setMemo(req.getParameter("memo"));
        dto.setPicture(filename);
        dto.setReg(new Date());
        int no = 0;
        dto.setNo(no);

        System.out.println(req.getParameter("title"));
        System.out.println(req.getParameter("memo"));

        int nResult = ctservice.insertCt(dto);
        if (nResult <= 0) {
            System.out.println("사진전송 실패");
            model.addAttribute("msg", "실패");
            model.addAttribute("url", "/MyProfile");
        } else {
            System.out.println("사진전송 성공");
            model.addAttribute("msg", "전송성공");
            model.addAttribute("url", "/MyProfile");
        }
        
        //		return "파일업로드 성공 - 경로:"+url;
        return "redirect";
    }
    
    
    //게시판 삭제//
    @RequestMapping("/DeletePanAction")
    public String DeletePanAction(Model model, HttpServletRequest req) throws Exception {

        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("sessionID");
        int board_no = Integer.parseInt(req.getParameter("board_no"));
        String picture = req.getParameter("picture");
       
        int nResult = ctservice.deletePan(board_no, id);
        if (nResult <= 0) {
            System.out.println("삭제 실패");
            model.addAttribute("msg", "실패");
            model.addAttribute("url", "/MyProfile");

        } else {

            rReplyService.deleteRList(board_no);
            //내정보에 있는 사진을 사진변경후 프로필 사진이 있는곳에  뿌려준다.
            //사진파일에 있는 사진도 같이 삭제해준다.
            String path = "C:\\Users\\ehowlrusdn\\git\\TeamProject\\DailyPicture\\src\\main\\resources\\static\\user\\" + id + "\\" + picture;
            File file = new File(path);
            if (file.exists())
                file.delete();
            System.out.println("삭제 성공");
            model.addAttribute("msg", "전송성공");
            model.addAttribute("url", "/MyProfile");
        }

        return "redirect";
    }

    
    //프로필 사진 수정//
    @RequestMapping(value = "/ChangePicture", method = RequestMethod.POST)
    public /* ResponsBody */ String ChangePicture(Model model, HttpServletRequest req,
        @RequestParam("filename") MultipartFile file) { 
        System.out.println("ChangePicture");
        
        // 섹션아이디를 보내서 회원가입할때 만들어준 폴더로 경로를 설정할 수 있다.
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("sessionID");
        String filename = fileUploadService.restore(file, id);
        System.out.println("url:" + filename);
        model.addAttribute("url", filename);

        MemberDto dto = new MemberDto();
        String picture = filename;
        dto.setId(id);
        dto.setPicture(picture);
        
        //사진 변경과 동시에 프로필이 들어간 곳에 사진을 뿌려준다.
        int nResult = mservice.updatePicture(dto);
        if (nResult <= 0) {
            System.out.println("사진전송 실패");
            model.addAttribute("msg", "실패");
            model.addAttribute("url", "/ModifyProfile");

        } else {
            //내정보에 있는 사진을 사진변경후 프로필 사진이 있는곳에  뿌려준다.
            dto = mservice.getUserInfo(id);
            req.getSession().setAttribute("memberInfo", dto);
            rReplyService.replyset(id, picture);
            System.out.println("사진전송 성공");
            model.addAttribute("msg", "전송성공");
            model.addAttribute("url", "/ModifyProfile");
        }
 
        return "redirect";
    }

    //게시판 수정//
    @RequestMapping(value = "/UpdatePan", method = RequestMethod.POST)
    public /* ResponsBody */ String ChangePam(Model model, HttpServletRequest req,
        @RequestParam("filename") MultipartFile file) {
        System.out.println("ChangePan");
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("sessionID");
        String filename = fileUploadService.restore(file, id);
        System.out.println("url:" + filename);

        String oldpicture = req.getParameter("picture");
        model.addAttribute("url", filename);
        String path = "C:\\Users\\ehowlrusdn\\git\\TeamProject\\DailyPicture\\src\\main\\resources\\static\\user\\" + id + "\\" + oldpicture;
        File oldfile = new File(path);
        if (oldfile.exists())
            oldfile.delete();

        MyctDto dto = new MyctDto();
        int board_no = Integer.parseInt(req.getParameter("board_no"));
        String memo = req.getParameter("memo");
        dto.setBoard_no(board_no);
        dto.setId(id);
        dto.setMemo(memo);
        dto.setPicture(filename);

        int nResult = ctservice.updatePan(dto);
        if (nResult <= 0) {
            System.out.println("게시판 수정실패");
            model.addAttribute("msg", "수정실패");
            model.addAttribute("url", "/MyProfile");

        } else {
            System.out.println("게시판 수정수공");
            model.addAttribute("msg", "수정성공");
            model.addAttribute("url", "/MyProfile");
        }
        
        return "redirect";
    }




}
