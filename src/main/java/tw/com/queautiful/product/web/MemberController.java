package tw.com.queautiful.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.com.queautiful.commons.util.EmailSender;
import tw.com.queautiful.commons.util.FileProcessing;
import tw.com.queautiful.product.entity.Article;
import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.service.MemberService;

@Controller
@RequestMapping("/members")
public class MemberController {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MemberService service;
	@Autowired
	private EmailSender mailSender;
	
	//member個人頁面
	@RequestMapping("/personal")
	public String memberPersonal(Model model){
		Member member = service.getById(1L);
		List<Article> articles = service.getById(1L).getArticlesWorteByAuthor();
		model.addAttribute("articles", articles);
		model.addAttribute("member", member);
		log.debug(member.toString());
		return "/member/memberPersonal";
	}
	
	
	// 提供jqGrid抓取資料使用
	@RequestMapping("/select_jqgrid")
	@ResponseBody
	public Page<Member> select(@RequestParam(required = false) Integer page,
			@RequestParam(required = false) Integer rows) {

		log.debug("page = {}", page);
		log.debug("rows = {}", rows);
		
		Pageable pageable = new PageRequest(page - 1, rows);
		Page<Member> memberPage = service.getAll(pageable);
		log.debug(memberPage.toString());
		log.debug("getSize = {}", memberPage.getSize()); // 列數(資料筆數)
		log.debug("getNumber = {}", memberPage.getNumber()); // 頁數-1
		log.debug("getTotalPages() = {}", memberPage.getTotalPages()); // 總共幾頁
		log.debug("getTotalElements = {}", memberPage.getTotalElements()); // 全部有幾筆資料
		log.debug("getNumberOfElements = {}", memberPage.getNumberOfElements()); // 列數(資料筆數)
		log.debug("----------------------------------------------------------"); // 測試
		return memberPage;
	}
	
	//check whether the account has been taken
	@RequestMapping("/check_email")
	@ResponseBody
	public Boolean accountCheck(String email){
		return service.accountCheck(email);
	}

	//return signUp page
	@RequestMapping("/register")
	public String memberRegister(){
		return "/member/memberRegister";
	}
	
	//return forgotPassword page
	@RequestMapping("/forgotpsw")
	public String forgotPswPage(){
		return "/member/member_forgotPsw"; 
	}
	
	//send reset-psw email
	@RequestMapping("/requestforpsw")
	@ResponseBody
	public String requestForResetPsw(@RequestParam String email, HttpServletRequest req){
		String resetPswUrl = service.createPswResetUrl(email, req);
		log.debug("URL: {}", resetPswUrl);
		mailSender.sendResetPsw(email, resetPswUrl);
		return "Please check your email and follow the instructions.";
	}
	
	//return reset-password Page
	@RequestMapping("/resetpassword")
	public String changePswPage(@RequestParam String token, Model model){
		Member member = service.getByResetPswToken(token);
		log.debug("email token: {}", token);
		String validToken = service.validateResetPswToken(token);
		log.debug("validToken: {}", validToken);
		if(validToken==null){
			model.addAttribute("email", member.getEmail());
			return "/member/resetPassword";
		}
		//xxxxxxxxxx   回傳validToken訊息
		return "/fms";
	}
	
	//update password
	@RequestMapping(value="/updatepassword", method=RequestMethod.POST)
	@ResponseBody
	public String resetPassword(@RequestParam String email, @RequestParam String password){
		Member member = service.getByEmail(email);
		if(member != null){
			service.updatePassword(member, password);
			return "success";
		}
		return "failure";
	}
	
	@RequestMapping("/check_emailexist")
	@ResponseBody
	public Boolean emailCheck(String email){
		return !service.accountCheck(email);
	}
	
	//設定停權天數
	@RequestMapping("/suspend")
	public void memberSuspending(@RequestParam Long memberId, @RequestParam Integer memberSuspendDays){
		log.debug("inside controller");//test
		service.memberSuspend(memberId, memberSuspendDays);
	}
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("members", service.getAll());
		return "/member/memberList";
	}
	
	@RequestMapping("/add")
	public String addPage(){
		return "/member/memberAdd";//
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	@ResponseBody
	public Member insert(@RequestPart(name="member") Member member, 
			@RequestPart(value="memberImgFile", required = false) MultipartFile memberImgFile){
		service.insert(member);
		if(memberImgFile!=null){
			String mId = "member"+member.getMemberId().toString();
			String memberImg = FileProcessing.saveImg(mId, "member", memberImgFile);
			member.setMemberImg(memberImg);
		}
		log.debug("memberImg: {}", member.getMemberImg());//test
		member.setMemberRegiDate(new java.sql.Date(new java.util.Date().getTime()));
		service.update(member);
		return service.getById(member.getMemberId());
	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long memberId, Model model){
		model.addAttribute("member", service.getById(memberId));
		return "/member/memberEdit";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseBody
	public Member update(@RequestPart(name="member") Member member, 
			@RequestPart(value="memberImgFile", required = false) MultipartFile memberImgFile){
		
		if(memberImgFile!=null){
			String mId = "member"+member.getMemberId();
			String memberImg = FileProcessing.saveImg(mId, "member", memberImgFile);
			member.setMemberImg(memberImg);
		}
		log.debug(member.getMemberImg());//test
		service.update(member);
		return service.getById(member.getMemberId());
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	@ResponseBody
	public void delete(@RequestBody Member member){
		log.debug(member.toString());
		service.delete(member.getMemberId());
	}
	
	@RequestMapping("/show")
	public void show(HttpServletResponse resp, @RequestParam Long memberId) {
		Member member = service.getById(memberId);
		String memberImg = member.getMemberImg();
		FileProcessing.showImg(resp, memberImg);
	}
	
	// 提供一般抓取資料使用
	@RequestMapping("/select")
	@ResponseBody
	public List<Member> select() {
		return service.getAll();
	}

}
