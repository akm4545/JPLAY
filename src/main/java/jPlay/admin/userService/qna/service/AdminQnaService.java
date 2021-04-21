package jPlay.admin.userService.qna.service;

import java.util.List;
import java.util.Map;

import jPlay.userService.qna.vo.QnaDefaultVO;
import jPlay.userService.qna.vo.QnaVO;

public interface AdminQnaService {

	List<?> selectQuestionList(QnaDefaultVO searchVO) throws Exception;

	int selectQuestionListTotCnt(QnaDefaultVO searchVO) throws Exception;

	QnaVO selectQna(QnaVO vo) throws Exception;

	void updateQna(QnaVO qnaVO) throws Exception;

	List<?> selectAnswerList(QnaDefaultVO searchVO) throws Exception;

	int selectAnswerListTotCnt(QnaDefaultVO searchVO) throws Exception;

	Map<String, List<QnaVO>> selectNewQuestion() throws Exception;

}
