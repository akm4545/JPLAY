package jPlay.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminPageInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		boolean adminSw = session.getAttribute("admin") == null ? false : true;
		
		if(!adminSw) {
			request.setAttribute("msg", "잘못된 접근입니다.");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/main");
			dispatcher.forward(request, response);
		}
		return super.preHandle(request, response, handler);
	}
}