package jPlay.payment.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import jPlay.payment.dao.PaymentMapper;
import jPlay.payment.vo.PaymentDefaultVO;
import jPlay.payment.vo.PaymentVO;

@Service("paymentService")
public class PaymentServiceImpl extends EgovAbstractServiceImpl implements
        PaymentService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(PaymentServiceImpl.class);

    @Resource(name="paymentMapper")
    private PaymentMapper paymentDAO;

    public String insertPayment(PaymentVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	LOGGER.debug(vo.toString());
    	
    	paymentDAO.insertPayment(vo);
    	
        return null;
    }

    public PaymentVO selectPayment(int memberIdx) throws Exception {
    	return paymentDAO.selectPayment(memberIdx);
    }

    public List<PaymentVO> selectPaymentList(PaymentVO searchVO) throws Exception {
        return paymentDAO.selectPaymentList(searchVO);
    }

    public int selectPaymentListTotCnt(PaymentVO searchVO) throws Exception{
		return paymentDAO.selectPaymentListTotCnt(searchVO);
	}
    
}
