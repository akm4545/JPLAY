package jPlay.admin.userService.notify.vo;

/**
 * @Class Name : NotifyVO.java
 * @Description : Notify VO class
 * @Modification Information
 *
 * @author sfddgsd
 * @since gfgfsdgf
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class AdminNotifyVO extends AdminNotifyDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** notify_idx */
    private int notifyIdx;
    
    /** notify_title */
    private java.lang.String notifyTitle;
    
    private String notifyType;
    
    /** notify_content */
    private java.lang.String notifyContent;
    
    /** notify_date */
    private String notifyDate;
    
    public int getNotifyIdx() {
        return this.notifyIdx;
    }
    
    public void setNotifyIdx(int notifyIdx) {
        this.notifyIdx = notifyIdx;
    }
    
    public java.lang.String getNotifyTitle() {
        return this.notifyTitle;
    }
    
    public void setNotifyTitle(java.lang.String notifyTitle) {
        this.notifyTitle = notifyTitle;
    }
    
    public java.lang.String getNotifyContent() {
        return this.notifyContent;
    }
    
    public void setNotifyContent(java.lang.String notifyContent) {
        this.notifyContent = notifyContent;
    }
    
    public String getNotifyDate() {
        return this.notifyDate;
    }
    
    public void setNotifyDate(String notifyDate) {
        this.notifyDate = notifyDate;
    }

	public String getNotifyType() {
		return notifyType;
	}

	public void setNotifyType(String notifyType) {
		this.notifyType = notifyType;
	}
    
}
