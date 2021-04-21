package jPlay.admin.movie.vo;

import jPlay.admin.file.vo.AdminFileVO;

public class AdminMovieVO extends AdminFileVO{
    private static final long serialVersionUID = 1L;
    
    /** movie_idx */
    private int movieIdx;
    
    /** movie_title */
    private String movieTitle;
    
    /** movie_openingDate */
    private String movieOpeningdate;
    
    /** movie_synopsis */
    private String movieSynopsis;
    
    /** movie_rating */
    private int movieRating = 0;
    
    /** movie_genre */
    private String movieGenre;
    
    /** movie_age */
    private String movieAge;
    
    /** movie_director */
    private String movieDirector;
    
    /** movie_actor */
    private String movieActor;
    
    /** movie_viewCount */
    private int movieViewcount;
    
    public int getMovieIdx() {
        return this.movieIdx;
    }
    
    public void setMovieIdx(int movieIdx) {
        this.movieIdx = movieIdx;
    }
    
    public String getMovieTitle() {
        return this.movieTitle;
    }
    
    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }
    
    public String getMovieOpeningdate() {
        return this.movieOpeningdate;
    }
    
    public void setMovieOpeningdate(String movieOpeningdate) {
        this.movieOpeningdate = movieOpeningdate;
    }
    
    public String getMovieSynopsis() {
        return this.movieSynopsis;
    }
    
    public void setMovieSynopsis(String movieSynopsis) {
        this.movieSynopsis = movieSynopsis;
    }
    
    public int getMovieRating() {
        return this.movieRating;
    }
    
    public void setMovieRating(int movieRating) {
        this.movieRating = movieRating;
    }
    
    public String getMovieGenre() {
        return this.movieGenre;
    }
    
    public void setMovieGenre(String movieGenre) {
        this.movieGenre = movieGenre;
    }
    
    public String getMovieAge() {
        return this.movieAge;
    }
    
    public void setMovieAge(String movieAge) {
        this.movieAge = movieAge;
    }
    
    public String getMovieDirector() {
        return this.movieDirector;
    }
    
    public void setMovieDirector(String movieDirector) {
        this.movieDirector = movieDirector;
    }
    
    public String getMovieActor() {
        return this.movieActor;
    }
    
    public void setMovieActor(String movieActor) {
        this.movieActor = movieActor;
    }
    
    public int getMovieViewcount() {
        return this.movieViewcount;
    }
    
    public void setMovieViewcount(int movieViewcount) {
        this.movieViewcount = movieViewcount;
    }

	@Override
	public String toString() {
		return "AdminMovieVO [movieIdx=" + movieIdx + ", movieTitle=" + movieTitle + ", movieOpeningdate="
				+ movieOpeningdate + ", movieSynopsis=" + movieSynopsis + ", movieRating=" + movieRating
				+ ", movieGenre=" + movieGenre + ", movieAge=" + movieAge + ", movieDirector=" + movieDirector
				+ ", movieActor=" + movieActor + ", movieViewcount=" + movieViewcount + "]";
	}
}