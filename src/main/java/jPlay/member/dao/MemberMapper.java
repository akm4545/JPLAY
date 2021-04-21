package jPlay.member.dao;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import jPlay.member.vo.MemberVO;

@Mapper("memberMapper")
public interface MemberMapper {

    public void insertMember(MemberVO vo) throws Exception;

    public void updateMember(MemberVO vo) throws Exception;

    public MemberVO selectMember(MemberVO vo) throws Exception;

	public MemberVO loginCheck(MemberVO vo) throws Exception;

	public int overlapped(String id) throws Exception;

	public MemberVO idSearch(MemberVO vo) throws Exception;

	public MemberVO pwdSearch(MemberVO vo) throws Exception;

	public void deleteMember(MemberVO _memberVO) throws Exception;

	public MemberVO emailCheck(String email) throws Exception;

}
