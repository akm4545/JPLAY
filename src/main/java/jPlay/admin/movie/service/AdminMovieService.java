package jPlay.admin.movie.service;

import java.util.List;
import java.util.Map;

import jPlay.admin.movie.vo.AdminMovieDefaultVO;
import jPlay.admin.movie.vo.AdminMovieVO;

public interface AdminMovieService {
	
    void insertMovie(AdminMovieVO vo, String baseDir) throws Exception;
    
    void updateMovie(AdminMovieVO vo, String baseDir) throws Exception;
    
    void deleteMovie(AdminMovieVO vo, String baseDir) throws Exception;
    
    Map<String, Object> selectMovie(int movieIdx) throws Exception;
    
    List selectMovieList(AdminMovieVO searchVO) throws Exception;
    
    int selectMovieListTotCnt(AdminMovieVO searchVO) throws Exception;

	List<Map<String, String>> selectTopGenre() throws Exception;

	List<Map<String, String>> selectTopMovie() throws Exception;
}