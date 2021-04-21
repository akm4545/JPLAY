package jPlay.admin.userService.qna.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import jPlay.admin.userService.qna.dao.AdminQnaMapper;
import jPlay.userService.qna.vo.QnaDefaultVO;
import jPlay.userService.qna.vo.QnaVO;

@Service("adminQnaService")
public class AdminQnaServiceImpl implements AdminQnaService{
	
	@Resource(name = "adminQnaMapper")
	AdminQnaMapper adminQnaDAO;

	@Override
	public List<?> selectQuestionList(QnaDefaultVO searchVO) throws Exception {
		return adminQnaDAO.selectQuestionList(searchVO);
	}

	@Override
	public int selectQuestionListTotCnt(QnaDefaultVO searchVO) throws Exception {
		return adminQnaDAO.selectQuestionListTotCnt(searchVO);
	}

	@Override
	public QnaVO selectQna(QnaVO vo) throws Exception {
		return adminQnaDAO.selectQna(vo);
	}

	@Override
	public void updateQna(QnaVO qnaVO) throws Exception {
		adminQnaDAO.updateQna(qnaVO);
	}

	@Override
	public List<?> selectAnswerList(QnaDefaultVO searchVO) throws Exception {
		return adminQnaDAO.selectAnswerList(searchVO);
	}

	@Override
	public int selectAnswerListTotCnt(QnaDefaultVO searchVO) throws Exception {
		return adminQnaDAO.selectAnswerListTotCnt(searchVO);
	}

	@Override
	public Map<String, List<QnaVO>> selectNewQuestion() throws Exception {
		String[] type = {"작동오류","결제/요금","이용불편사항","콘텐츠요청","회원정보","기타"};
		String[] engType = {"error","pay","inconvenience","content","info","other"};
		
		Map<String, List<QnaVO>> qnaTypeMap = new HashMap<String, List<QnaVO>>();
		
		for(int i=0; i<type.length; i++) {
			List<QnaVO> typeList = new ArrayList<QnaVO>();
			
			typeList = adminQnaDAO.selectNewQuestion(type[i]); 
			
			qnaTypeMap.put(engType[i], typeList);
		}
				
		return qnaTypeMap;
	}
}
