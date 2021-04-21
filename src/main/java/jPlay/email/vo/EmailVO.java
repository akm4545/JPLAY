package jPlay.email.vo;

import jPlay.member.vo.MemberVO;

public class EmailVO extends MemberVO{
	private String emailMessage;
	
	private String emailStatus;
	
	private String emailRandNum;

	public String getEmailMessage() {
		return emailMessage;
	}

	public void setEmailMessage(String title, String emailMessage) {
		this.emailMessage = "<xmeta charset='utf-8'>"
				+ "<xmeta name='viewport' content='width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0'>"
				+ "<xmeta http-equiv='X-UA-Compatible' content='IE=edge'>"
				+ "<div>"
				+ "<div style='paddin-top:20px; width: 100%; margin: 0 auto;'>"
				+ "<div style='border:1px solid #e1e1e1;'>"
				+ "<div style='height: 70px; padding: 0 30px; background: #f8f8f8; border-bottom: 1px solid #e1e1e1;'>"
				+ "<h3 style='float:left; pause: 14px 0; margin: 0;'>"
				+ "<a href='http://218.236.203.83:9090/jPlay/main'>"
				+ "<img src=\'cid:logo.png\' style='width:150px;'/>"
				+ "</a>"
				+ "</h3>"
				+ "<p style='padding: 22px 0; float: right; margin: 0;'>"
				+ "인증번호 발송"
				+ "</p>"		
				+ "</div>"
				+ "<div style='padding: 30px;'>"
				+ "<dl style='padding-bottom: 20px; margin: 0;'></dl>"
				+ "<span>JPLAY " + title + " 인증번호 입니다.</span>"
				+ "<h4>" + emailMessage + "</h4>"		
				+ "<span>인증번호를 올바르게 입력해주세요.</span>"		
				+ "</div>"		
				+ "<div style='background:#f8f8f8; padding:20px 30px; border-top:1px solid #e1e1e1;'>"
				+ "<p style='line-height:24px; margin:0;'>"
				+ "<em style='color:#8c8c8c; font-style:normal;'>"
				+ "이 메일은 발신 전용입니다."
				+ "</em>"
				+ "</p>"
				+ "</div>"
				+ "</div>"
				+ "</div>"
				+ "</div>"							
				+ "</xmeta>"
				+ "</xmeta>"
				+ "</xmeta>"; 
	}

	public String getEmailStatus() {
		return emailStatus;
	}

	public void setEmailStatus(String emailStatus) {
		this.emailStatus = emailStatus;
	}

	public String getEmailRandNum() {
		return emailRandNum;
	}

	public void setEmailRandNum(String emailRandNum) {
		this.emailRandNum = emailRandNum;
	}

	@Override
	public String toString() {
		return "EmailVO [emailMessage=" + emailMessage + ", emailStatus=" + emailStatus + ", emailRandNum="
				+ emailRandNum + "]";
	}
	
}
