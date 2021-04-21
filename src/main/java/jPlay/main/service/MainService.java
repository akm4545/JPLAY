package jPlay.main.service;

import java.util.List;
import java.util.Map;

import jPlay.admin.movie.vo.AdminMovieVO;
import jPlay.admin.userService.notify.vo.AdminNotifyVO;

public interface MainService {

	Map<String, List<AdminMovieVO>> selectMovieImages(String[] genre)throws Exception;

	List<AdminNotifyVO> selectMainNotify() throws Exception;
	
}
