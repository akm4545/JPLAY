package jPlay.member.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.cryptography.EgovEnvCryptoService;
import jPlay.member.dao.MemberMapper;
import jPlay.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl extends EgovAbstractServiceImpl implements
	MemberService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(MemberServiceImpl.class);

    @Resource(name="memberMapper")
    private MemberMapper memberDAO;
    
    public String insertMember(MemberVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	LOGGER.debug(vo.toString());
    	
    	memberDAO.insertMember(vo);
    	
        return null;
    }

    public void updateMember(MemberVO vo) throws Exception {
        memberDAO.updateMember(vo);
    }
    
    public MemberVO selectMember(MemberVO vo) throws Exception {
    	
        MemberVO resultVO = memberDAO.selectMember(vo);
        
        return resultVO;
    }
    
	@Override
	public MemberVO loginCheck(MemberVO vo) throws Exception {
		return memberDAO.loginCheck(vo);
	}

	@Override
	public String overlapped(String id) throws Exception{
		return String.valueOf(memberDAO.overlapped(id));
	}

	@Override
	public void deleteMember(MemberVO _memberVO) throws Exception {
		memberDAO.deleteMember(_memberVO);
	}   
}