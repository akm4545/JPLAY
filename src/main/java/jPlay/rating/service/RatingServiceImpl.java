package jPlay.rating.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import jPlay.rating.dao.RatingMapper;

@Service("ratingService")
public class RatingServiceImpl implements RatingService{
	
	@Resource(name = "ratingMapper")
	RatingMapper ratingDAO;
	
	@Override
	public boolean ratingCheck(String memberIdx, String movieIdx) throws Exception {
		return ratingDAO.selectRating(memberIdx, movieIdx);
	}

	@Override
	public void updateRating(String memberIdx, String movieIdx, int mulScore) throws Exception {
		ratingDAO.updateRating(memberIdx, movieIdx, mulScore);
	}

	@Override
	public void insertRating(String memberIdx, String movieIdx, int mulScore) throws Exception {
		ratingDAO.insertRating(memberIdx, movieIdx, mulScore);
	}

}
