package jPlay.movie.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jPlay.admin.movie.vo.AdminMovieDefaultVO;
import jPlay.admin.movie.vo.AdminMovieVO;
import jPlay.movie.service.MovieService;
import jPlay.wihsList.service.WishListService;
import jPlay.wihsList.vo.WishlistVO;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	@Resource(name = "movieService")
	MovieService movieService;
	
	@Resource(name = "wishList")
	WishListService wishListService;
	
	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
	@RequestMapping("/movieInfo")
	public String movieInfo(String movieIdx,@RequestParam(required = false)String memberIdx,
			Model model) throws Exception {
		
		if(memberIdx != null) {
			WishlistVO wishVO = wishListService.selectWishlist(movieIdx,memberIdx);
			if(wishVO != null) {
				model.addAttribute("wishSw", true);
			}
		}
		
		AdminMovieVO vo = movieService.selectMovie(movieIdx);
		AdminMovieVO mainVideo = movieService.selectMainVideo(movieIdx);
		
		List<AdminMovieVO> recommendList = movieService.selectRecommend(vo.getMovieGenre());
		
		if(vo.getMovieRating() != 0) {
			if(vo.getMovieRating() % 2 == 0) {
				model.addAttribute("movieRating",(vo.getMovieRating() / 2));
			}else {
				model.addAttribute("movieRating",(vo.getMovieRating() / 2.0));				
			}
		}
		model.addAttribute("recommendList", recommendList);
		
		model.addAttribute("mainVideo",mainVideo);
		model.addAttribute("movieVO",vo);
		
		return "movie/movieInfo";
	}
	
	@RequestMapping("/movieSearch")
	public String movieSearch(@ModelAttribute("searchVO") AdminMovieDefaultVO searchVO, 
    		Model model) throws Exception {
		
		/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("moviePageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
        List<?> movieList = movieService.selectMovieList(searchVO);
        
        model.addAttribute("resultList", movieList);
        
        int totCnt = movieService.selectMovieListTotCnt(searchVO);
        
		paginationInfo.setTotalRecordCount(totCnt);
		
		model.addAttribute("paginationInfo", paginationInfo);
        
		return "movie/movieSearch";
	}
	
	@ResponseBody
	@RequestMapping(value = "/addMovieView", method = RequestMethod.GET)
	public String addMovieView(String movieIdx, String memberIdx) throws Exception{
		movieService.addMovieView(movieIdx,memberIdx);
		
		return "success";
	}
	
	@RequestMapping(value = "/movieList", method = RequestMethod.GET)
	public String movieList(@ModelAttribute("genreVO") AdminMovieDefaultVO searchVO, String movieGenre, Model model) throws Exception {
		
		searchVO.setPageUnit(propertiesService.getInt("moviePageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		if(movieGenre != null) {
			if(movieGenre.equals("action")) {
				searchVO.setSearchKeyword("액션");
			}else if(movieGenre.equals("comedy")) {
				searchVO.setSearchKeyword("코미디");
			}else if(movieGenre.equals("drama")) {
				searchVO.setSearchKeyword("드라마");
			}else if(movieGenre.equals("romance")) {
				searchVO.setSearchKeyword("멜로");
			}else if(movieGenre.equals("thriller")) {
				searchVO.setSearchKeyword("스릴러");
			}else if(movieGenre.equals("SF")) {
				searchVO.setSearchKeyword("SF");
			}else if(movieGenre.equals("fantasy")) {
				searchVO.setSearchKeyword("판타지");
			}else if(movieGenre.equals("horror")) {
				searchVO.setSearchKeyword("공포");
			}else if(movieGenre.equals("animation")) {
				searchVO.setSearchKeyword("애니메이션");
			}else if(movieGenre.equals("history")) {
				searchVO.setSearchKeyword("사극");
			}
		}
		
        List<?> movieList = movieService.selectMovieGenreList(searchVO);
        
        System.out.println(movieList.size());
        
        model.addAttribute("resultList", movieList);
        
        int totCnt = movieService.selectMovieGenreListTotCnt(searchVO);
        
		paginationInfo.setTotalRecordCount(totCnt);
		
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "movie/movieGenreList";
	}
	
}
