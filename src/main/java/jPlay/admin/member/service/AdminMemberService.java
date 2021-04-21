package jPlay.admin.member.service;

import java.util.List;
import java.util.Map;

import jPlay.member.vo.MemberDefaultVO;
import jPlay.member.vo.MemberVO;

public interface AdminMemberService {

    List selectMemberList(MemberDefaultVO searchVO) throws Exception;
    
    int selectMemberListTotCnt(MemberDefaultVO searchVO) throws Exception;

	MemberVO selectMember(int memberIdx) throws Exception;

	void updateMember(MemberVO vo)throws Exception;

	List selectDeleteList(MemberDefaultVO searchVO) throws Exception;

	int selectDeleteListTotCnt(MemberDefaultVO searchVO) throws Exception;

	void deleteMember(int memberIdx) throws Exception;

	void totalDelete(List<Integer> memberDeleteList) throws Exception;

	List<Map<String, String>> selectGroupJoin() throws Exception;

	List<Map<String, String>> selectGroupDel() throws Exception;
}