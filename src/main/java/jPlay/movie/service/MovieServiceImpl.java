package jPlay.movie.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import jPlay.admin.movie.vo.AdminMovieDefaultVO;
import jPlay.admin.movie.vo.AdminMovieVO;
import jPlay.member.vo.MemberVO;
import jPlay.movie.dao.MovieMapper;

@Service("movieService")
public class MovieServiceImpl implements MovieService{

	@Resource(name = "movieMapper")
	MovieMapper movieDAO;
	
	@Override
	public AdminMovieVO selectMovie(String movieIdx) throws Exception {
		return movieDAO.selectMovie(movieIdx);
	}

	@Override
	public void updateRating(String movieIdx) throws Exception {
		movieDAO.updateRating(movieIdx);
	}

	@Override
	public List<AdminMovieVO> selectWishList(MemberVO searchVO) throws Exception {
		return movieDAO.selectWishList(searchVO);
	}

	@Override
	public int selectWishListTotCnt(MemberVO searchVO) throws Exception {
		return movieDAO.selectWishListTotCnt(searchVO);
	}

	@Override
	public List<?> selectMovieList(AdminMovieDefaultVO searchVO) throws Exception {
		return movieDAO.selectMovieList(searchVO);
	}

	@Override
	public int selectMovieListTotCnt(AdminMovieDefaultVO searchVO) throws Exception {
		return movieDAO.selectMovieListTotCnt(searchVO);
	}

	@Override
	public AdminMovieVO selectMainVideo(String movieIdx) throws Exception {
		return movieDAO.selectMainVideo(movieIdx);
	}

	@Override
	public void addMovieView(String movieIdx, String memberIdx) throws Exception {
		movieDAO.addMovieView(movieIdx);
		
		boolean viewCheck = movieDAO.selectRecentlyView(memberIdx, movieIdx);
		
		if(viewCheck) {
			movieDAO.insertRecentlyView(memberIdx,movieIdx);			
			movieDAO.deleteRecentlyView(memberIdx);
		}else {
			movieDAO.updateRecentlyView(memberIdx,movieIdx);
		}
	}

	@Override
	public List<AdminMovieVO> selectRecentlyList(MemberVO searchVO) throws Exception {
		return movieDAO.selectRecentlyList(searchVO);
	}

	@Override
	public List<?> selectMovieGenreList(AdminMovieDefaultVO searchVO) throws Exception {
		return movieDAO.selectMovieGenreList(searchVO);
	}

	@Override
	public int selectMovieGenreListTotCnt(AdminMovieDefaultVO searchVO) throws Exception {
		return movieDAO.selectMovieGenreListTotCnt(searchVO);
	}

	@Override
	public List<AdminMovieVO> selectRecommend(String movieGenre) throws Exception {
		return movieDAO.selectRecommend(movieGenre);
	}
	
}
