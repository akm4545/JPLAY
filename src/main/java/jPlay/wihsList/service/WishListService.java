package jPlay.wihsList.service;

import jPlay.wihsList.vo.WishlistVO;

public interface WishListService {

	WishlistVO selectWishlist(String movieIdx, String memberIdx) throws Exception;

	void insertWishlist(String memberIdx, String movieIdx) throws Exception;

	void deleteWishlist(String memberIdx, String movieIdx) throws Exception;

}
