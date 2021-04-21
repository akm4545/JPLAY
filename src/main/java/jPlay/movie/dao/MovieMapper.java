package jPlay.movie.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import jPlay.admin.movie.vo.AdminMovieDefaultVO;
import jPlay.admin.movie.vo.AdminMovieVO;
import jPlay.member.vo.MemberVO;

@Mapper("movieMapper")
public interface MovieMapper {

	AdminMovieVO selectMovie(String movieIdx) throws Exception;

	void updateRating(String movieIdx) throws Exception;

	List<AdminMovieVO> selectWishList(MemberVO searchVO) throws Exception;

	int selectWishListTotCnt(MemberVO searchVO) throws Exception;

	List<?> selectMovieList(AdminMovieDefaultVO searchVO) throws Exception;

	int selectMovieListTotCnt(AdminMovieDefaultVO searchVO) throws Exception;

	AdminMovieVO selectMainVideo(String movieIdx) throws Exception;

	void addMovieView(String movieIdx) throws Exception;

	void insertRecentlyView(@Param("memberIdx")String memberIdx, @Param("movieIdx")String movieIdx) throws Exception;

	List<AdminMovieVO> selectRecentlyList(MemberVO searchVO) throws Exception;

	List<?> selectMovieGenreList(AdminMovieDefaultVO searchVO) throws Exception;

	int selectMovieGenreListTotCnt(AdminMovieDefaultVO searchVO) throws Exception;

	boolean selectRecentlyView(@Param("memberIdx")String memberIdx, @Param("movieIdx")String movieIdx) throws Exception;

	List<AdminMovieVO> selectRecommend(String movieGenre) throws Exception;

	void updateRecentlyView(@Param("memberIdx")String memberIdx, @Param("movieIdx")String movieIdx) throws Exception;

	void deleteRecentlyView(@Param("memberIdx")String memberIdx) throws Exception;

}
