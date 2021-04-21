package jPlay.wihsList.vo;

public class WishlistVO extends WishlistDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** member_idx */
    private int memberIdx;
    
    /** movie_idx */
    private int movieIdx;
    
    /** wishList_date */
    private java.util.Date wishlistDate;
    
    public int getMemberIdx() {
        return this.memberIdx;
    }
    
    public void setMemberIdx(int memberIdx) {
        this.memberIdx = memberIdx;
    }
    
    public int getMovieIdx() {
        return this.movieIdx;
    }
    
    public void setMovieIdx(int movieIdx) {
        this.movieIdx = movieIdx;
    }
    
    public java.util.Date getWishlistDate() {
        return this.wishlistDate;
    }
    
    public void setWishlistDate(java.util.Date wishlistDate) {
        this.wishlistDate = wishlistDate;
    }
    
}
