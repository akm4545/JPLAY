package jPlay.batch.job;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "payment")
public class PaymentVO{
    private static final long serialVersionUID = 1L;
    
    private int paymentIdx;
    
    /** payment_date */
    private String paymentDate;
    
    /** payment_amount */
    private int paymentAmount;
    
    /** payment_method */
    private String paymentMethod;
    
    /** payment_info */
    private String paymentInfo;
    
    /** payment_endDate */
    private String paymentEnddate;
    
    
    public String getPaymentDate() {
        return this.paymentDate;
    }
    
    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }
    
    public int getPaymentAmount() {
        return this.paymentAmount;
    }
    
    public void setPaymentAmount(int paymentAmount) {
        this.paymentAmount = paymentAmount;
    }
    
    public String getPaymentMethod() {
        return this.paymentMethod;
    }
    
    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
    
    public String getPaymentInfo() {
        return this.paymentInfo;
    }
    
    public void setPaymentInfo(String paymentInfo) {
        this.paymentInfo = paymentInfo;
    }
    
    public String getPaymentEnddate() {
        return this.paymentEnddate;
    }
    
    public void setPaymentEnddate(String paymentEnddate) {
        this.paymentEnddate = paymentEnddate;
    }

	public int getPaymentIdx() {
		return paymentIdx;
	}

	public void setPaymentIdx(int paymentIdx) {
		this.paymentIdx = paymentIdx;
	}
    
    
}
