package jPlay.userService.qna.service;

import java.util.List;

import jPlay.userService.qna.vo.QnaDefaultVO;
import jPlay.userService.qna.vo.QnaVO;

public interface QnaService {
	
    String insertQna(QnaVO vo) throws Exception;
    
    QnaVO selectQna(QnaVO vo) throws Exception;
    
    List selectQnaList(QnaDefaultVO searchVO) throws Exception;
    
    int selectQnaListTotCnt(QnaDefaultVO searchVO);
    
}
