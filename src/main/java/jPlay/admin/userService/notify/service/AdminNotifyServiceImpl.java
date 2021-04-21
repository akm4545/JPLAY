package jPlay.admin.userService.notify.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import jPlay.admin.userService.notify.dao.AdminNotifyMapper;
import jPlay.admin.userService.notify.vo.AdminNotifyDefaultVO;
import jPlay.admin.userService.notify.vo.AdminNotifyVO;

@Service("adminNotifyService")
public class AdminNotifyServiceImpl implements AdminNotifyService{

	@Resource(name = "adminNotifyMapper")
	AdminNotifyMapper adminNotifyDAO;
	
	@Override
	public void insertNotify(AdminNotifyVO notifyVO) throws Exception {
		adminNotifyDAO.insertNotify(notifyVO);
	}

	@Override
	public List<?> selectNotifyList(AdminNotifyDefaultVO searchVO) throws Exception {
		return adminNotifyDAO.selectNotifyList(searchVO);
	}

	@Override
	public int selectNotifyListTotCnt(AdminNotifyDefaultVO searchVO) throws Exception {
		return adminNotifyDAO.selectNotifyListTotCnt(searchVO);
	}

	@Override
	public AdminNotifyVO selectNotify(AdminNotifyVO vo) throws Exception {
		return adminNotifyDAO.selectNotify(vo);
	}

	@Override
	public void updateNotify(AdminNotifyVO vo) throws Exception {
		adminNotifyDAO.updateNotify(vo);
	}

	@Override
	public void deleteNotify(AdminNotifyVO vo) throws Exception {
		adminNotifyDAO.deleteNotify(vo);
	}

}
