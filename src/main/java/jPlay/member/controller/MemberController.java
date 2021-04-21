package jPlay.member.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.rte.fdl.cryptography.EgovEnvCryptoService;
import egovframework.rte.fdl.cryptography.EgovPasswordEncoder;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jPlay.admin.movie.vo.AdminMovieVO;
import jPlay.member.service.MemberService;
import jPlay.member.vo.MemberDefaultVO;
import jPlay.member.vo.MemberVO;
import jPlay.movie.service.MovieService;
import jPlay.payment.vo.PaymentVO;
import jPlay.rating.service.RatingService;
import jPlay.wihsList.service.WishListService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
    @Resource(name = "memberService")
    private MemberService memberService;
    
    @Resource(name = "egovEnvCryptoService")
	EgovEnvCryptoService cryptoService;
	
	@Resource(name = "egovEnvPasswordEncoderService")
	EgovPasswordEncoder egovPasswordEncoder;
	
	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
	@Resource(name = "wishList")
	private WishListService wishListService;
	
	@Resource(name = "ratingService")
    private RatingService ratingService;
	
	@Resource(name = "movieService")
	MovieService movieService;
	
	@Autowired
	private DefaultBeanValidator beanValidator; 
    
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, @CookieValue(value="userId", required=false) Cookie cookie,
    		@RequestParam(required = false)String movieUrl) throws Exception{
		
    	model.addAttribute("memberVO", new MemberVO());
    	
    	if(movieUrl != null) {
    		model.addAttribute("movieUrl", movieUrl);
    	}
    	
    	return "member/memberLogin";
    }
    
    @RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
    public String loginCheck(Model model,@ModelAttribute("memberVO") MemberVO vo,
    		String remember, String movieUrl) throws Exception{
    	
		vo.setMemberPwd(cryptoService.encrypt(vo.getMemberPwd()));
    	
    	MemberVO memberVO = memberService.loginCheck(vo);
    	
    	model.addAttribute("vo",memberVO);   
    	
    	if(movieUrl.indexOf("/movie") != -1) {
    		movieUrl = movieUrl.substring(movieUrl.indexOf("/movie"));
    		
    		model.addAttribute("loginMovieUrl", movieUrl);
    		
    		return "redirect:" + movieUrl;
    	}
    	return "redirect:/main";
    }
    
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String login(HttpSession session, RedirectAttributes redirectAttributes) throws Exception{
    	session.invalidate();
    	
    	redirectAttributes.addAttribute("msg","로그아웃 하셨습니다.");
    	
    	return "redirect:/main";
    }
    
    @RequestMapping(value = "/addMemberView", method = RequestMethod.GET)
    public String addMemberView(Model model) throws Exception {
        model.addAttribute("memberVO", new MemberVO());
        
        return "member/memberAdd";
    }
    
    @ResponseBody
    @RequestMapping(value = "/overlapped", method = RequestMethod.GET)
    public String overlapped(String id) throws Exception {
    	String res = memberService.overlapped(id);
    	
    	return res;
    }
    
    @RequestMapping(value = "/addMember", method = RequestMethod.POST)
    public String addMember(@ModelAttribute("memberVO") MemberVO memberVO,
    		BindingResult bindingResult) throws Exception {
    	
    	beanValidator.validate(memberVO, bindingResult);
    	
    	if(bindingResult.hasErrors()) {
    		return "member/memberAdd";
    	}else {
    		memberVO.setMemberPwd(cryptoService.encrypt(memberVO.getMemberPwd()));
    		
			memberService.insertMember(memberVO);
			
    		return "member/memberLogin";
    	}        
    }
   
    @RequestMapping("/memberInfoCheck")
    public String memberInfoCheck(int memberIdx, Model model){
    	MemberVO memberVO = new MemberVO();
    	memberVO.setMemberIdx(memberIdx);
    	
    	model.addAttribute("memberVO", memberVO);
    	
    	return "member/memberInfoCheck";
    }
    
    
    @RequestMapping("/memberInfo")
    public String selectMember(MemberVO memberVO, Model model) throws Exception {
		memberVO.setMemberPwd(cryptoService.encrypt(memberVO.getMemberPwd()));
		
		MemberVO _memberVO = memberService.selectMember(memberVO);
    	
    	if(_memberVO != null) {
			/*
			 * String password = cryptoService.decrypt(memberVO.getMemberPwd()); int
			 * passLength = password.length();
			 * 
			 * password = password.substring(0, 2);
			 * 
			 * for(int i=0; i<passLength - 2; i++) { password += "*"; }
			 * 
			 * _memberVO.setMemberPwd(password);
			 */
        	
        	model.addAttribute("memberVO", _memberVO);
        	
        	return "member/memberInfo";
    	}else {
    		model.addAttribute("memberVO", memberVO);
    		model.addAttribute("msg","비밀번호가 틀렸습니다.");
    		
        	return "member/memberInfoCheck";
    	}
    }
    
    @RequestMapping("/memberUpdate")
    public String updateMember(@ModelAttribute("memberVO") MemberVO memberVO, HttpSession session,
    		Model model,BindingResult bindingResult) throws Exception {
    	
    	beanValidator.validate(memberVO, bindingResult);
    	
    	if(bindingResult.hasErrors()){
    		return "member/memberInfo";
    	}else {
    		memberVO.setMemberPwd(cryptoService.encrypt(memberVO.getMemberPwd()));
        	memberService.updateMember(memberVO);
        	
        	model.addAttribute("msg","회원 정보를 수정했습니다. 다시 로그인 해주세요.");
        	
        	session.invalidate();
        	
        	return "redirect:/main";
    	}
    }
    
    @RequestMapping("/memberDeleteView")
    public String memberDeleteView(Model model) {
    	
    	model.addAttribute("memberVO", new MemberVO());
    	
    	return "member/memberDelete";
    }
    
    @RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
    public String memberDelete(@ModelAttribute("memberVO")MemberVO memberVO,
    		HttpSession session,Model model, RedirectAttributes redirectAttributes) throws Exception {
    	
    	memberVO.setMemberPwd(cryptoService.encrypt(memberVO.getMemberPwd()));
    	
    	MemberVO _memberVO = memberService.loginCheck(memberVO);
    	
    	if(_memberVO != null) {
    		memberService.deleteMember(_memberVO);
    		session.invalidate();
    		redirectAttributes.addAttribute("msg","JPALY 회원을 탈퇴하셨습니다.");
    		return "redirect:/main";
    	}else {
    		model.addAttribute("deleteFailed","delete");
    		return "member/memberDelete";
    	}
    }
    
    @RequestMapping(value = "/myMovie", method = RequestMethod.GET)
    public String myMovie(@ModelAttribute("searchVO") MemberVO searchVO, Model model)throws Exception {
    	System.out.println(searchVO.getPageIndex());
    	System.out.println(searchVO.getMemberIdx());
    	System.out.println(searchVO.getSearchKeyword());
    	
    	/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("moviePageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
        List<AdminMovieVO> wishMovieList = movieService.selectWishList(searchVO);
        model.addAttribute("wishMovieList", wishMovieList);
        
        int totCnt = movieService.selectWishListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        List<AdminMovieVO> recentlyList = movieService.selectRecentlyList(searchVO);
        
        model.addAttribute("recentlyList",recentlyList);
        
        return "/member/memberMovie";
    } 
    
    @ResponseBody
    @RequestMapping(value = "/wishListAdd", method = RequestMethod.GET)
    public String wishListAdd(String memberIdx, String movieIdx) throws Exception{
    	wishListService.insertWishlist(memberIdx, movieIdx);
    	
    	return "success";
    }
    
    @ResponseBody
    @RequestMapping(value = "/wishListDelete", method = RequestMethod.GET)
    public String wishListDelete(String memberIdx, String movieIdx) throws Exception{
    	wishListService.deleteWishlist(memberIdx, movieIdx);
    	
    	return "success";
    }
    
    @ResponseBody
    @RequestMapping(value = "/rating", method = RequestMethod.GET)
    public void rating(String memberIdx, String movieIdx, float score)
    		throws Exception{
    	
    	boolean ratingCheck = ratingService.ratingCheck(memberIdx, movieIdx);
    	
    	int mulScore = (int) (score * 2);
    	
    	if(ratingCheck) {
    		ratingService.updateRating(memberIdx,movieIdx,mulScore);
    	}else {
    		ratingService.insertRating(memberIdx,movieIdx,mulScore);
    	}
    	
    	movieService.updateRating(movieIdx);
    }
}