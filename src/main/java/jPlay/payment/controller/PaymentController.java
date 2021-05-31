package jPlay.payment.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jPlay.common.service.DateService;
import jPlay.payment.service.PaymentService;
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
    
    //아임포트 깃허브
    private IamportClient api;
	
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
    
    @ResponseBody
    @RequestMapping(value = "/complete", method = RequestMethod.POST)
    public IamportResponse<Payment> complete(String imp_uid, String merchant_uid, Integer amount) throws Exception {
    	this.api = new IamportClient("6206693827971109",
    		"787af23b09fde1a46700b4b518e5615b3a666b03ee8485c1f59b574f3eda0f96822836bf78119cea");
    	IamportResponse<Payment> test = api.paymentByImpUid(imp_uid);
		if(!(amount == test.getResponse().getAmount().intValue())) {
			return new IamportResponse<Payment>();
		}
		return test;
    }
    
    @ResponseBody
    @RequestMapping(value = "/cancel", method = RequestMethod.POST)
    public IamportResponse<Payment> cancel(@RequestBody Map<String, String> payMap) throws Exception{
    	this.api = new IamportClient("6206693827971109",
        		"787af23b09fde1a46700b4b518e5615b3a666b03ee8485c1f59b574f3eda0f96822836bf78119cea");
    	
    	CancelData cancelData = new CancelData(payMap.get("merchant_uid"), false); 
    	
    	IamportResponse<Payment> test = api.cancelPaymentByImpUid(cancelData);
    	
    	return test;
    }
}
