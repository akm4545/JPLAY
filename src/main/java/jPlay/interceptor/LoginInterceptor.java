package jPlay.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import jPlay.admin.payment.service.AdminPaymentService;
import jPlay.member.vo.MemberVO;
import jPlay.payment.service.PaymentService;
import jPlay.payment.vo.PaymentVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Resource(name = "paymentService")
	PaymentService paymentService; 
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		
		MemberVO vo = (MemberVO)modelMap.get("vo");
		
		String remember = request.getParameter("remember") == null ? "" : request.getParameter("remember");
		
		if(vo != null) {
			if(vo.getMemberId().equals("adminadmin")) {
				session.setAttribute("admin", true);
				session.setAttribute("payInfo", true);
			}else {
				PaymentVO payVO = paymentService.selectPayment(vo.getMemberIdx());
				
				if(payVO != null) {
					session.setAttribute("payInfo", true);
				}
			}
			session.setAttribute("memberInfo", vo);
			if(remember.equals("remember")) {
				Cookie rememberCookie = new Cookie("userId", vo.getMemberId());
				rememberCookie.setMaxAge(60 * 60 * 24 * 30);
				rememberCookie.setPath("/");
				
				response.addCookie(rememberCookie);
			}else {
				Cookie rememberCookie = new Cookie("userId", null);
				rememberCookie.setMaxAge(0);
				rememberCookie.setPath("/");
				
				response.addCookie(rememberCookie);
			}
		}else {
			modelAndView.addObject("movieUrl", modelMap.get("loginMovieUrl"));
			modelAndView.addObject("loginFailed",true);
			modelAndView.setViewName("/member/memberLogin");
		}
	}
}