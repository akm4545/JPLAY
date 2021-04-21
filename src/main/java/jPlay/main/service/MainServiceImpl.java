package jPlay.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import jPlay.admin.movie.vo.AdminMovieVO;
import jPlay.admin.userService.notify.vo.AdminNotifyVO;
import jPlay.main.dao.MainMapper;

@Service("mainService")
public class MainServiceImpl extends EgovAbstractServiceImpl implements MainService{
	
	@Resource(name = "mainMapper")
	MainMapper mainDAO;
	
	@Override
	public Map<String, List<AdminMovieVO>> selectMovieImages(String[] genre) throws Exception{
		Map<String, List<AdminMovieVO>> resultMap = new HashMap<String, List<AdminMovieVO>>();
		for(int i=0; i<genre.length; i++) {
			List<AdminMovieVO> vos = new ArrayList<AdminMovieVO>();
		
			vos = mainDAO.selectMovieImages(genre[i]);
			
			resultMap.put(genre[i], vos);
		}
		return resultMap;
	}

	@Override
	public List<AdminNotifyVO> selectMainNotify() throws Exception {
		return mainDAO.selectMainNotify();
	}
}
