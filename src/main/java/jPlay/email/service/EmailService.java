package jPlay.email.service;

import jPlay.email.vo.EmailVO;
import jPlay.member.vo.MemberVO;

public interface EmailService {
	boolean joinSend(String sendMail,int joinNum) throws Exception;

	EmailVO idSearch(String sendMail, int searchNum) throws Exception;

	EmailVO pwdSearch(String memberId, String memberEmail, int searchNum) throws Exception;

	MemberVO emailCheck(String email) throws Exception;

	boolean updateSend(String email, int joinNum) throws Exception;
}
