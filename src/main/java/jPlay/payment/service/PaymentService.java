package jPlay.payment.service;

import java.util.List;
import jPlay.payment.vo.PaymentDefaultVO;
import jPlay.payment.vo.PaymentVO;

public interface PaymentService {
	
    String insertPayment(PaymentVO vo) throws Exception;
   
    PaymentVO selectPayment(int memberIdx) throws Exception;
    
    List<PaymentVO> selectPaymentList(PaymentVO searchVO) throws Exception;
    
    int selectPaymentListTotCnt(PaymentVO searchVO) throws Exception;
    
}
