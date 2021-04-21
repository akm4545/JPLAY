package jPlay.admin.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.rte.fdl.cryptography.EgovEnvCryptoService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jPlay.admin.member.service.AdminMemberService;
import jPlay.member.vo.MemberDefaultVO;
import jPlay.member.vo.MemberVO;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	
	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @Resource(name = "adminMemberService")
    private AdminMemberService adminMemberService;
    
    @Resource(name = "egovEnvCryptoService")
	EgovEnvCryptoService cryptoService;
    
    @Autowired
	private DefaultBeanValidator beanValidator; 
    
    @RequestMapping(value = "/main", method = RequestMethod.GET)
	public String adminMemberMain(Model model) throws Exception{
    	List<Map<String,String>> statisticsJoin = adminMemberService.selectGroupJoin();
    	
    	List<Map<String,String>> statisticsDel = adminMemberService.selectGroupDel();
    	
    	model.addAttribute("totalJoinDate",statisticsJoin);
    	model.addAttribute("totalDelDate",statisticsDel);
    	
        return "admin/member/adminMemberMain";
	}
    
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public String adminMemberList(@ModelAttribute("searchVO") MemberDefaultVO searchVO, 
    		@RequestParam(required = false)String update, @RequestParam(required = false)String delete,
    		ModelMap model) throws Exception {
		
		/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
        List<EgovMap> memberList = adminMemberService.selectMemberList(searchVO);
        
        for(int i=0; i<memberList.size(); i++) {
        	memberList.get(i).put("memberPwd", cryptoService.decrypt((String) memberList.get(i).get("memberPwd")));
        }
        
        model.addAttribute("resultList", memberList);
        
        int totCnt = adminMemberService.selectMemberListTotCnt(searchVO);
        
        paginationInfo.setTotalRecordCount(totCnt);
        
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("searchConditionMap",searchCondition());
        
        model.addAttribute("update",update);
        model.addAttribute("delete",delete);
        
        System.out.println(searchVO.getSearchCondition());
        System.out.println(searchVO.getSearchKeyword());
        
		return "admin/member/adminMemberList";
	}
	
	@RequestMapping(value = "/memberUpdateView" , method = RequestMethod.GET)
	public String memberUpdateView(int memberIdx,MemberDefaultVO searchVO,
			Model model) throws Exception {
		
		MemberVO vo = adminMemberService.selectMember(memberIdx);
		
		vo.setMemberPwd(cryptoService.decrypt(vo.getMemberPwd()));
		
		vo.setPageIndex(searchVO.getPageIndex());
		vo.setSearchCondition(searchVO.getSearchCondition());
		vo.setSearchKeyword(searchVO.getSearchKeyword());
		
		model.addAttribute("memberVO", vo);
		
		return "admin/member/adminMemberUpdate";
	}
	
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(@ModelAttribute("memberVO") MemberVO vo, Model model,
			BindingResult bindingResult, RedirectAttributes redirectAttributes) throws Exception {
		
		beanValidator.validate(vo, bindingResult);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("memberVO", vo);
			return "admin/member/adminMemberUpdate";
		}else {
			vo.setMemberPwd(cryptoService.encrypt(vo.getMemberPwd()));
			adminMemberService.updateMember(vo);
			redirectAttributes.addFlashAttribute("searchVO", vo);
			redirectAttributes.addAttribute("update", "수정이 완료되었습니다.");
			return "redirect:/admin/member/memberList";
		}
	}
	
	@RequestMapping(value = "/memberDeleteList", method = RequestMethod.GET)
	public String memberDeleteList(@ModelAttribute("searchVO") MemberDefaultVO searchVO, 
    		ModelMap model) throws Exception {
		
		/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
        List<MemberVO> memberList = adminMemberService.selectDeleteList(searchVO);
        
//        for(int i=0; i<memberList.size(); i++) {
//        	memberList.get(i).setMemberPwd(cryptoService.decrypt(memberList.get(i).getMemberPwd()));
//        }
        
        model.addAttribute("resultList", memberList);
        
        int totCnt = adminMemberService.selectDeleteListTotCnt(searchVO);
        
		paginationInfo.setTotalRecordCount(totCnt);
		
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("searchConditionMap",searchCondition());
        
		return "admin/member/adminMemberDelete";
	}
	
	@RequestMapping(value = "/memberDelete", method = RequestMethod.GET)
	public String memberDelete(int memberIdx, MemberDefaultVO searchVO, 
			RedirectAttributes redirectAttributes) throws Exception {
		
		adminMemberService.deleteMember(memberIdx);
		
		redirectAttributes.addFlashAttribute("seachVO", searchVO);
		redirectAttributes.addAttribute("delete", "회원을 삭제했습니다.");
		
		return "redirect:/admin/member/memberDeleteList";
	}
	
	@RequestMapping(value = "/totalDelete", method = RequestMethod.POST)
	public String totalDelete(String deleteList, RedirectAttributes redirectAttributes)
			throws Exception{
		
		List<Integer> memberDeleteList = new ArrayList<Integer>();
		
		deleteList = deleteList.substring(0,deleteList.length() - 1);
		String[] _deleteList =  deleteList.split(",");
		
		for(int i=0; i<_deleteList.length; i++) {
			memberDeleteList.add(Integer.parseInt(_deleteList[i]));
		}
		
		adminMemberService.totalDelete(memberDeleteList);
		
		redirectAttributes.addAttribute("delete", "회원을 삭제했습니다.");
		
		return "redirect:/admin/member/memberDeleteList";
	}
	
	private Map<String,String> searchCondition(){
		
		Map<String,String> searchConditionMap = new HashMap<String, String>();
		
		searchConditionMap.put("member_idx","고유번호");
		searchConditionMap.put("member_id","아이디");
		searchConditionMap.put("member_name","이름");
		searchConditionMap.put("member_email","이메일");
		searchConditionMap.put("member_tel","전화번호");
		searchConditionMap.put("member_memberJoindate","가입일");
		searchConditionMap.put("member_del","탈퇴여부");
		
		return searchConditionMap;
	}
}