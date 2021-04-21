package jPlay.email.service;

import java.io.File;
import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.fdl.cryptography.EgovEnvCryptoService;
import jPlay.email.vo.EmailVO;
import jPlay.member.dao.MemberMapper;
import jPlay.member.vo.MemberVO;

@Service("emailService")
public class EmailServiceImpl implements EmailService{
	
	@Resource(name = "EMSMailSender")
	private JavaMailSender mailSender;
	
	@Resource(name = "memberMapper")
	private MemberMapper memberDAO;
	
	@Resource(name = "egovEnvCryptoService")
	EgovEnvCryptoService cryptoService;
	
	private final String LOGO_DIR = "D:/전자정부프레임워크/eGovFrameDev-3.10.0-64bit/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/jPlay/resources/images";
	
	private FileSystemResource file = new FileSystemResource(new File(LOGO_DIR + "/logo.png"));
	
	@Override
	public boolean joinSend(String sendMail, int joinNum) throws Exception {
		EmailVO vo = new EmailVO();
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			String joinNumString = String.valueOf(joinNum);
			
			vo.setEmailMessage(joinNumString,"회원가입");
			
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(new InternetAddress("aaa@aaa.com","JPLAY", "UTF-8")); //발신자 설정
			messageHelper.setSubject("회원가입 인증 메일입니다."); //메일 제목
			messageHelper.setTo(sendMail); //수신자 
			messageHelper.setText(vo.getEmailMessage(),true); // 메일 내용
			messageHelper.addInline("logo.png", file);
			
			mailSender.send(message);
			
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean updateSend(String sendMail, int joinNum) throws Exception {
		EmailVO vo = new EmailVO();
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			String joinNumString = String.valueOf(joinNum);
			
			vo.setEmailMessage(joinNumString,"회원수정");
			
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(new InternetAddress("aaa@aaa.com","JPLAY", "UTF-8")); //발신자 설정
			messageHelper.setSubject("회원수정 인증 메일입니다."); //메일 제목
			messageHelper.setTo(sendMail); //수신자 
			messageHelper.setText(vo.getEmailMessage(),true); // 메일 내용
			messageHelper.addInline("logo.png", file);
			
			mailSender.send(message);
			
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public EmailVO idSearch(String memberEmail, int searchNum) throws Exception {
		EmailVO emailVO = new EmailVO();
		MemberVO memberVO = new MemberVO();
		
		memberVO.setMemberEmail(memberEmail);
		
		memberVO = memberDAO.idSearch(memberVO);
		System.out.println(memberVO.toString());
		
		if(memberVO != null) {
			System.out.println("a");
			MimeMessage message = mailSender.createMimeMessage();
			try {
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				String searchNumString = String.valueOf(searchNum);
				
				emailVO.setEmailMessage(searchNumString,"아이디 찾기");
				emailVO.setMemberId(memberVO.getMemberId());
				emailVO.setEmailStatus("success");
				emailVO.setEmailRandNum(searchNumString);
				
				messageHelper.setFrom(new InternetAddress("aaa@aaa.com","JPLAY", "UTF-8")); //발신자 설정
				messageHelper.setSubject("아이디 찾기 인증 메일입니다."); //메일 제목
				messageHelper.setTo(memberVO.getMemberEmail()); //수신자 
				messageHelper.setText(emailVO.getEmailMessage(),true); // 메일 내용
				messageHelper.addInline("logo.png", file);
				
				mailSender.send(message);
				
				return emailVO;
			} catch (MessagingException e) {
				e.printStackTrace();
				emailVO.setEmailStatus("fail");
				return emailVO;
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				emailVO.setEmailStatus("fail");
				return emailVO;
			}
		}else {
			emailVO.setEmailStatus("reCheck");
			return emailVO;
		}
	}

	@Override
	public EmailVO pwdSearch(String memberId, String memberEmail, int searchNum) throws Exception {
		EmailVO emailVO = new EmailVO();
		MemberVO memberVO = new MemberVO();
		
		memberVO.setMemberId(memberId);
		memberVO.setMemberEmail(memberEmail);
		
		memberVO = memberDAO.pwdSearch(memberVO);
		
		if(memberVO != null) {
			MimeMessage message = mailSender.createMimeMessage();
			try {
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				String searchNumString = String.valueOf(searchNum);
				
				emailVO.setEmailMessage(searchNumString, "비밀번호 찾기");
				emailVO.setMemberPwd(cryptoService.decrypt(memberVO.getMemberPwd()));
				emailVO.setEmailStatus("success");
				emailVO.setEmailRandNum(searchNumString);
				
				messageHelper.setFrom(new InternetAddress("aaa@aaa.com","JPLAY", "UTF-8")); //발신자 설정
				messageHelper.setSubject("비밀번호 찾기 인증 메일입니다."); //메일 제목
				messageHelper.setTo(memberVO.getMemberEmail()); //수신자 
				messageHelper.setText(emailVO.getEmailMessage(),true); // 메일 내용
				messageHelper.addInline("logo.png", file);
				
				mailSender.send(message);
				
				return emailVO;
			} catch (MessagingException e) {
				e.printStackTrace();
				emailVO.setEmailStatus("fail");
				return emailVO;
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				emailVO.setEmailStatus("fail");
				return emailVO;
			}
		}else {
			emailVO.setEmailStatus("reCheck");
			return emailVO;
		}
	}

	@Override
	public MemberVO emailCheck(String email) throws Exception {
		return memberDAO.emailCheck(email);
	}
}