package jPlay.main.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import jPlay.admin.movie.vo.AdminMovieVO;
import jPlay.admin.userService.notify.vo.AdminNotifyVO;

@Mapper("mainMapper")
public interface MainMapper {

	List<AdminMovieVO> selectMovieImages(String genre) throws Exception;

	List<AdminNotifyVO> selectMainNotify() throws Exception;
	
}
