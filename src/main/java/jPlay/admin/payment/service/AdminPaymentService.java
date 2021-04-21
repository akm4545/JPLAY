package jPlay.admin.payment.service;

import java.util.List;
import java.util.Map;

import jPlay.payment.vo.PaymentVO;

public interface AdminPaymentService {

	List<?> selectMovieList(PaymentVO searchVO) throws Exception;

	int selectMovieListTotCnt(PaymentVO searchVO) throws Exception;

	PaymentVO selectPayment(int paymentIdx) throws Exception;

	void deletePayment(PaymentVO paymentVO) throws Exception;

	void updatePayment(PaymentVO paymentVO) throws Exception;

	List<Map<String, String>> selectTotalPay() throws Exception;

	List<Map<String, String>> selectTotalPayMethod() throws Exception;

}
