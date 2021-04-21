package jPlay.userService.notify.service;

import java.util.List;

import jPlay.admin.userService.notify.vo.AdminNotifyVO;

public interface NotifyService {

	List<AdminNotifyVO> selectNotifyList(AdminNotifyVO searchVO) throws Exception;

	int selectNotifyListTotCnt(AdminNotifyVO searchVO) throws Exception;

	AdminNotifyVO selectNotify(AdminNotifyVO vo) throws Exception;

	AdminNotifyVO selectPreviousNotify(AdminNotifyVO vo) throws Exception;

	AdminNotifyVO selectNextNotify(AdminNotifyVO vo) throws Exception;
	
}
