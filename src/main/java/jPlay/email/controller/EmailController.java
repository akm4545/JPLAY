package jPlay.email.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.util.JSONWrappedObject;

import jPlay.email.service.EmailService;
import jPlay.email.vo.EmailVO;
import jPlay.member.vo.MemberDefaultVO;
import jPlay.member.vo.MemberVO;

@Controller
@RequestMapping("/email")
public class EmailController {
	
	@Resource(name = "emailService")
	EmailService emailService;
	
	@ResponseBody
	@Async
	@RequestMapping("/joinSend")
	public String joinSend(String email) throws Exception{
		int joinNum = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
		
		MemberVO vo = emailService.emailCheck(email);

		if(vo == null) {
			boolean joinSend = emailService.joinSend(email, joinNum);
			
			if(joinSend) {
				return String.valueOf(joinNum);		
			}else {
				return "";
			}
		}else {
			return "ol";
		}
	}
	
	@ResponseBody
	@Async
	@RequestMapping("/updateSend")
	public String updateSend(String email) throws Exception{
		int joinNum = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
		
		boolean joinSend = emailService.updateSend(email, joinNum);
		
		if(joinSend) {
			return String.valueOf(joinNum);		
		}else {
			return "";
		}
	}
	
	@ResponseBody
	@Async
	@RequestMapping(value = "/idSearch", method = RequestMethod.POST)
	public MemberDefaultVO idSearch(String memberEmail) throws Exception{
		int searchNum = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
		
		EmailVO vo = emailService.idSearch(memberEmail, searchNum);
		System.out.println(vo.toString());
		
		return vo;
	}
		
	@ResponseBody
	@Async
	@RequestMapping(value = "/pwdSearch", method = RequestMethod.POST)
	public EmailVO pwdSearch(String memberId, String memberEmail) throws Exception{
		int searchNum = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
		
		EmailVO vo = emailService.pwdSearch(memberId, memberEmail, searchNum);
		
		return vo;
	}

}