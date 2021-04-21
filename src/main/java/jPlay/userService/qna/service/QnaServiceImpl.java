package jPlay.userService.qna.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import jPlay.userService.qna.dao.QnaMapper;
import jPlay.userService.qna.vo.QnaDefaultVO;
import jPlay.userService.qna.vo.QnaVO;

@Service("qnaService")
public class QnaServiceImpl extends EgovAbstractServiceImpl implements
        QnaService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(QnaServiceImpl.class);

    @Resource(name="qnaMapper")
    private QnaMapper qnaDAO;
    
    public String insertQna(QnaVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	LOGGER.debug(vo.toString());
    	
    	qnaDAO.insertQna(vo);
   
        return null;
    }

    public QnaVO selectQna(QnaVO vo) throws Exception {
        QnaVO resultVO = qnaDAO.selectQna(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    public List<?> selectQnaList(QnaDefaultVO searchVO) throws Exception {
        return qnaDAO.selectQnaList(searchVO);
    }

    public int selectQnaListTotCnt(QnaDefaultVO searchVO) {
		return qnaDAO.selectQnaListTotCnt(searchVO);
	}
    
}
