package jPlay.member.service;

import jPlay.member.vo.MemberVO;

public interface MemberService {
	
    String insertMember(MemberVO vo) throws Exception;
    
    void updateMember(MemberVO vo) throws Exception;
    
    MemberVO selectMember(MemberVO vo) throws Exception;

	MemberVO loginCheck(MemberVO vo) throws Exception;

	String overlapped(String id) throws Exception;

	void deleteMember(MemberVO _memberVO) throws Exception;
    
}
