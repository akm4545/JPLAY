package jPlay.movie.service;

import java.util.List;

import jPlay.admin.movie.vo.AdminMovieDefaultVO;
import jPlay.admin.movie.vo.AdminMovieVO;
import jPlay.member.vo.MemberVO;

public interface MovieService {

	AdminMovieVO selectMovie(String movieIdx) throws Exception;

	void updateRating(String movieIdx) throws Exception;

	List<AdminMovieVO> selectWishList(MemberVO searchVO) throws Exception;

	int selectWishListTotCnt(MemberVO searchVO) throws Exception;

	List<?> selectMovieList(AdminMovieDefaultVO searchVO) throws Exception;

	int selectMovieListTotCnt(AdminMovieDefaultVO searchVO) throws Exception;

	AdminMovieVO selectMainVideo(String movieIdx) throws Exception;

	void addMovieView(String movieIdx, String memberIdx) throws Exception;

	List<AdminMovieVO> selectRecentlyList(MemberVO searchVO) throws Exception;

	List<?> selectMovieGenreList(AdminMovieDefaultVO searchVO) throws Exception;

	int selectMovieGenreListTotCnt(AdminMovieDefaultVO searchVO) throws Exception;

	List<AdminMovieVO> selectRecommend(String movieGenre) throws Exception;
}
