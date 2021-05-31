package jPlay.member.service;

import jPlay.member.vo.MemberVO;

public interface MemberService {
	
	public String insertMember(MemberVO vo) throws Exception;
	
	public void updateMember(MemberVO vo) throws Exception;
	
	public MemberVO selectMember(MemberVO vo) throws Exception;
	
	public MemberVO loginCheck(MemberVO vo) throws Exception;

	String overlapped(String id) throws Exception;

	void deleteMember(MemberVO _memberVO) throws Exception;
}
