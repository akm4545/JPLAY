package jPlay.admin.userService;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jPlay.admin.userService.notify.service.AdminNotifyService;
import jPlay.admin.userService.notify.vo.AdminNotifyDefaultVO;
import jPlay.admin.userService.notify.vo.AdminNotifyVO;
import jPlay.admin.userService.qna.service.AdminQnaService;
import jPlay.userService.qna.vo.QnaDefaultVO;
import jPlay.userService.qna.vo.QnaVO;

@Controller
@RequestMapping("/admin/userService")
public class AdminUserServiceController {
	
	@Resource(name = "adminQnaService")
	AdminQnaService adminQnaService;
	
	@Resource(name = "adminNotifyService")
	AdminNotifyService adminNotifyService;
	
	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @Autowired
	private DefaultBeanValidator beanValidator;
	
	@RequestMapping("/main")
	public String main(Model model) throws Exception {
		
		Map<String,List<QnaVO>> qnaTypeMap = adminQnaService.selectNewQuestion();
		
		model.addAttribute("newQuestionMap",qnaTypeMap);
		
		return "admin/userService/adminUserServiceMain";
	}
	
	@RequestMapping("/questionList")
	public String questionList(@ModelAttribute("searchVO") QnaDefaultVO searchVO, 
			@RequestParam(value = "update", required = false) String update,Model model) throws Exception {
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
		
        List<?> qnaList = adminQnaService.selectQuestionList(searchVO);
        model.addAttribute("resultList", qnaList);
        
        int totCnt = adminQnaService.selectQuestionListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("searchConditionMap",searchCondition());
        
        if(update != null) {
        	model.addAttribute("update",update);
        }
		
		return "admin/userService/adminUserServiceQuestionList";
	}
	
	@RequestMapping("/questionInfo")
	public String questionInfo(QnaVO vo, Model model) throws Exception {
		
		QnaVO resultVO = adminQnaService.selectQna(vo);
		
		resultVO.setPageIndex(vo.getPageIndex());
		resultVO.setSearchCondition(vo.getSearchCondition());
		resultVO.setSearchKeyword(vo.getSearchKeyword());
		resultVO.setQnaQuestionsdate(resultVO.getQnaQuestionsdate().substring(0, 10));
		
		model.addAttribute("qnaVO", resultVO);
		model.addAttribute("qnaType", qnaType());
		
		return "admin/userService/adminUserServiceQuestionInfo";
	}
	
	@RequestMapping("/questionUpdate")
	public String questionUpdate(@ModelAttribute("qnaVO") QnaVO qnaVO, BindingResult bindingResult,
			RedirectAttributes redirectAttributes, Model model) throws Exception {
		
		beanValidator.validate(qnaVO, bindingResult);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("qnaVO",qnaVO);
			return "admin/userService/adminUserServiceQuestionInfo";
		}else {
			adminQnaService.updateQna(qnaVO);
	        
	        redirectAttributes.addFlashAttribute("searchVO", qnaVO);
	        redirectAttributes.addAttribute("update","답변을 등록하였습니다.");
	        
	        return "redirect:/admin/userService/questionList";
		}
	}
	
	@RequestMapping("/answerList")
	public String answerList(@ModelAttribute("searchVO") QnaDefaultVO searchVO, 
			@RequestParam(value = "update", required = false) String update, ModelMap model) throws Exception {
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
		
		System.out.println(searchVO.getSearchCondition());
		
        List<?> qnaList = adminQnaService.selectAnswerList(searchVO);
        model.addAttribute("resultList", qnaList);
        
        int totCnt = adminQnaService.selectAnswerListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("searchConditionMap",searchCondition());
        
        if(update != null) {
        	model.addAttribute("update",update);
        }
		
		return "admin/userService/adminUserServiceAnswerList";
	}
	
	@RequestMapping("/answerInfo")
	public String answerInfo(QnaVO vo, Model model) throws Exception {
		
		QnaVO resultVO = adminQnaService.selectQna(vo);
		
		resultVO.setPageIndex(vo.getPageIndex());
		resultVO.setSearchCondition(vo.getSearchCondition());
		resultVO.setSearchKeyword(vo.getSearchKeyword());
		resultVO.setQnaQuestionsdate(resultVO.getQnaQuestionsdate().substring(0, 10));
		resultVO.setQnaAnswerdate(resultVO.getQnaQuestionsdate().substring(0, 10));
		
		model.addAttribute("qnaVO", resultVO);
		model.addAttribute("qnaType", qnaType());
		
		return "admin/userService/adminUserServiceAnswerInfo";
	}
	
	@RequestMapping("/answerUpdate")
	public String answerUpdate(@ModelAttribute("qnaVO") QnaVO qnaVO, BindingResult bindingResult,
			RedirectAttributes redirectAttributes, Model model) throws Exception {
		
		beanValidator.validate(qnaVO, bindingResult);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("qnaVO",qnaVO);
			return "admin/userService/adminUserServiceAnswerInfo";
		}else {
			adminQnaService.updateQna(qnaVO);
	        
	        redirectAttributes.addFlashAttribute("searchVO", qnaVO);
	        redirectAttributes.addAttribute("update","답변을 수정하였습니다.");
	        
	        return "redirect:/admin/userService/answerList";
		}
	}
	
	@RequestMapping("/notifyAddView")
	public String notifyAddView(@ModelAttribute("notifyVO") AdminNotifyVO notifyVO,
			Model model) throws Exception{
		
		model.addAttribute("notifyType", notifyType());
		
		return "admin/userService/adminUserServiceNotifyAddView";
	}
	
	@RequestMapping("/notifyAdd")
	public String notifyAdd(@ModelAttribute("notifyVO") AdminNotifyVO notifyVO,
			 BindingResult bindingResult,Model model) throws Exception {
		
		beanValidator.validate(notifyVO, bindingResult);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("notifyVO",notifyVO);
			
			return "admin/userService/adminUserServiceNotifyAddView";
		}else {
			adminNotifyService.insertNotify(notifyVO);
			
			model.addAttribute("insert","공지사항을 등록했습니다.");
			
			return "redirect:/admin/userService/notifyList";
		}
	}
	
	@RequestMapping("/notifyList")
	public String notifyList(@ModelAttribute("searchVO") AdminNotifyDefaultVO searchVO, 
			@RequestParam(value = "insert", required = false)String insert,
			@RequestParam(value = "update", required = false)String update,Model model) throws Exception {
		
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
		
        List<?> notifyList = adminNotifyService.selectNotifyList(searchVO);
        model.addAttribute("resultList", notifyList);
        
        int totCnt = adminNotifyService.selectNotifyListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("searchConditionMap",notifySearchCondition());
        
        if(insert != null) {
        	model.addAttribute("insert",insert);
        }else if(update != null) {
        	model.addAttribute("update",update);
        }
            
        return "admin/userService/adminUserServiceNotifyList";
	}
	
	@RequestMapping("/notifyDeleteList")
	public String notifyDeleteList(@ModelAttribute("searchVO") AdminNotifyDefaultVO searchVO, 
			@RequestParam(value = "delete", required = false)String delete, Model model) throws Exception {
		
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
		
        List<?> notifyList = adminNotifyService.selectNotifyList(searchVO);
        model.addAttribute("resultList", notifyList);
        
        int totCnt = adminNotifyService.selectNotifyListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("searchConditionMap",notifySearchCondition());
        
        if(delete != null) {
        	model.addAttribute("delete",delete);
        }
            
        return "admin/userService/adminUserServiceNotifyDeleteList";
	}
	
	
	
	@RequestMapping("/notifyInfo")
	public String notifyInfo(AdminNotifyVO vo, Model model) throws Exception {
		
		AdminNotifyVO resultVO = adminNotifyService.selectNotify(vo);
		
		resultVO.setPageIndex(vo.getPageIndex());
		resultVO.setSearchCondition(vo.getSearchCondition());
		resultVO.setSearchKeyword(vo.getSearchKeyword());
		resultVO.setNotifyDate(resultVO.getNotifyDate().substring(0, 10));
		
		model.addAttribute("notifyVO", resultVO);
		model.addAttribute("notifyType", notifyType());
		
		return "admin/userService/adminUserServiceNotifyInfo";
	}
	
	@RequestMapping("/notifyUpdate")
	public String notifyUpdate(@ModelAttribute("notifyVO")AdminNotifyVO vo, 
			BindingResult bindingResult,RedirectAttributes redirectAttributes, 
			Model model) throws Exception{
		
		beanValidator.validate(vo, bindingResult);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("notifyVO",vo);
			
			return "admin/userService/adminUserServiceNotifyInfo";
		}else {
			adminNotifyService.updateNotify(vo);
			System.out.println(vo.toString());
			redirectAttributes.addAttribute("update","공지사항을 수정했습니다.");
			redirectAttributes.addFlashAttribute("searchVO", vo);
			
			return "redirect:/admin/userService/notifyList";
		}
	}
	
	@RequestMapping("/notifyDelete")
	public String notifyDelete(AdminNotifyVO vo, RedirectAttributes redirectAttributes) 
			throws Exception{
		
		adminNotifyService.deleteNotify(vo);
		
		redirectAttributes.addAttribute("delete","공지사항을 삭제했습니다");
		redirectAttributes.addFlashAttribute("searchVO",vo);
		
		return "redirect:/admin/userService/notifyDeleteList";
	}
	
	private Map<String,String> searchCondition(){
		Map<String,String> searchConditionMap = new HashMap<String, String>();
		
		searchConditionMap.put("qna_idx","고유번호");
		searchConditionMap.put("member_id","회원아이디");
		searchConditionMap.put("qna_type","질문구분");
		searchConditionMap.put("qna_title","질문제목");
		searchConditionMap.put("qna_questionsDate","질문일");
		
		return searchConditionMap;
	}
	
	private Map<String,String> notifySearchCondition(){
		Map<String,String> searchConditionMap = new HashMap<String, String>();
		
		searchConditionMap.put("notify_idx","고유번호");
		searchConditionMap.put("notify_title","공지제목");
		searchConditionMap.put("notify_type","공지구분");
		searchConditionMap.put("notify_date","등록일");
		
		return searchConditionMap;
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
	
	private List<String> notifyType(){
		List<String> type = new ArrayList<String>();
		
		type.add("서비스공지");
		type.add("콘텐츠공지");
		
		return type;
	}
}
