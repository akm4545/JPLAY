package jPlay.payment.dao;

import java.util.List;

import jPlay.payment.vo.PaymentVO;
import jPlay.payment.vo.PaymentDefaultVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("paymentMapper")
public interface PaymentMapper {

    public void insertPayment(PaymentVO vo) throws Exception;
    
    public PaymentVO selectPayment(int memberIdx) throws Exception;

    public List<PaymentVO> selectPaymentList(PaymentVO searchVO) throws Exception;
    
    public int selectPaymentListTotCnt(PaymentVO searchVO) throws Exception;

}
