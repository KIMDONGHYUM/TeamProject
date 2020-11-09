package com.study.springboot;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.MyctDto;
import com.study.springboot.service.IMemberService;
import com.study.springboot.service.IMyctService;

@Controller
public class MyController {

	@Autowired
	IMemberService mservice;

	@Autowired
	IMyctService ctservice;

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

	//--------------------------------------------------------------------------------
	// 프로필 바꾼부분 - 박현식
	@RequestMapping("/MyProfile")
	public String MyProfilPage(HttpServletRequest req, RedirectAttributes redirect, Model model) {
		
		  HttpSession session = req.getSession(); 
		  String id = (String)session.getAttribute("sessionID");
		  ArrayList<MyctDto> clist = ctservice.cList(id);  
		  System.out.println("clist:" + clist.toString());
		  req.getSession().setAttribute("clist", clist);
		  
    // 프로필 뷰 
		return "profile/MyProfile";
	}

	@RequestMapping("/MyProfileView")
	public String view(HttpServletRequest request, Model model) {
		String board_no = request.getParameter("board_no");
		model.addAttribute("dto", ctservice.viewPan(board_no));
		return "profile/MyProfileView"; //view.jsp 호출함.
	}

	
	
	
	@Autowired
	FileUploadService fileUploadService;

		

	
	@RequestMapping("/ModifyProfile")
	public String ModifyProfile(HttpServletRequest req, HttpSession session) {
		String id = (String)session.getAttribute("sessionID");
		ArrayList<MemberDto> mlist = mservice.mlist(id);
		session.setAttribute("mlist", mlist);
		return "profile/ModifyProfile";
	}
	
	@RequestMapping("/ModifyPassword")
	public String ModifyPassword(HttpServletRequest req, HttpSession session) {
		String id = (String)session.getAttribute("sessionID");
		ArrayList<MemberDto> mlist = mservice.mlist(id);
		session.setAttribute("mlist", mlist);
		
		return "profile/ModifyPassword";
	}
	@RequestMapping("/ModifyEmail")
	public String ModifyEmail() {
		return "profile/ModifyEmail";
	}
	@RequestMapping("/NotifySetting")
	public String NotifySetting() {
		return "profile/NotifySetting";
	}
	@RequestMapping("/FollowSetting")
	public String FollowSetting() {
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
			String path="C:\\Users\\user\\git\\TeamProject\\DailyPicture\\src\\main\\resources\\static\\user\\"+id+"\\"+picture;
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
	public String one() {
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
			return "Infomation/Question-admin";
		}else {
			return "Infomation/Question";
		}
	}
	@RequestMapping("/Location")
	public String Location() {
		return "Infomation/Location";
	}
	@RequestMapping("/view_notice")
	public String view_notice() {
		return "Infomation/view_notice";
	}
	@RequestMapping("/view_question")
	public String view_question() {
		return "Infomation/view_question";
	}
	@RequestMapping("/view_1on1")
	public String view_1on1() {
		return "Infomation/view_1on1";
	}
	@RequestMapping("/Infomation")
	public String Infomation(HttpSession session,Model model) {
		String Admin = (String)session.getAttribute("sessionID");
		if(Admin.equals("hong")) {
			return "Infomation/Infomation-admin";
		}else {
			
			return "Infomation/Infomation";
		}
	}
	@RequestMapping("/DeleteMember")
	public String goDeleteMember() {
		return "profile/DeleteMember";
	}
	
	@RequestMapping("/DeleteMemberAction")
	public String DeleteMember(HttpServletRequest req,Model model,HttpSession session) {
		String id = (String)session.getAttribute("sessionID");
		String pw = (String)req.getParameter("password");
		
		int nResult = mservice.deleteMember(id, pw);
		if(nResult <= 0) {
			model.addAttribute("msg","실패");
			
		}else {
			session.invalidate();
			model.addAttribute("msg", "탈퇴 성공");
			
		}
		return "redirect";
	}
	//-------------------------------------------------------------------------------------------
	@RequestMapping("/WritePage")
	public String WritePage() {
		return "member/WritePage";
	}

	@RequestMapping("/LoginForm")
	public String LoginFormPage(RedirectAttributes redirect) {
		redirect.addAttribute("contentPage", "member/LoginForm.jsp");
		// http://localhost:8081/MainForm?contentPage=member/LoginForm.jsp
		return "redirect:MainForm";
	}

	@RequestMapping("/MemberLoginAction")
	public String MemberLogin(HttpServletRequest request, Model model, RedirectAttributes redirect) {

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

			
			String sId = (String) session.getAttribute("sessionID");
			MemberDto dto = mservice.getUserInfo(sId);
			request.getSession().setAttribute("memberInfo", dto);
			
			
			
			model.addAttribute("msg", "로그인 성공");
			model.addAttribute("url", "/MainPage");
			
			
		}

		return "redirect"; // redirect.jsp
	}
	
	@RequestMapping("/MemberListAction")
	public String MemberListActionPage(HttpServletRequest request, RedirectAttributes redirect, Model model) {

		redirect.addAttribute("contentPage", "member/UserListForm.jsp");
		ArrayList<MemberDto> list = mservice.userList();
		WebUtils.setSessionAttribute(request, "list", list);
		// redirect.addFlashAttribute("userList", dto);
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

	@RequestMapping("/MemberInfoAction")
	public String MemberInfoActionPage(RedirectAttributes redirect, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String sId = (String) session.getAttribute("sessionID");
		MemberDto dto = mservice.getUserInfo(sId);
		req.getSession().setAttribute("memberInfo", dto);
//		redirect.addFlashAttribute("memberInfo", mservice.getUserInfo(sId));
		redirect.addAttribute("contentPage", "member/UserInfoForm.jsp");
		return "redirect:MainForm"; // UserInfoForm.jsp 호출
	}


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

			String path = "C:\\Users\\user\\git\\TeamProject\\DailyPicture\\src\\main\\resources\\static\\user\\"+ req.getParameter("id"); // 폴더 경로 경로
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
	
	@RequestMapping("/DeletePanAction")
	public String DeletePanAction(Model model, HttpServletRequest req){
		
		
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
			
			//내정보에 있는 사진을 사진변경후 프로필 사진이 있는곳에  뿌려준다.
			//사진파일에 있는 사진도 같이 삭제해준다.
			String path = "C:\\Users\\user\\git\\TeamProject\\DailyPicture\\src\\main\\resources\\static\\user\\"+id+"\\"+picture;
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
		
		dto.setId(id);
		dto.setPicture(filename);
		
		
		
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
			String path = "C:\\Users\\ehowlrusdn\\OneDrive\\문서\\springboot\\DailyPicture\\src\\main\\resources\\static\\user\\"+ id +"\\" + oldpicture;
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
