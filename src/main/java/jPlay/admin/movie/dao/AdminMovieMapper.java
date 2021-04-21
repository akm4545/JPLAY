package jPlay.admin.movie.dao;

import java.util.List;
import java.util.Map;

import jPlay.admin.movie.vo.AdminMovieVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminMovieMapper")
public interface AdminMovieMapper {

    public int insertMovie(AdminMovieVO vo) throws Exception;

    public void updateMovie(AdminMovieVO vo) throws Exception;

    public void deleteMovie(AdminMovieVO vo) throws Exception;

    public AdminMovieVO selectMovie(int movieIdx) throws Exception;

    public List<?> selectMovieList(AdminMovieVO searchVO) throws Exception;

    public int selectMovieListTotCnt(AdminMovieVO searchVO) throws Exception;

	public List<Map<String, String>> selectTopGenre() throws Exception;

	public List<Map<String, String>> selectTopMovie() throws Exception;

}
