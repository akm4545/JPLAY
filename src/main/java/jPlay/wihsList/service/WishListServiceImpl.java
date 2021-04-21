package jPlay.wihsList.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import jPlay.wihsList.dao.WishlistMapper;
import jPlay.wihsList.vo.WishlistVO;

@Service("wishList")
public class WishListServiceImpl implements WishListService {
	
	@Resource(name = "wishlistMapper")
	WishlistMapper wishlistDAO;
	
	@Override
	public WishlistVO selectWishlist(String movieIdx, String memberIdx) throws Exception {
		return wishlistDAO.selectWishlist(movieIdx, memberIdx);
	}

	@Override
	public void insertWishlist(String memberIdx, String movieIdx) throws Exception {
		wishlistDAO.insertWishlist(memberIdx, movieIdx);
	}

	@Override
	public void deleteWishlist(String memberIdx, String movieIdx) throws Exception {
		System.out.println(memberIdx + " + " + movieIdx);
		wishlistDAO.deleteWishlist(memberIdx, movieIdx);
	}

}
