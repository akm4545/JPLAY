package jPlay.payment.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jPlay.common.service.DateService;
import jPlay.payment.service.PaymentService;
import jPlay.payment.vo.PaymentDefaultVO;
import jPlay.payment.vo.PaymentVO;

@Controller
@RequestMapping("/payment")
public class PaymentController {

    @Resource(name = "paymentService")
    private PaymentService paymentService;
    
    @Resource(name = "dateService")
    DateService dateService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    @RequestMapping(value="/main")
    public String selectPaymentList(@ModelAttribute("searchVO") PaymentVO searchVO, 
    		@RequestParam(required = false)String movieUrl, ModelMap model)
            throws Exception {
    	
    	/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	System.out.println("search" + searchVO.getSearchCondition());
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
        List<PaymentVO> paymentList = paymentService.selectPaymentList(searchVO);
        model.addAttribute("resultList", paymentList);
        
        int totCnt = paymentService.selectPaymentListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        model.addAttribute("beginDate",dateService.getBeginDate());
        model.addAttribute("endDate",dateService.getEndDate());
        
        model.addAttribute("monthList",dateService.getMonthList());
        model.addAttribute("yearList",dateService.getYearList());
        
        model.addAttribute("memberIdx", searchVO.getMemberIdx());
        
        if(movieUrl != null) {
    		model.addAttribute("movieUrl", movieUrl);
    	}
        
        return "/payment/paymentMain";
    } 
    
    @RequestMapping(value = "/addPayment", method = RequestMethod.POST)
    public String addPayment(PaymentVO paymentVO, @RequestParam(required = false)String movieUrl,
    		HttpSession session, Model model) throws Exception {
        paymentService.insertPayment(paymentVO);
        
        session.setAttribute("payInfo", true);
        model.addAttribute("msg","결제가 완료되었습니다.");
        
        if(movieUrl != null) {
        	movieUrl = movieUrl.substring(movieUrl.indexOf("/movie"));
        	
    		return "redirect:" + movieUrl;
        }else {
        	return "main/main";        	
        }
    }
}
