package jPlay.admin.userService.qna.dao;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import jPlay.userService.qna.vo.QnaDefaultVO;
import jPlay.userService.qna.vo.QnaVO;

@Mapper("adminQnaMapper")
public interface AdminQnaMapper {

	List<?> selectQuestionList(QnaDefaultVO searchVO) throws Exception;

	int selectQuestionListTotCnt(QnaDefaultVO searchVO) throws Exception;

	QnaVO selectQna(QnaVO vo) throws Exception;

	void updateQna(QnaVO qnaVO) throws Exception;

	List<?> selectAnswerList(QnaDefaultVO searchVO) throws Exception;

	int selectAnswerListTotCnt(QnaDefaultVO searchVO) throws Exception;

	List<QnaVO> selectNewQuestion(String type) throws Exception;

}
