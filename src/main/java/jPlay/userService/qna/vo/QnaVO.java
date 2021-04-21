package jPlay.userService.qna.vo;

public class QnaVO extends QnaDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** qna_idx */
    private int qnaIdx;
    
    /** member_idx */
    private int memberIdx;
    
    private String memberId;
    
    /** qna_title */
    private String qnaTitle;
    
    /** qna_content */
    private String qnaContent;
    
    /** qna_questionsDate */
    private String qnaQuestionsdate;
    
    /** qna_type */
    private String qnaType;
    
    /** qna_answer */
    private String qnaAnswer;
    
    /** qna_answerContent */
    private String qnaAnswercontent;
    
    /** qna_answerDate */
    private String qnaAnswerdate;
    
    
    public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getQnaIdx() {
        return this.qnaIdx;
    }
    
    public void setQnaIdx(int qnaIdx) {
        this.qnaIdx = qnaIdx;
    }
    
    public int getMemberIdx() {
        return this.memberIdx;
    }
    
    public void setMemberIdx(int memberIdx) {
        this.memberIdx = memberIdx;
    }
    
    public String getQnaTitle() {
        return this.qnaTitle;
    }
    
    public void setQnaTitle(String qnaTitle) {
        this.qnaTitle = qnaTitle;
    }
    
    public String getQnaContent() {
        return this.qnaContent;
    }
    
    public void setQnaContent(String qnaContent) {
        this.qnaContent = qnaContent;
    }
    
    public String getQnaQuestionsdate() {
        return this.qnaQuestionsdate;
    }
    
    public void setQnaQuestionsdate(String qnaQuestionsdate) {
        this.qnaQuestionsdate = qnaQuestionsdate;
    }
    
    public String getQnaType() {
        return this.qnaType;
    }
    
    public void setQnaType(String qnaType) {
        this.qnaType = qnaType;
    }
    
    public String getQnaAnswer() {
        return this.qnaAnswer;
    }
    
    public void setQnaAnswer(String qnaAnswer) {
        this.qnaAnswer = qnaAnswer;
    }
    
    public String getQnaAnswercontent() {
        return this.qnaAnswercontent;
    }
    
    public void setQnaAnswercontent(String qnaAnswercontent) {
        this.qnaAnswercontent = qnaAnswercontent;
    }
    
    public String getQnaAnswerdate() {
        return this.qnaAnswerdate;
    }
    
    public void setQnaAnswerdate(String qnaAnswerdate) {
        this.qnaAnswerdate = qnaAnswerdate;
    }
    
}
