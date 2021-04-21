package jPlay.admin.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import jPlay.admin.member.dao.AdminMemberMapper;
import jPlay.member.vo.MemberDefaultVO;
import jPlay.member.vo.MemberVO;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Resource(name = "adminMemberMapper")
	private AdminMemberMapper adminMemberDAO;

	@Override
    public List<?> selectMemberList(MemberDefaultVO searchVO) throws Exception {
        return adminMemberDAO.selectMemberList(searchVO);
    }

	@Override
    public int selectMemberListTotCnt(MemberDefaultVO searchVO) throws Exception{
		return adminMemberDAO.selectMemberListTotCnt(searchVO);
	}

	@Override
	public MemberVO selectMember(int memberIdx) throws Exception {
		return adminMemberDAO.selectMember(memberIdx);
	}

	@Override
	public void updateMember(MemberVO vo) throws Exception {
		adminMemberDAO.updateMember(vo);
	}

	@Override
	public List<?> selectDeleteList(MemberDefaultVO searchVO) throws Exception {
		return adminMemberDAO.selectDeleteList(searchVO);
	}

	@Override
	public int selectDeleteListTotCnt(MemberDefaultVO searchVO) throws Exception {
		return adminMemberDAO.selectDeleteListTotCnt(searchVO);
	}

	public void deleteMember(int memberIdx) throws Exception {
		adminMemberDAO.deleteMember(memberIdx);
	}

	@Override
	public void totalDelete(List<Integer> memberDeleteList) throws Exception {
		adminMemberDAO.totalDelete(memberDeleteList);
	}

	@Override
	public List<Map<String, String>> selectGroupJoin() throws Exception {
		return adminMemberDAO.selectGroupJoin();
	}

	@Override
	public List<Map<String, String>> selectGroupDel() throws Exception {
		return adminMemberDAO.selectGroupDel();
	}
}