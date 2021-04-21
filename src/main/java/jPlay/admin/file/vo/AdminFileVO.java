package jPlay.admin.file.vo;

public class AdminFileVO extends AdminFileDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** member_idx */
    private int memberIdx;
    
    /** file_name */
    private String fileName;
    
    /** file_type */
    private String fileType;
    
    /** file_classification */
    private String fileClassification;
    
    public int getMemberIdx() {
        return this.memberIdx;
    }
    
    public void setMemberIdx(int memberIdx) {
        this.memberIdx = memberIdx;
    }
    
    public String getFileName() {
        return this.fileName;
    }
    
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    
    public String getFileType() {
        return this.fileType;
    }
    
    public void setFileType(String fileType) {
        this.fileType = fileType;
    }
    
    public String getFileClassification() {
        return this.fileClassification;
    }
    
    public void setFileClassification(String fileClassification) {
        this.fileClassification = fileClassification;
    }
}