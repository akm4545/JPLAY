package jPlay.admin.userService.notify.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import jPlay.admin.userService.notify.vo.AdminNotifyDefaultVO;
import jPlay.admin.userService.notify.vo.AdminNotifyVO;

@Mapper("adminNotifyMapper")
public interface AdminNotifyMapper {

	void insertNotify(AdminNotifyVO notifyVO) throws Exception;

	List<?> selectNotifyList(AdminNotifyDefaultVO searchVO) throws Exception;

	int selectNotifyListTotCnt(AdminNotifyDefaultVO searchVO) throws Exception;

	AdminNotifyVO selectNotify(AdminNotifyVO vo) throws Exception;

	void updateNotify(AdminNotifyVO vo) throws Exception;

	void deleteNotify(AdminNotifyVO vo) throws Exception;

	List<String> selectMainNotify() throws Exception;

}
