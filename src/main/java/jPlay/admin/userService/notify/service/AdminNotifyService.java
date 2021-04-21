package jPlay.admin.userService.notify.service;

import java.util.List;

import jPlay.admin.userService.notify.vo.AdminNotifyDefaultVO;
import jPlay.admin.userService.notify.vo.AdminNotifyVO;

public interface AdminNotifyService {

	void insertNotify(AdminNotifyVO notifyVO) throws Exception;

	List<?> selectNotifyList(AdminNotifyDefaultVO searchVO) throws Exception;

	int selectNotifyListTotCnt(AdminNotifyDefaultVO searchVO) throws Exception;

	AdminNotifyVO selectNotify(AdminNotifyVO vo) throws Exception;

	void updateNotify(AdminNotifyVO vo) throws Exception;

	void deleteNotify(AdminNotifyVO vo) throws Exception;

}
