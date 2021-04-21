package jPlay.userService.qna.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import jPlay.userService.qna.vo.QnaDefaultVO;
import jPlay.userService.qna.vo.QnaVO;

@Mapper("qnaMapper")
public interface QnaMapper {

    public void insertQna(QnaVO vo) throws Exception;

    public QnaVO selectQna(QnaVO vo) throws Exception;

    public List<?> selectQnaList(QnaDefaultVO searchVO) throws Exception;

    public int selectQnaListTotCnt(QnaDefaultVO searchVO);

}
