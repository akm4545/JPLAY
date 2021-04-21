package jPlay.admin.member.dao;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import jPlay.member.vo.MemberDefaultVO;
import jPlay.member.vo.MemberVO;

@Mapper("adminMemberMapper")
public interface AdminMemberMapper {
	
	public List<?> selectMemberList(MemberDefaultVO searchVO) throws Exception;
	
    public int selectMemberListTotCnt(MemberDefaultVO searchVO) throws Exception;

	public MemberVO selectMember(int memberIdx) throws Exception;

	public void updateMember(MemberVO vo) throws Exception;

	public List<?> selectDeleteList(MemberDefaultVO searchVO) throws Exception;

	public int selectDeleteListTotCnt(MemberDefaultVO searchVO) throws Exception;
	
    public void deleteMember(int memberIdx) throws Exception;

	public void totalDelete(List<Integer> memberDeleteList) throws Exception;

	public List<Map<String, String>> selectGroupJoin() throws Exception;

	public List<Map<String, String>> selectGroupDel() throws Exception;

}