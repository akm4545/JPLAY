package jPlay.userService.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jPlay.admin.userService.notify.vo.AdminNotifyVO;
import jPlay.userService.notify.service.NotifyService;
import jPlay.userService.qna.service.QnaService;
import jPlay.userService.qna.vo.QnaDefaultVO;
import jPlay.userService.qna.vo.QnaVO;

@Controller
@RequestMapping("/userService")
public class UserServiceController {

	@Resource(name = "qnaService")
	QnaService qnaService;
	
	@Resource(name = "notifyService")
	NotifyService notifyService;
	
	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @Autowired
	private DefaultBeanValidator beanValidator;
	
	@RequestMapping("/main")
	public String main(@ModelAttribute("searchVO") QnaVO searchVO, Model model) throws Exception {
		
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
		
		
		if(searchVO.getMemberIdx() != 0) {
			List<?> qnaList = qnaService.selectQnaList(searchVO);
			model.addAttribute("resultList", qnaList);
			
			int totCnt = qnaService.selectQnaListTotCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);
		}
        
		return "userService/userServiceMain";
	}
	
	@RequestMapping("/questionView")
	public String questionView(int memberIdx, Model model) throws Exception{
		
		QnaVO qnaVO = new QnaVO();
		qnaVO.setMemberIdx(memberIdx);
		model.addAttribute("qnaVO",qnaVO);
		
		model.addAttribute("type", qnaType());
		
		return "userService/questionView";
	}
	
	@RequestMapping(value = "/addQna", method = RequestMethod.POST)
	public String addQna(@ModelAttribute("qnaVO") QnaVO qnaVO, Model model,
			BindingResult bindingResult, RedirectAttributes redirectAttributes) throws Exception{
		
		beanValidator.validate(qnaVO, bindingResult);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("qnaVO",qnaVO);
			return "userService/questionView";
		}else {
			qnaService.insertQna(qnaVO);
			
			redirectAttributes.addAttribute("memberIdx", qnaVO.getMemberIdx());
			
			return "redirect:/userService/main";
		}
	}
	
	@RequestMapping(value = "/notifyList", method = RequestMethod.GET)
	public String notifyList(@ModelAttribute("searchVO") AdminNotifyVO searchVO, 
    		Model model) throws Exception{
		
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
		
		if(searchVO.getSearchKeyword().equals("service")) {
			searchVO.setSearchKeyword("서비스공지");
			searchVO.setSearchCondition("S");
		}else if(searchVO.getSearchKeyword().equals("content")){
			searchVO.setSearchKeyword("콘텐츠공지");
			searchVO.setSearchCondition("C");
		}
		
		System.out.println(searchVO.getSearchKeyword());
		System.out.println(searchVO.getSearchCondition());
		
		List<AdminNotifyVO> notifyList = notifyService.selectNotifyList(searchVO);
        model.addAttribute("resultList", notifyList);
        
        int totCnt = notifyService.selectNotifyListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
	
		return "userService/notifyList";
	}
	
	@RequestMapping("/notifyInfo")
	public String notifyInfo(AdminNotifyVO vo, Model model) throws Exception{
		AdminNotifyVO notifyVO = notifyService.selectNotify(vo);
		AdminNotifyVO previousNotifyVO = notifyService.selectPreviousNotify(vo);
		AdminNotifyVO nextNotifyVO = notifyService.selectNextNotify(vo);
		
		notifyVO.setPageIndex(vo.getPageIndex());
		notifyVO.setSearchCondition(vo.getSearchCondition());
		if(vo.getSearchKeyword().equals("S")) {
			notifyVO.setSearchCondition("service");
		}else if(vo.getSearchKeyword().equals("C")){
			notifyVO.setSearchCondition("content");
		}
		
		notifyVO.setSearchKeyword(vo.getSearchKeyword());
		
		model.addAttribute("notify", notifyVO);
		model.addAttribute("preNotify",previousNotifyVO);
		model.addAttribute("nextNotify",nextNotifyVO);
		
		return "userService/notifyInfo";
	}
		
	private Map<String,String> qnaType(){
		Map<String,String> type = new HashMap<String, String>();
		
		type.put("작동오류", "작동오류");
		type.put("결제/요금", "결제/요금");
		type.put("이용불편사항", "이용불편사항");
		type.put("콘텐츠요청", "콘텐츠요청");
		type.put("회원정보", "회원정보");
		type.put("기타", "기타");
		
		return type;	
	}
}
