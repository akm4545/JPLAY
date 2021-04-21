package jPlay.userService.notify.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import jPlay.admin.userService.notify.vo.AdminNotifyVO;
import jPlay.userService.notify.dao.NotifyMapper;

@Service("notifyService")
public class NofityServiceImpl implements NotifyService{
	
	@Resource(name = "notifyMapper")
	NotifyMapper notifyDAO;

	@Override
	public List<AdminNotifyVO> selectNotifyList(AdminNotifyVO searchVO) throws Exception {
		return notifyDAO.selectNotifyList(searchVO);
	}

	@Override
	public int selectNotifyListTotCnt(AdminNotifyVO searchVO) throws Exception {
		return notifyDAO.selectNotifyListTotCnt(searchVO);
	}

	@Override
	public AdminNotifyVO selectNotify(AdminNotifyVO vo) throws Exception {
		return notifyDAO.selectNotify(vo);
	}

	@Override
	public AdminNotifyVO selectPreviousNotify(AdminNotifyVO vo) throws Exception {
		vo.setNotifyIdx(vo.getNotifyIdx() - 1);
		
		return notifyDAO.selectNotify(vo);
	}

	@Override
	public AdminNotifyVO selectNextNotify(AdminNotifyVO vo) throws Exception {
		vo.setNotifyIdx(vo.getNotifyIdx() + 2);
		
		return notifyDAO.selectNotify(vo);
	}
}
