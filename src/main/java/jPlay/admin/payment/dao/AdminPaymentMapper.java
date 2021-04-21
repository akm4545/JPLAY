package jPlay.admin.payment.dao;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import jPlay.payment.vo.PaymentVO;

@Mapper("adminPaymentMapper")
public interface AdminPaymentMapper {

	List<?> selectPaymentList(PaymentVO searchVO) throws Exception;

	int selectPaymentListTotCnt(PaymentVO searchVO) throws Exception;

	PaymentVO selectPayment(int paymentIdx) throws Exception;

	void deletePayment(PaymentVO paymentVO) throws Exception;

	void updatePayment(PaymentVO paymentVO) throws Exception;

	List<Map<String, String>> selectTotalPay() throws Exception;

	List<Map<String, String>> selectTotalPayMethod() throws Exception;

}
