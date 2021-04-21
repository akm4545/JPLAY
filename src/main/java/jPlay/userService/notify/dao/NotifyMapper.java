package jPlay.userService.notify.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import jPlay.admin.userService.notify.vo.AdminNotifyVO;

@Mapper("notifyMapper")
public interface NotifyMapper {

	List<AdminNotifyVO> selectNotifyList(AdminNotifyVO searchVO) throws Exception;

	int selectNotifyListTotCnt(AdminNotifyVO searchVO) throws Exception;

	AdminNotifyVO selectNotify(AdminNotifyVO vo) throws Exception;
}