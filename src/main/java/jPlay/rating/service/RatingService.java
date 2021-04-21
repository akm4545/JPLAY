package jPlay.rating.service;

public interface RatingService {

	boolean ratingCheck(String memberIdx, String movieIdx) throws Exception;

	void updateRating(String memberIdx, String movieIdx, int mulScore)throws Exception;

	void insertRating(String memberIdx, String movieIdx, int mulScore) throws Exception;

}
