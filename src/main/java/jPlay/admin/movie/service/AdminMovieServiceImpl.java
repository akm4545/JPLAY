package jPlay.admin.movie.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import jPlay.admin.file.dao.AdminFileMapper;
import jPlay.admin.file.vo.AdminFileVO;
import jPlay.admin.movie.dao.AdminMovieMapper;
import jPlay.admin.movie.vo.AdminMovieDefaultVO;
import jPlay.admin.movie.vo.AdminMovieVO;

@Service("adminMovieService")
public class AdminMovieServiceImpl extends EgovAbstractServiceImpl implements
        AdminMovieService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(AdminMovieServiceImpl.class);
    
    @Resource(name="adminMovieMapper")
    private AdminMovieMapper adminMovieDAO;
    
    @Resource(name="adminFileMapper")
    private AdminFileMapper fileDAO;
    
    public void insertMovie(AdminMovieVO vo, String baseDir) throws Exception {
    	adminMovieDAO.insertMovie(vo);
    	
    	List<AdminMovieVO> vos = movieFileSave(vo, baseDir);

    	fileDAO.insertFile(vos);
    }

    public void updateMovie(AdminMovieVO vo, String baseDir) throws Exception {
    	List<AdminMovieVO> vos = movieFileSave(vo, baseDir);
    	
    	for(int i=0; i<vos.size(); i++) {
    		System.out.println(vos.get(i).getFileName());
    	}
    	
    	adminMovieDAO.updateMovie(vo);
		fileDAO.updateFile(vos);
    }

    public void deleteMovie(AdminMovieVO vo,String baseDir) throws Exception {    	
    	File deleteImageDir = new File(baseDir.substring(0,baseDir.lastIndexOf("temp")) + "/movie/images/" + vo.getMovieIdx() + "/");
    	File deleteVideoDir = new File(baseDir.substring(0,baseDir.lastIndexOf("temp")) + "/movie/videos/" + vo.getMovieIdx() + "/");
    	
    	FileUtils.deleteDirectory(deleteVideoDir);
    	FileUtils.deleteDirectory(deleteImageDir);
    	
    	fileDAO.deleteFile(vo);
    	adminMovieDAO.deleteMovie(vo);
    }

    public Map<String, Object> selectMovie(int movieIdx) throws Exception {
        AdminMovieVO resultVO = adminMovieDAO.selectMovie(movieIdx);
        List<AdminFileVO> vos = fileDAO.selectFile(movieIdx);
        
        Map<String, Object> movieMap = new HashMap<String, Object>();
      
        movieMap.put("movieVO", resultVO);
        movieMap.put("fileVOS", vos);
        
        return movieMap;
    }

    public List<?> selectMovieList(AdminMovieVO searchVO) throws Exception {
        return adminMovieDAO.selectMovieList(searchVO);
    }

    public int selectMovieListTotCnt(AdminMovieVO searchVO) throws Exception{
		return adminMovieDAO.selectMovieListTotCnt(searchVO);
	}
    
    @Override
	public List<Map<String, String>> selectTopGenre() throws Exception {
		return adminMovieDAO.selectTopGenre();
	}

	@Override
	public List<Map<String, String>> selectTopMovie() throws Exception {
		return adminMovieDAO.selectTopMovie();
	}
    
    public List<AdminMovieVO> movieFileSave(AdminMovieVO vo,String baseDir){
    	String fileName = vo.getFileName();
    	
    	System.out.println(fileName);
    	
    	int subIdx = 0;
    	int _subIdx = 0;
    	boolean endSw = false;
    	boolean imageSw = true;
    	boolean mainImageSw = true;
    	boolean updateSw;
    	List<AdminMovieVO> vos = new ArrayList<AdminMovieVO>();
    	
    	try {
    		while(true) {
    			updateSw = false;
    			_subIdx = fileName.indexOf("physical=", subIdx);
    			if(_subIdx == -1) {
    				_subIdx = fileName.indexOf("src=", subIdx);
    				if(_subIdx == -1 || endSw) {
    					break;
    				}
    				updateSw = true;
    			}
    			
    			subIdx = _subIdx;
    			
    			AdminMovieVO fileVO = new AdminMovieVO();
    			
    			fileVO.setMovieIdx(vo.getMovieIdx());
    			
    			if(updateSw) {
    				if(imageSw) {
    					if(fileName.indexOf("IMG",subIdx) != -1) {
        					subIdx = fileName.indexOf("IMG",subIdx);
        					fileVO.setFileName(fileName.substring(subIdx, fileName.indexOf("&",subIdx)));
        				}
    					imageSw = false;
    					subIdx = 0;
    				}else {
    					if(fileName.indexOf("VIDEO",subIdx) != -1) {
    						subIdx = fileName.indexOf("VIDEO",subIdx);
    						fileVO.setFileName(fileName.substring(subIdx, fileName.indexOf("&",subIdx)));
    						endSw = true;
    					}
    				}
    			}else {
    				if(mainImageSw) {
    					if(fileName.substring(0,subIdx).indexOf("mainmovie=") != -1){
    						fileVO.setFileClassification("main");
    						mainImageSw = false;
    					}
    				}
    				subIdx += 9;
    				fileVO.setFileName(fileName.substring(subIdx, fileName.indexOf("&",subIdx)));
    			}
    			
    			File saveFile = new File(baseDir + fileVO.getFileName());
    			File movieDir = null;
    			
    			if(fileVO.getFileName().indexOf("IMG") != -1) {
    				fileVO.setFileClassification("poster");
    				fileVO.setFileType("image");
    				movieDir = new File(baseDir.substring(0,baseDir.lastIndexOf("temp")) + "/movie/images/" + fileVO.getMovieIdx() + "/");
    			}else {
    				if(fileVO.getFileClassification() == null) {
    					fileVO.setFileClassification("trailer");
    				}
    				fileVO.setFileType("video");
    				movieDir = new File(baseDir.substring(0,baseDir.lastIndexOf("temp")) + "/movie/videos/" + fileVO.getMovieIdx() + "/");
    			}
    			
    			vos.add(fileVO);

    			if(!updateSw) {
    				if(!movieDir.exists()) {
    					FileUtils.forceMkdir(movieDir);
    				}else {
    					List<AdminFileVO> originFileList = fileDAO.selectFile(fileVO.getMovieIdx());
    					for(int i=0; i<originFileList.size(); i++) {
    						if(originFileList.get(i).getFileClassification().equals(fileVO.getFileClassification())) {
    							File deleteFile = new File(movieDir.getAbsoluteFile() + "/" + originFileList.get(i).getFileName());
    							deleteFile.delete();
    						}
    					}
    				}
    				movieDir = new File(movieDir.getAbsoluteFile() + "/" + fileVO.getFileName());
    				FileUtils.copyFile(saveFile, movieDir);
    			}
    		}
    	}catch (Exception e) {
    		e.printStackTrace();
    		subIdx = 0;
    		_subIdx = 0;
    		while(true) {
    			updateSw = false;
    			_subIdx = fileName.indexOf("physical=", subIdx);
    			if(_subIdx == -1) {
    				_subIdx = fileName.indexOf("src=", subIdx);
    				if(_subIdx == -1) {
    					break;
    				}
    				updateSw = true;
    			}
    			
    			subIdx = _subIdx;
    			
    			AdminMovieVO fileVO = new AdminMovieVO();
    			
    			fileVO.setMovieIdx(vo.getMovieIdx());
    			
    			if(updateSw) {
    				if(fileName.indexOf("IMG",subIdx) != -1) {
    					subIdx = fileName.indexOf("IMG",subIdx);
    				}else {
    					subIdx = fileName.indexOf("VIDEO",subIdx);
    				}
    			}else {
    				subIdx += 9;    				
    			}
    			
    			fileVO.setFileName(fileName.substring(subIdx, fileName.indexOf("&",subIdx)));
    			
    			File saveFile = new File(baseDir + fileVO.getFileName());
    			File moveDir = null;
    			
    			if(fileVO.getFileName().indexOf("IMG") != -1) {
    				moveDir = new File(baseDir.substring(0,baseDir.lastIndexOf("temp")) + "/movie/images/" + fileVO.getMovieIdx() + "/" + fileVO.getFileName());
    			}else {
    				moveDir = new File(baseDir.substring(0,baseDir.lastIndexOf("temp")) + "/movie/videos/" + fileVO.getMovieIdx() + "/" + fileVO.getFileName());
    			}
    			if(!updateSw) {
    				if(saveFile.exists()) {
    					saveFile.delete();
    				}else if(moveDir.exists()) {
    					moveDir.delete();
    				}    				
    			}
    		}
		}
    	return vos;
    }
}