package jPlay.admin.payment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jPlay.admin.file.vo.AdminFileVO;
import jPlay.admin.movie.vo.AdminMovieDefaultVO;
import jPlay.admin.movie.vo.AdminMovieVO;
import jPlay.admin.payment.service.AdminPaymentService;
import jPlay.payment.vo.PaymentDefaultVO;
import jPlay.payment.vo.PaymentVO;

@Controller
@RequestMapping("/admin/payment")
public class AdminPaymentController {
	
	@Resource(name = "adminPaymentService")
	AdminPaymentService adminPaymentService; 
	
	 /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @Autowired
	private DefaultBeanValidator beanValidator; 
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String paymentMain(Model model) throws Exception {
		List<Map<String,String>> statisticsPay = adminPaymentService.selectTotalPay();
		
		List<Map<String,String>> statisticsMethod = adminPaymentService.selectTotalPayMethod();
		
		model.addAttribute("groupPayDate",statisticsPay);
		model.addAttribute("groupPayMethod",statisticsMethod);
		
		return "admin/payment/adminPaymentMain";	
	}
	
	@RequestMapping(value="/paymentList", method = RequestMethod.GET)
    public String selectMovieList(@ModelAttribute("searchVO") PaymentVO searchVO, 
    		@RequestParam(required = false)String update, Model model) throws Exception {
    	
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
		
        List<?> paymentList = adminPaymentService.selectMovieList(searchVO);
        
        model.addAttribute("resultList", paymentList);
        
        int totCnt = adminPaymentService.selectMovieListTotCnt(searchVO);
        
		paginationInfo.setTotalRecordCount(totCnt);
		
        model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("searchConditionMap",searchCondition());
        
        model.addAttribute("update",update);
        
        return "admin/payment/adminPaymentList";
    }
	
	
	@RequestMapping(value = "/paymentInfo", method = RequestMethod.GET)
    public String paymentInfo(int paymentIdx, PaymentDefaultVO searchVO, Model model,
    		HttpServletRequest request) throws Exception {
    	
    	PaymentVO paymentVO = adminPaymentService.selectPayment(paymentIdx);
    	
    	paymentVO.setPageIndex(searchVO.getPageIndex());
    	paymentVO.setSearchCondition(searchVO.getSearchCondition());
    	paymentVO.setSearchKeyword(searchVO.getSearchKeyword());
    	
    	paymentVO.setPaymentDate(paymentVO.getPaymentDate().substring(0,10));
    	paymentVO.setPaymentEnddate(paymentVO.getPaymentEnddate().substring(0, 10));
    	
    	List<String> payMethod = new ArrayList<String>();
    	String[] payInfo = paymentVO.getPaymentInfo().split(" ");
    	
    	model.addAttribute("payInfo", payInfo);
    	model.addAttribute("payMethod",payMethod());
    	model.addAttribute("paymentVO", paymentVO);
    	
    	return "admin/payment/adminPaymentInfo";
    }
	
	@RequestMapping(value="/paymentDeleteList", method = RequestMethod.GET)
    public String paymentDeleteList(@ModelAttribute("searchVO") PaymentVO searchVO, 
    		@RequestParam(required = false)String insert,@RequestParam(required = false)String update,
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
		
        List<?> paymentList = adminPaymentService.selectMovieList(searchVO);
        
        model.addAttribute("resultList", paymentList);
        
        int totCnt = adminPaymentService.selectMovieListTotCnt(searchVO);
        
		paginationInfo.setTotalRecordCount(totCnt);
		
        model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("searchConditionMap",searchCondition());
        
        model.addAttribute("insert", insert);
        model.addAttribute("update",update);
        
        return "admin/payment/adminPaymentDeleteList";
    }
	
	@RequestMapping("/paymentDelete")
    public String deletePayment(PaymentVO paymentVO,
    		RedirectAttributes redirectAttributes) throws Exception {
    	
        adminPaymentService.deletePayment(paymentVO);
        
        redirectAttributes.addFlashAttribute("searchVO", paymentVO);
        redirectAttributes.addAttribute("delete", "??????????????? ?????????????????????.");
        
        return "redirect:/admin/payment/paymentDeleteList";
    }
	
	@RequestMapping("/paymentUpdate")
    public String updatePaytment(@ModelAttribute("paymentVO") PaymentVO paymentVO,
    		RedirectAttributes redirectAttributes, Model model) throws Exception {
		
        adminPaymentService.updatePayment(paymentVO);
        
        redirectAttributes.addFlashAttribute("searchVO", paymentVO);
        redirectAttributes.addAttribute("update","??????????????? ?????????????????????.");
        
        return "redirect:/admin/payment/paymentList";
    }
	
	private Map<String,String> searchCondition(){
    	
		Map<String,String> searchConditionMap = new HashMap<String, String>();
		
		searchConditionMap.put("member_idx","????????????");
		searchConditionMap.put("payment_idx","??????????????????");
		searchConditionMap.put("member_id","???????????????");
		searchConditionMap.put("member_name","????????????");
		searchConditionMap.put("payment_date","?????????");
		searchConditionMap.put("payment_amount","????????????");
		searchConditionMap.put("payment_method","????????????");
		searchConditionMap.put("payment_info","????????????");
		searchConditionMap.put("payment_endDate","??????????????????");
		
		return searchConditionMap;
	}
	
	private List<String> payMethod() {
    	List<String> payMethod = new ArrayList<String>();
    	
    	payMethod.add("?????????");
    	payMethod.add("????????????");
    	payMethod.add("?????????");        
      
        return payMethod;
   }
}