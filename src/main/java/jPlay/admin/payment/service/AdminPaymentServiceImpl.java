package jPlay.admin.payment.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import jPlay.admin.payment.dao.AdminPaymentMapper;
import jPlay.payment.vo.PaymentVO;

@Service("adminPaymentService")
public class AdminPaymentServiceImpl implements AdminPaymentService{
	
	@Resource(name = "adminPaymentMapper")
	AdminPaymentMapper adminPaymentDAO;

	@Override
	public List<?> selectMovieList(PaymentVO searchVO) throws Exception {
		return adminPaymentDAO.selectPaymentList(searchVO);
	}

	@Override
	public int selectMovieListTotCnt(PaymentVO searchVO) throws Exception {
		return adminPaymentDAO.selectPaymentListTotCnt(searchVO);
	}

	@Override
	public PaymentVO selectPayment(int paymentIdx) throws Exception {
		return adminPaymentDAO.selectPayment(paymentIdx);
	}

	@Override
	public void deletePayment(PaymentVO paymentVO) throws Exception {
		adminPaymentDAO.deletePayment(paymentVO);
	}

	@Override
	public void updatePayment(PaymentVO paymentVO) throws Exception {
		adminPaymentDAO.updatePayment(paymentVO);
	}

	@Override
	public List<Map<String, String>> selectTotalPay() throws Exception {
		return adminPaymentDAO.selectTotalPay();
	}

	@Override
	public List<Map<String, String>> selectTotalPayMethod() throws Exception {
		return adminPaymentDAO.selectTotalPayMethod();
	}

}
