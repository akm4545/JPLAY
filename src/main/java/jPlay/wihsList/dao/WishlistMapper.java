package jPlay.wihsList.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import jPlay.wihsList.vo.WishlistDefaultVO;
import jPlay.wihsList.vo.WishlistVO;

@Mapper("wishlistMapper")
public interface WishlistMapper {

	/**
	 * wishlist을 등록한다.
	 * @param vo - 등록할 정보가 담긴 WishlistVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public void insertWishlist(@Param("memberIdx")String memberIdx, @Param("movieIdx")String movieIdx) throws Exception;

    /**
	 * wishlist을 수정한다.
	 * @param vo - 수정할 정보가 담긴 WishlistVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateWishlist(WishlistVO vo) throws Exception;

    /**
	 * wishlist을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 WishlistVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteWishlist(@Param("memberIdx")String memberIdx, @Param("movieIdx")String movieIdx) throws Exception;

    /**
	 * wishlist 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return wishlist 목록
	 * @exception Exception
	 */
    public List<?> selectWishlistList(WishlistDefaultVO searchVO) throws Exception;

    /**
	 * wishlist 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return wishlist 총 갯수
	 * @exception
	 */
    public int selectWishlistListTotCnt(WishlistDefaultVO searchVO) throws Exception;

	public WishlistVO selectWishlist(@Param("movieIdx")String movieIdx, @Param("memberIdx")String memberIdx) throws Exception;

}
