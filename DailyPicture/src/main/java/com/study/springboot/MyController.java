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
import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.MyctDto;
import com.study.springboot.dto.PageMaker;
import com.study.springboot.dto.ReplyDto;
import com.study.springboot.dto.SearchCriteria;
import com.study.springboot.service.IDp1on1Service;
import com.study.springboot.service.IDpFollowService;
import com.study.springboot.service.IDpNoticeService;
import com.study.springboot.service.IDpQuestionService;
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
	
	//11/10 박현식 수정한 부분
	//------------------------
	@Autowired
	IDpNoticeService dpservice;
	
	@Autowired
	IDpQuestionService dqservice;
	
	@Autowired
	IDp1on1Service oneservice;
	
	@Autowired
	IDpFollowService fservice;
	
	//------------------------
	@RequestMapping("/")
	public String root() throws Exception {
		return "redirect:LoginPage";
		
	}

	@RequestMapping("/LoginPage")
	public String LoginPage() {
		return "LoginPage";
	}

	@RequestMapping("/MainPage")
	public String MainPage() {
		return "MainPage"; // MainForm.jsp 호출
		
	}
	
	
	@RequestMapping("/MainReplyView")
	public String MainReplypage(HttpServletRequest req, Model model, SearchCriteria scri) throws Exception{
		
		String writer= req.getParameter("writer");
		
		
		 MemberDto mdto = mservice.getUserInfo(writer);
			String picture = mdto.getPicture();
			rReplyService.replyset(writer, picture);
			
			
		System.out.println(writer);
		
		req.getSession().setAttribute("mdto", mdto);
		  
		String board_no = req.getParameter("board_no");  
		model.addAttribute("dto", ctservice.viewPan(board_no));
		  
		int myct_no = 0;
		int board_no1 = Integer.parseInt(board_no);
		List<ReplyDto> replylist =rReplyService.replyList(myct_no, board_no1);
		
		 
		req.getSession().setAttribute("rlist", replylist);
		
		
		
		return "MainPage";
	}
	
	
		/*
		 * @Autowired PageMaker pageMaker;
		 */
	
	   /////////// 11-09 이동 글쓰기 or 글 뿌리기/////////////////////
		@RequestMapping("/Replyinsert") // 댓글 
		private String rReplyServiceInsert(HttpServletRequest req, Model model) throws Exception{

	   
	    /* HttpSession session = req.getSession(); */
		String user_id = (String) req.getParameter("writer");
		System.out.println("writer : " + user_id);
		
		////////추가 user아이디로 member에 사진을 가져온다 ////////////
		
	    MemberDto mdto = mservice.getUserInfo(user_id);
		String picture = mdto.getPicture();
		System.out.println(picture);
		
		
		///////////////////////////////////////////////////

		 int myct_no = 0; 
		 int board_no = Integer.parseInt(req.getParameter("board_no"));
		 		
		 String content = req.getParameter("content"); 
		 /* String writer = req.getParameter("writer"); */
		
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
		List<ReplyDto> replylist =rReplyService.replyList(myct_no, board_no2);
		 
		req.getSession().setAttribute("rlist", replylist);
		
		 
		 return "profile/MyProfileView";
	}
		
		
		
		/////////////// 댓글 삭제  11-15//////////////////
		@RequestMapping("/DeleteReplyAction")
		public String DeleteReply(HttpServletRequest req, Model model) throws Exception{
			
			int reply_no = Integer.parseInt(req.getParameter("reply_no"));
			rReplyService.deleteReply(reply_no);
			

			// 바로 화면에 뜨게하기 안써주면 화면에서 삭제로 넘어가지 않는다.
		    int board_no = Integer.parseInt(req.getParameter("board_no"));
		    String board_no1 = Integer.toString(board_no);
			model.addAttribute("dto", ctservice.viewPan(board_no1));
			
			int myct_no = 0;
			int board_no2 = Integer.parseInt(board_no1);
			List<ReplyDto> replylist =rReplyService.replyList(myct_no, board_no2);
			 
			req.getSession().setAttribute("rlist", replylist);
			 
			return "profile/MyProfileView";
		}
      ///////////////// 댓글 수정  11- 15/////////////////////
	  @RequestMapping("/ReplyUpdateAction")
	  public String UpdateReply(HttpServletRequest req, Model model) throws Exception{
		  
		  int reply_no = Integer.parseInt(req.getParameter("reply_no"));
		  String content = req.getParameter("content");
		  rReplyService.replyUpdate(reply_no, content);
		  
		  
		  
		  int board_no = Integer.parseInt(req.getParameter("board_no"));
		  String board_no1 = Integer.toString(board_no);
		  model.addAttribute("dto", ctservice.viewPan(board_no1));
		  
		  int myct_no = 0;
		  int board_no2 = Integer.parseInt(board_no1);
		  List<ReplyDto> replylist =rReplyService.replyList(myct_no, board_no2);
			 
		  req.getSession().setAttribute("rlist", replylist);
		  
		  return "profile/MyProfileView";
		  
	  }
		
		
		
		
	@RequestMapping("/MyProfile")
	public String MyProfilPage(HttpServletRequest req, RedirectAttributes redirect, Model model, SearchCriteria scri)throws Exception {
		/* Logger.info("list"); System.println 같이 값이 담겼는지 확인하거나 로그를 남긴느데 사용 */
		  HttpSession session = req.getSession(); 
		  String id = (String)session.getAttribute("sessionID");
		  scri.setId(id);
		  System.out.println(scri);
		  ArrayList<MyctDto> clist = ctservice.cList(scri);  
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

	

     
	 ////////////////////    11-13 수정 //////////
	@RequestMapping("/MyProfileView")
	public String view(HttpServletRequest request, Model model) throws Exception {
		
		
		
		
		String writer= request.getParameter("writer");
		
		
		 MemberDto mdto = mservice.getUserInfo(writer);
			String picture = mdto.getPicture();
			rReplyService.replyset(writer, picture);
			
			
		System.out.println(writer);
		
		request.getSession().setAttribute("mdto", mdto);
		  
		String board_no = request.getParameter("board_no");  
		model.addAttribute("dto", ctservice.viewPan(board_no));
		  
		int myct_no = 0;
		int board_no1 = Integer.parseInt(board_no);
		List<ReplyDto> replylist =rReplyService.replyList(myct_no, board_no1);
		
		 
		request.getSession().setAttribute("rlist", replylist);
		
		return "profile/MyProfileView"; //view.jsp 호출함.
	
		
	}
	

	
    
	//////////////////// 12- 13  ////////////////////////
    @RequestMapping("/UserProfileView")
    public String userview(HttpServletRequest req, Model model, SearchCriteria scri) throws Exception{
		
    	String id = req.getParameter("id");
    	scri.setId(id);
    	MemberDto mdto = mservice.getUserInfo(id);
		  req.getSession().setAttribute("mdto", mdto);
		/* model.addAttribute("udto", ctservice.cList(scri)); */
    	System.out.println(scri);
		  ArrayList<MyctDto> clist = ctservice.cList(scri);  
		  System.out.println("clist:" + clist.toString());
		  req.getSession().setAttribute("clist", clist);
        
         PageMaker pageMaker = new PageMaker();
		  
		  pageMaker.setCri(scri);
		  pageMaker.setTotalCount(ctservice.listCount(scri));
		  System.out.println(ctservice.listCount(scri));
		  model.addAttribute("pageMaker", pageMaker);
    	
    	return "profile/UserProfileView";
    	
    }

	
	
	
	

		

	
	@RequestMapping("/ModifyProfile")
	public String ModifyProfile(HttpServletRequest req, HttpSession session) {
		String id = (String)session.getAttribute("sessionID");
		MemberDto member=mservice.getUserInfo(id);
		session.setAttribute("memberInfo", member);
		return "profile/ModifyProfile";
	}
	
	@RequestMapping("/ModifyPassword")
	public String ModifyPassword(HttpServletRequest req, HttpSession session) {
//		String id = (String)session.getAttribute("sessionID");
//		ArrayList<MemberDto> mlist = mservice.mlist(id);
//		session.setAttribute("mlist", mlist);
		
		return "profiinle/ModifyPassword";
	}
	//11/9 박현식 수정부분 끝(밑에 더있음)
	
	@RequestMapping("/ModifyEmail")
	public String ModifyEmail() {
		return "profile/ModifyEmail";
	}
	@RequestMapping("/NotifySetting")
	public String NotifySetting() {
		return "profile/NotifySetting";
	}
	@RequestMapping("/FollowSetting")
	public String FollowSetting(HttpServletRequest req,HttpSession session) {
		String id = req.getSession().getAttribute("sessionID").toString();
		ArrayList<DpFollowDto> unfollowlist=fservice.unfollowlist(id);
		ArrayList<MemberDto> memberlist = fservice.memberlist(id);
		session.setAttribute("memberlist", memberlist);
		session.setAttribute("unfollowlist", unfollowlist);
		return "profile/FollowSetting";
	}
	
	@RequestMapping("/DeletePicture")
	public String DeletePicture(HttpServletRequest req,Model model) {
		String id = (String)req.getSession().getAttribute("sessionID");
		
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
			String path="C:\\Users\\ehowlrusdn\\git\\TeamProject\\DailyPicture\\src\\main\\resources\\static\\user\\"+id+"\\"+picture;
			File file = new File(path);
					if(file.exists()) 
						file.delete();
					
			System.out.println("사진삭제 성공");
			model.addAttribute("msg", "사진삭제성공");
			model.addAttribute("url", "/ModifyProfile");
		}
		

		return "redirect";
	}
	
	@RequestMapping("/Introduce")
	public String Introduce() {
		return "Infomation/Introduce";
	}
	@RequestMapping("/1on1")
	public String one(HttpSession session) {
		ArrayList<Dp1on1Dto> qlist=oneservice.list();
		session.setAttribute("qlist", qlist);
		return "Infomation/1on1";
	}
	@RequestMapping("/write_1on1")
	public String writeone() {
		return "Infomation/write_1on1";
	}
	@RequestMapping("/write_notice")
	public String write_notice() {
		return "Infomation/write_notice";
	}
	@RequestMapping("/write_question")
	public String write_question() {
		return "Infomation/write_question";
	}
	@RequestMapping("/Question")
	public String Question(HttpSession session) {
		String admin = (String)session.getAttribute("sessionID");
		if(admin.equals("hong")) {
			ArrayList<DpQuestionDto> qlist=dqservice.list();
			session.setAttribute("qlist", qlist);
			return "Infomation/Question-admin";
		}else {
			ArrayList<DpQuestionDto> qlist=dqservice.list();
			session.setAttribute("qlist", qlist);
			return "Infomation/Question";
		}
	}
	@RequestMapping("/Location")
	public String Location() {
		return "Infomation/Location";
	}
	@RequestMapping("/view_notice")
	public String view_notice(HttpServletRequest req) {
		String board_no_str = req.getParameter("board_no");
		DpNoticeDto dto = dpservice.view_notice(board_no_str);
		req.getSession().setAttribute("view_notice", dto);
		String admin = req.getSession().getAttribute("sessionID").toString();
		if(admin.equals("hong")) {
			return "Infomation/view_notice-admin";
		}else {
			return "Infomation/view_notice";	
		}
		
	}
	@RequestMapping("/view_question")
	public String view_question(HttpServletRequest req) {
		String board_no_str = req.getParameter("board_no");
		DpQuestionDto dto = dqservice.view_question(board_no_str);
		req.getSession().setAttribute("view_question", dto);
		String admin = req.getSession().getAttribute("sessionID").toString();
		if(admin.equals("hong")) {
			return "Infomation/view_question-admin";
		}else {
			return "Infomation/view_question";	
		}
		
	}
	@RequestMapping("/view_1on1")
	public String view_1on1(HttpServletRequest req, Model model) {
		String board_no_str = req.getParameter("board_no");
		Dp1on1Dto dto = oneservice.view_1on1(board_no_str);
		req.getSession().setAttribute("view_1on1", dto);
		String id = req.getSession().getAttribute("sessionID").toString();
		String writer = oneservice.getWriter(board_no_str);
		System.out.println("id:"+id);
		System.out.println("writer:"+writer);
		if(id.equals(writer) || id.equals("hong")) {
			return "Infomation/view_1on1";
		}else {
			model.addAttribute("msg", "작성자만 열람할 수 있습니다.");
			model.addAttribute("url", "1on1");
			return "redirect";
		}
		
	}
	@RequestMapping("/Infomation")
	public String Infomation(HttpSession session,Model model) {
		String Admin = (String)session.getAttribute("sessionID");
		if(Admin.equals("hong")) {
			ArrayList<DpNoticeDto> list=dpservice.list();
			session.setAttribute("list", list);
			return "Infomation/Infomation-admin";
		}else {
			ArrayList<DpNoticeDto> list=dpservice.list();
			session.setAttribute("list", list);
			return "Infomation/Infomation";
		}
	}
	// 11/9 박현식 수정한 부분
	@RequestMapping("/DeleteMember")
	public String goDeleteMember() {
		return "member/DeleteMember";
	}
	// 11/9 박현식 수정한 부분
	@RequestMapping("/DeleteMemberAction")
	public String DeleteMember(HttpServletRequest req,Model model,HttpSession session) {
		String id = (String)session.getAttribute("sessionID");
		String pw = (String)req.getParameter("password");
		
		int nResult = mservice.deleteMember(id, pw);
		if(nResult <= 0) {
			model.addAttribute("msg","비밀번호가 일치하지 않습니다.");
			System.out.println("탈퇴 실패");
			model.addAttribute("url","/DeleteMember");
		}else {
			session.invalidate();
			model.addAttribute("msg", "탈퇴되셨습니다.");
			model.addAttribute("url","/");
			System.out.println("탈퇴 성공");
		}
		return "redirect";
	}
	
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
		if(nResult <= 0) {
			model.addAttribute("msg","수정 실패");
			model.addAttribute("url", "ModifyProfile");
		}else {
			session.setAttribute("memberInfo", member);
			
			model.addAttribute("msg", "수정 성공");
			model.addAttribute("url", "/");
		}
		
		return "redirect";
	}
	
	@RequestMapping("/ModifyPasswordAction")
	public String ModifyPasswordAction(HttpServletRequest req, HttpSession session, Model model) {
		String id = session.getAttribute("sessionID").toString();
		int db_pw = mservice.getPassword(id);
		String ex_pw = req.getParameter("ex-password");
		String new_pw = req.getParameter("password");
		String pw_check = req.getParameter("password-check");
		System.out.println("db_pw:"+db_pw);
		System.out.println("ex_pw:"+ex_pw);
		System.out.println("new_pw:"+new_pw);
		System.out.println("pw_check:"+pw_check);
		System.out.println("string.valueof:"+String.valueOf(db_pw));
		
		if(!String.valueOf(db_pw).equals(ex_pw)) {
			model.addAttribute("msg","기존 비밀번호를 다시 입력해주세요.");
			model.addAttribute("url", "ModifyPassword");
		}
		else if( !new_pw.equals(pw_check) ) {
			model.addAttribute("msg","비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			model.addAttribute("url", "ModifyPassword");
		}else {
		
			int nResult = mservice.updatePassword(id,new_pw);
			if(nResult <= 0) {
				model.addAttribute("msg","비밀번호 변경 실패");
				model.addAttribute("url", "ModifyPassword");
			}else {
				model.addAttribute("msg","비밀번호를 변경하였습니다.");
				model.addAttribute("url", "/");
			}
		}
		
		return "redirect";
	}
	
	
	
	@RequestMapping("/write_noticeAction")
	public String write_noticeAction(HttpServletRequest req, HttpSession session, Model model) {
		
		String writer = (String)session.getAttribute("sessionID");
		String title = req.getParameter("title");
		String content = req.getParameter("editor4");
		DpNoticeDto dto = new DpNoticeDto();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setWriter(writer);
		dto.setReg(new Date());
		
		int nResult = dpservice.writeNotice(dto);
		ArrayList<DpNoticeDto> list=dpservice.list();
		session.setAttribute("list", list);
		
		if(nResult<=0) {
			model.addAttribute("msg","글쓰기 실패");
			model.addAttribute("url","write_notice");
			System.out.println("글쓰기 실패");
		}else {
			model.addAttribute("msg", "게시물을 등록하였습니다.");
			model.addAttribute("url", "Infomation");
		}
		
		return "redirect";
	}
	//11월 11일 박현식 수정 시작
	/**
     * @param multiFile
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/mine/imageUpload.do", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request,
            HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) throws Exception{
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();
        
        OutputStream out = null;
        PrintWriter printWriter = null;
        
        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        
        try{
            
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
            
            //이미지 경로 생성
            String path = "C:\\Users\\user\\git\\TeamProject\\DailyPicture\\src\\main\\resources\\static\\Question" + "ckImage/";
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            
            //해당 디렉토리 확인
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }
            
            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
            
            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/mine/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName;  // 작성화면
            
        // 업로드시 메시지 출력
          printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
          printWriter.flush();
            
        }catch(IOException e){
            e.printStackTrace();
        } finally {
          try {
           if(out != null) { out.close(); }
           if(printWriter != null) { printWriter.close(); }
          } catch(IOException e) { e.printStackTrace(); }
         }
        
        return;
    }
    
    /**
     * cKeditor 서버로 전송된 이미지 뿌려주기
     * @param uid
     * @param fileName
     * @param request
     * @return
     * @throws ServletException
     * @throws IOException
     */
    //
    @RequestMapping(value="/mine/ckImgSubmit.do")
    public void ckSubmit(@RequestParam(value="uid") String uid
                            , @RequestParam(value="fileName") String fileName
                            , HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException{
        
        //서버에 저장된 이미지 경로
        String path = "C:\\Users\\user\\git\\TeamProject\\DailyPicture\\src\\main\\resources\\static\\Question" + "ckImage/";
    
        String sDirPath = path + uid + "_" + fileName;
    
        File imgFile = new File(sDirPath);
        
        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if(imgFile.isFile()){
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;
            
            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;
            
            try{
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();
                
                while((readByte = fileInputStream.read(buf)) != -1){
                    outputStream.write(buf, 0, readByte);
                }
                
                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();
                
            }catch(IOException e){
                
            }finally {
               
            }
        }
    }
    @RequestMapping("/write_questionAction") //자주하는 질문은 bid=0;
    public String Write_questionAction(HttpServletRequest req, HttpSession session,Model model) {
    	String writer = (String)session.getAttribute("sessionID");
		String title = req.getParameter("title");
		String category = req.getParameter("category");
		String content = req.getParameter("editor4");

		DpQuestionDto dto = new DpQuestionDto();
		dto.setTitle(title);
		dto.setCategory(category);
		dto.setContent(content);
		dto.setWriter(writer);
		dto.setReg(new Date());
//		String path = "C:\\Users\\user\\git\\TeamProject\\DailyPicture\\src\\main\\resources\\static\\Question" + "ckImage/";
//		dto.setPicture(path);
		
		int nResult = dqservice.writeQuestion(dto);
		ArrayList<DpQuestionDto> qlist=dqservice.list();
		session.setAttribute("qlist", qlist);
		
		if(nResult<=0) {
			model.addAttribute("msg","글쓰기 실패");
			model.addAttribute("url","write_question");
			System.out.println("글쓰기 실패");
		}else {
			model.addAttribute("msg", "게시물을 등록하였습니다.");
			model.addAttribute("url", "Question");
		}
		
		return "redirect";
    }
    @RequestMapping("/write_1on1Action") //1대1 문의는 bid=1;
    public String Write_1on1Action(HttpServletRequest req, HttpSession session,Model model) {
    	String writer = (String)session.getAttribute("sessionID");
		String title = req.getParameter("title");
		String category = req.getParameter("category");
		String content = req.getParameter("editor4");

		Dp1on1Dto dto = new Dp1on1Dto();
		dto.setTitle(title);
		dto.setCategory(category);
		dto.setContent(content);
		dto.setWriter(writer);
		dto.setReg(new Date());
//		String path = "C:\\Users\\user\\git\\TeamProject\\DailyPicture\\src\\main\\resources\\static\\Question" + "ckImage/";
//		dto.setPicture(path);
		
		int nResult = oneservice.write1on1(dto);
		ArrayList<Dp1on1Dto> qlist=oneservice.list();
		session.setAttribute("qlist", qlist);
		
		if(nResult<=0) {
			model.addAttribute("msg","글쓰기 실패");
			model.addAttribute("url","write_1on1");
			System.out.println("글쓰기 실패");
		}else {
			model.addAttribute("msg", "게시물을 등록하였습니다.");
			model.addAttribute("url", "1on1");
		}
		
		return "redirect";
    }
    @RequestMapping("/modify_notice")
    public String Modify_Notice() {
    	return "Infomation/modify_notice";
    }
    @RequestMapping("/modify_noticeAction")
    public String ModifyNoticeAction(HttpServletRequest req, Model model) {
    	String board_no = req.getParameter("board_no");
    	String title = req.getParameter("title");
    	String content = req.getParameter("editor4");
    	Date reg = new Date();
    	int nResult = dpservice.modify(board_no, title, content, reg);
    	if(nResult<=0) {
    		model.addAttribute("msg","수정 실패");
    		model.addAttribute("url","modify_notice");
    	}else {
    		model.addAttribute("msg","게시글을 수정하였습니다.");
    		model.addAttribute("url","Infomation");
    	}
    	return "redirect";
    }
    @RequestMapping("/DeleteNoticeAction")
    public String DeleteNoticeAction(HttpServletRequest req, Model model) {
    	String board_no = req.getParameter("board_no");
    	
    	int nResult = dpservice.delete(board_no);
    	if(nResult<=0) {
    		model.addAttribute("msg", "삭제 실패");
    		model.addAttribute("url","redirect");
    	}else {
    		model.addAttribute("msg", "게시글을 삭제하였습니다.");
    		model.addAttribute("url", "Infomation");
    	}
    	return "redirect";
    }
    @RequestMapping("/modify_question")
    public String ModifyQuestion() {
    	return "Infomation/modify_question";
    }
    @RequestMapping("/modify_questionAction")
    public String modifyquestionAction(HttpServletRequest req, Model model) {
    	String board_no = req.getParameter("board_no");
    	String title = req.getParameter("title");
    	String category = req.getParameter("category");
    	String content = req.getParameter("editor4");
    	Date reg = new Date();
    	int nResult = dqservice.modify(board_no, title, category, content, reg);
    	if(nResult<=0) {
    		model.addAttribute("msg", "수정 실패");
    		model.addAttribute("url","modify_question");
    	}else {
    		model.addAttribute("msg", "게시글을 수정하였습니다.");
    		model.addAttribute("url","Question");
    	}
    	return "redirect";
    }
    @RequestMapping("/DeletequestionAction")
    public String DeletequestionAction(HttpServletRequest req, Model model) {
    	String board_no = req.getParameter("board_no");
    	
    	int nResult = dqservice.delete(board_no);
    	if(nResult<=0) {
    		model.addAttribute("msg","삭제 실패");
    		model.addAttribute("url","view_question");
    	}else {
    		model.addAttribute("msg", "게시글을 삭제하였습니다.");
    		model.addAttribute("url", "Question");
    	}
    	return "redirect";
    }
    @RequestMapping("/modify_1on1")
    public String Modify1on1() {
    	return "Infomation/modify_1on1";
    }
    @RequestMapping("/modify_1on1Action")
    public String modify_1on1Action(HttpServletRequest req, Model model) {
    	String board_no = req.getParameter("board_no");
    	String title = req.getParameter("title");
    	String category = req.getParameter("category");
    	String content = req.getParameter("editor4");
    	Date reg = new Date();
    	int nResult = oneservice.modify(board_no, title, category, content, reg);
    	if(nResult<=0) {
    		model.addAttribute("msg", "수정 실패");
    		model.addAttribute("url","modify_1on1");
    	}else {
    		model.addAttribute("msg", "게시글을 수정하였습니다.");
    		model.addAttribute("url","1on1");
    	}
    	return "redirect";
    }
    @RequestMapping("/Delete1on1Action")
    public String Delete1on1Action(HttpServletRequest req, Model model) {
    	String board_no = req.getParameter("board_no");
    	
    	int nResult = oneservice.delete(board_no);
    	if(nResult<=0) {
    		model.addAttribute("msg","삭제 실패");
    		model.addAttribute("url","view_1on1");
    	}else {
    		model.addAttribute("msg", "게시글을 삭제하였습니다.");
    		model.addAttribute("url", "1on1");
    	}
    	return "redirect";
    }
	//11/11 박현식 수정한 부분 끝(여기까지)
    
    //11/15 박현식 수정한 부분
    @RequestMapping("/Admin")
    public String Admin(HttpSession session) {
    	ArrayList<MemberDto> userlist = mservice.userList();
    	session.setAttribute("userlist", userlist);
    	return "Admin";
    }
    @RequestMapping("/FollowAction")
    public String FollowAction(HttpServletRequest req,Model model) {
    	String following = req.getParameter("following");
    	String follower = req.getSession().getAttribute("sessionID").toString();
    	
    	System.out.println("following:"+following);
    	System.out.println("follower:"+follower);
    	
    	int nResult = fservice.follow(following, follower);
    	if(nResult <= 0) {
    		model.addAttribute("msg", "이미 팔로우한 회원입니다.");
    		model.addAttribute("url", "FollowSetting");
    	}else {
    		model.addAttribute("msg","팔로우 성공!");
    		model.addAttribute("url", "FollowSetting");
    	}
    	return "redirect";
    }
    @RequestMapping("/UnFollowAction")
    public String UnFollowAction(HttpServletRequest req,Model model) {
    	String following = req.getParameter("following");
    	String follower = req.getSession().getAttribute("sessionID").toString();
    	
    	System.out.println("unfollowing:"+following);
    	System.out.println("unfollower:"+follower);
    	
    	int nResult = fservice.unfollow(following, follower);
    	if(nResult <= 0) {
    		model.addAttribute("msg", "실패");
    		model.addAttribute("url", "FollowSetting");
    	}else {
    		model.addAttribute("msg","언팔로우 성공!");
    		model.addAttribute("url", "FollowSetting");
    	}
    	return "redirect";
    }
	//-------------------------------------------------------------------------------------------
	@RequestMapping("/WritePage")
	public String WritePage() {
		return "member/WritePage";
	}

	/*
	 * @RequestMapping("/LoginForm") public String LoginFormPage(RedirectAttributes
	 * redirect) { redirect.addAttribute("contentPage", "member/LoginForm.jsp"); //
	 * http://localhost:8081/MainForm?contentPage=member/LoginForm.jsp return
	 * "redirect:MainForm"; }
	 */

	@RequestMapping("/MemberLoginAction")
	public String MemberLogin(HttpServletRequest request, Model model, RedirectAttributes redirect, SearchCriteria scri) throws Exception {

		redirect.addAttribute("contentPage", "member/JoinForm.jsp");
		// 데이타 전달을 위해 사용.
		
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

			//내정보를 가져와서 프로필 정복 넣기
			String sId = (String) session.getAttribute("sessionID");
			MemberDto dto = mservice.getUserInfo(sId);
			request.getSession().setAttribute("memberInfo", dto);
			
			//유저 리스트를 뿌려줌
			List<MemberDto> mmlist = mservice.mmlist();
			request.getSession().setAttribute("mmlist", mmlist);
		
		
			 scri.setId(id);
			 System.out.println(scri);
			 ArrayList<MyctDto> clist = ctservice.cList(scri);  
			 System.out.println("clist:" + clist.toString());
			 request.getSession().setAttribute("clist", clist);
			 
//			 for(int i=0; i<clist.size(); i++) {
//				 
//				 MyctDto mylist = clist.get(i);
//				 
//				 String board_no = Integer.toString(mylist.getBoard_no());
//			
//			 System.out.println(board_no);
//				 
//			 model.addAttribute("dto", ctservice.viewPan(board_no));
//			 
//			 int myct_no = 0;
//			 int board_no1 = Integer.parseInt(board_no);
//			 List<ReplyDto> replylist =rReplyService.replyList(myct_no, board_no1);
//				
//				 
//				request.getSession().setAttribute("rlist", replylist);
//			 
//			 }
			 
			 PageMaker pageMaker = new PageMaker();
			  
			  pageMaker.setCri(scri);
			  pageMaker.setTotalCount(ctservice.listCount(scri));
			  System.out.println(ctservice.listCount(scri));
			 
			  System.out.println(pageMaker.getStartPage());
			  System.out.println(pageMaker.getEndPage());
				
			 model.addAttribute("pageMaker", pageMaker);
			 
			 model.addAttribute("msg", "로그인 성공");
			 model.addAttribute("url", "/MainPage");
			
			
		}

		    return "redirect"; // redirect.jsp
	}
	
	/////////////////////////////////11-12/////////////////////////////////////////
	@RequestMapping("/Header")
	public String MListActionPage(HttpServletRequest request, RedirectAttributes redirect, Model model) {

		/* redirect.addAttribute("contentPage", "member/UserListForm.jsp"); */
		List<MemberDto> mlist = mservice.mmlist();
		WebUtils.setSessionAttribute(request, "mlist", mlist);
		
		redirect.addAttribute("contentPage", "profile/Header");
		return "redirect:MainForm";
	}
	
	
	
	
	@RequestMapping("/MemberListAction")
	public String MemberListActionPage(HttpServletRequest request, RedirectAttributes redirect, Model model) {

		/* redirect.addAttribute("contentPage", "member/UserListForm.jsp"); */
		ArrayList<MemberDto> list = mservice.userList();
		WebUtils.setSessionAttribute(request, "mlist", list);
		
		redirect.addAttribute("contentPage", "member/UserListForm");
		return "redirect:MainForm";
	}

	@RequestMapping("/MemberLogoutAction")
	public String MemberLogoutActionPage(Model model, HttpServletRequest request) {
		request.getSession().invalidate();
		System.out.println("로그아웃");
		model.addAttribute("msg", "로그아웃");
		model.addAttribute("url", "/");
		return "redirect"; // MemberLogoutAction.jsp 호출
	}

	@RequestMapping("/UserInfoForm")
	public String UserInfoFormPage(HttpServletRequest request, RedirectAttributes redirect) {
		redirect.addAttribute("contentPage", "member/UserInfoForm");
		return "redirect:MainForm";
	}

	
//	  @RequestMapping("/MemberInfoAction") public String
//	  MemberInfoActionPage(RedirectAttributes redirect, Model model,
//	  HttpServletRequest req) { HttpSession session = req.getSession(); String sId
//	  = (String) session.getAttribute("sessionID"); MemberDto dto =
//	  mservice.getUserInfo(sId); req.getSession().setAttribute("memberInfo", dto);
//	  // redirect.addFlashAttribute("memberInfo", mservice.getUserInfo(sId));
//	  redirect.addAttribute("contentPage", "member/UserInfoForm.jsp"); return
//	  "redirect:MainForm"; // UserInfoForm.jsp 호출 }
	 


	@RequestMapping("/DeleteForm")
	public String DeleteFormPage(HttpServletRequest req, RedirectAttributes redirect) {
		redirect.addAttribute("contentPage", "member/DeleteForm.jsp");

		return "redirect:MainForm";
	}

//	@RequestMapping("/MemberDeleteAction")
//	public String MemberDeleteActionPage(HttpServletRequest req, RedirectAttributes redirect, Model model) {
//		HttpSession session = req.getSession();
//		String pw = req.getParameter("password");
//		String id = (String) session.getAttribute("sessionID");
//		int password = mservice.pwCheck(id);
//		int spw = Integer.parseInt(pw);
//		if (password == spw) {
//			int o = mservice.deleteMember(id);
//			model.addAttribute("msg", "회원탈퇴.");
//			model.addAttribute("url", "/MemberLogoutAction");
//		} else {
//			System.out.println(password);
//			model.addAttribute("msg", "비밀번호가 다릅니다.");
//			model.addAttribute("url", "/");
//		}
//		return "redirect";
//
//	}

	@RequestMapping("/ModifyForm")
	public String MemberModifyFormPage(HttpServletRequest req, RedirectAttributes redirect) {
		redirect.addAttribute("contentPage", "member/ModifyForm");
		return "redirect:MainForm";
	}

	@RequestMapping("/MemberModifyFormAction")
	public String MemberModifyFormActionPage(HttpServletRequest req, Model model, RedirectAttributes redirect) {
		HttpSession session = req.getSession();
		String sId = (String) session.getAttribute("sessionID");
		MemberDto dto = mservice.getUserInfo(sId);
		session.setAttribute("memberInfo", dto);
		redirect.addAttribute("contentPage", "member/ModifyForm.jsp");
		return "redirect:MainForm";
	}

	@RequestMapping("/MemberModifyAction")
	public String MemberMidfyActionPage(HttpServletRequest req, RedirectAttributes redirect) {
		HttpSession session = req.getSession();
		MemberDto dto = new MemberDto();

		String id = (String) session.getAttribute("sessionID");
		dto.setId(id);
		dto.setPassword(req.getParameter("password"));
		dto.setMail(req.getParameter("mail1") + "@" + req.getParameter("mail2"));

		int nResult = mservice.updateMember(dto);

		if (nResult <= 0) {
			System.out.println("회원정보 수정 성공");
		} else {
			System.out.println("회원가입 수정 실패");
		}

		return "redirect:MainForm";

	}

	//////////////// join///////////////////////////////////////////

	@RequestMapping("/JoinForm")
	public String JoinFormPage(RedirectAttributes redirect) {
		redirect.addAttribute("contentPage", "member/JoinForm.jsp");
		return "member/JoinForm";
	}

	@RequestMapping(value = "/MemberJoinAction", method = RequestMethod.POST)
	public String MemberJoinActionPage(HttpServletRequest req, Model model) {

		MemberDto dto = new MemberDto();

		dto.setName(req.getParameter("name"));
		dto.setId(req.getParameter("id"));
		dto.setPassword(req.getParameter("password"));
		dto.setMail(req.getParameter("mail"));
		dto.setPhone(req.getParameter("phone"));

		System.out.println(dto.getId());
		System.out.println(dto.getName());
		System.out.println(dto.getPassword());
		System.out.println(dto.getMail());

		dto.setReg(new Date());

		int nResult = mservice.insertMember(dto);
		if (nResult <= 0) {
			System.out.println("회원가입 실패");
			model.addAttribute("msg", "회원가입 실패");
			model.addAttribute("url", "/");
		} else {
			System.out.println("회원가입 성공");

			String path ="C:\\Users\\ehowlrusdn\\git\\TeamProject\\DailyPicture\\src\\main\\resources\\static\\user\\"+req.getParameter("id");
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
	
	
	////////////////////////////////////// 11 - 13 ///////////////////////////////////////////
	@RequestMapping("/DeletePanAction")
	public String DeletePanAction(Model model, HttpServletRequest req) throws Exception{
		
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("sessionID");
		int board_no = Integer.parseInt(req.getParameter("board_no"));
		String picture = req.getParameter("picture");
		System.out.println("이것부터제발:"+ board_no);
		
		
		int nResult = ctservice.deletePan(board_no, id);
		if (nResult <= 0) {
			System.out.println("삭제 실패");
			model.addAttribute("msg", "실패");
			model.addAttribute("url", "/MyProfile");
			
		} else {
			
			rReplyService.deleteRList(board_no);
			//내정보에 있는 사진을 사진변경후 프로필 사진이 있는곳에  뿌려준다.
			//사진파일에 있는 사진도 같이 삭제해준다.
			String path = "C:\\Users\\ehowlrusdn\\git\\TeamProject\\DailyPicture\\src\\main\\resources\\static\\user\\"+ id +"\\"+picture;
						File file = new File(path);
							 if( file.exists()) 
								 file.delete();
							 				 
			System.out.println("삭제 성공");
			model.addAttribute("msg", "전송성공");
			model.addAttribute("url", "/MyProfile");
		}
		
		return "redirect";
	}
	
	
	
	//게시판 사진과 글 수정 
//	@RequestMapping(value= "/ChangPanAction", method = RequestMethod.POST)
//	public String ChangePanAction(Model model, HttpServletRequest req, @ReqestParam("filename")MultiparFile file) {
//		System.out.println("ChangPanAction");
//		
//		HttpSession session = req.getSession();
//		String id = (String) session.getAttribute("sessionID");
//		
//		
//	}
	
	
	//프로필 사진 수정 
	@RequestMapping(value = "/ChangePicture", method = RequestMethod.POST)
	public /* ResponsBody */ String ChangePicture(Model model, HttpServletRequest req,
			@RequestParam("filename") MultipartFile file) {
		// ResponsBody : retrun; 할때 주소로 넘어가지않고 화면에 return을 써줌 그러므로 빼준다.
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
		
//		return "파일업로드 성공 - 경로:"+url;

		return "redirect";

	}
	
	// 게시판 수정
		@RequestMapping(value = "/UpdatePan", method = RequestMethod.POST)
		public /* ResponsBody */ String ChangePam(Model model, HttpServletRequest req,
				@RequestParam("filename") MultipartFile file) {
			// ResponsBody : retrun; 할때 주소로 넘어가지않고 화면에 return을 써줌 그러므로 빼준다.
			System.out.println("ChangePan");
			// 섹션아이디를 보내서 회원가입할때 만들어준 폴더로 경로를 설정할 수 있다.
			HttpSession session = req.getSession();
			String id = (String) session.getAttribute("sessionID");
			

			String filename = fileUploadService.restore(file, id);
			System.out.println("url:" + filename);
			
			String oldpicture = req.getParameter("picture");
			model.addAttribute("url", filename);
			String path = "C:\\Users\\ehowlrusdn\\git\\TeamProject\\DailyPicture\\src\\main\\resources\\static\\user\\"+ id +"\\" + oldpicture;
			File oldfile = new File(path);
				 if( oldfile.exists()) 
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
