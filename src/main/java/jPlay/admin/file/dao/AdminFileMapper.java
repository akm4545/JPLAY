package jPlay.admin.file.dao;

import java.util.List;

import jPlay.admin.file.vo.AdminFileVO;
import jPlay.admin.movie.vo.AdminMovieVO;
import jPlay.admin.file.vo.AdminFileDefaultVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminFileMapper")
public interface AdminFileMapper {
	
    public void insertFile(List<AdminMovieVO> vos) throws Exception;

    public void updateFile(List<AdminMovieVO> vos) throws Exception;

    public void deleteFile(AdminFileVO vo) throws Exception;

    public List<AdminFileVO> selectFile(int movieIdx) throws Exception;
}
