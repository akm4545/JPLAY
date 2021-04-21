package jPlay.admin.movie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jPlay.admin.file.vo.AdminFileVO;
import jPlay.admin.movie.service.AdminMovieService;
import jPlay.admin.movie.vo.AdminMovieDefaultVO;
import jPlay.admin.movie.vo.AdminMovieVO;

@Controller
@RequestMapping("/admin/movie")
public class AdminMovieController {

    @Resource(name = "adminMovieService")
    private AdminMovieService adminMovieService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @Autowired
	private DefaultBeanValidator beanValidator; 
	
    @RequestMapping(value = "/main")
    public String adminMovieMain(Model model) throws Exception {
    	List<Map<String,String>> statisticsGenre = adminMovieService.selectTopGenre(); 
    	
    	List<Map<String,String>> statisticsMovie = adminMovieService.selectTopMovie();
    	
    	model.addAttribute("topGenre",statisticsGenre);
    	model.addAttribute("topMovie", statisticsMovie);
    			
    	return "admin/movie/adminMovieMain";
    }
    
    @RequestMapping(value="/movieList", method = RequestMethod.GET)
    public String selectMovieList(@ModelAttribute("searchVO") AdminMovieVO searchVO, 
    		@RequestParam(required = false)String insert,@RequestParam(required = false)String update,
    		ModelMap model) throws Exception {
    	
    	/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
        List<?> movieList = adminMovieService.selectMovieList(searchVO);
        
        model.addAttribute("resultList", movieList);
        
        int totCnt = adminMovieService.selectMovieListTotCnt(searchVO);
        
		paginationInfo.setTotalRecordCount(totCnt);
		
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("searchConditionMap",searchCondition());
        
        return "admin/movie/adminMovieList";
    } 
    
    @RequestMapping(value = "/movieAddView", method = RequestMethod.GET)
    public String addMovieView(@ModelAttribute("searchVO") AdminMovieDefaultVO searchVO, 
    		Model model) throws Exception {
    	
    	model.addAttribute("genre", genre());
        model.addAttribute("age", age());
        
        model.addAttribute("adminMovieVO", new AdminMovieVO());
        
        return "admin/movie/adminMovieAdd";
    }
    
    @RequestMapping(value = "/movieAdd", method = RequestMethod.POST)
    public String addMovie(@ModelAttribute("adminMovieVO") AdminMovieVO adminMovieVO,RedirectAttributes redirectAttributes,
    		Model model, BindingResult bindingResult) throws Exception {
    	
    	beanValidator.validate(adminMovieVO, bindingResult);
    	
    	if(bindingResult.hasErrors()) {
    		model.addAttribute("adminMovieVO", adminMovieVO);
			return "admin/movie/movieAddView";
    	}else {
    		String baseDir = propertiesService.getString("baseDir");
            adminMovieService.insertMovie(adminMovieVO,baseDir);
            
            redirectAttributes.addAttribute("insert", "영화를 등록하셨습니다.");
            
            return "redirect:/admin/movie/movieList";
    	}
    }
    
    @RequestMapping(value = "/movieInfo", method = RequestMethod.GET)
    public String movieInfo(int movieIdx, AdminMovieDefaultVO searchVO, Model model, HttpServletRequest request) throws Exception {
    	
    	Map<String, Object> movieMap = adminMovieService.selectMovie(movieIdx);
    	
    	AdminMovieVO movieVO = (AdminMovieVO) movieMap.get("movieVO");
    	List<AdminFileVO> fileVOS = (List<AdminFileVO>) movieMap.get("fileVOS");
    	
    	String files = "";
    	
        for(int i=0; i<fileVOS.size(); i++) {
        	if(fileVOS.get(i).getFileType().equals("image")) {
        		files += "<p>";
        		files += "이미지";
        		files += "</p>";
        		files += "<p>";
				files += "<img src='" + request.getContextPath() + "/resources/movie/images/" + movieVO.getMovieIdx() + "/" + fileVOS.get(i).getFileName() + "'/>";
				files += "</p>";
        	}else if(fileVOS.get(i).getFileClassification().equals("main")) {
        		files += "<p>";
        		files += "메인 동영상";
        		files += "</p>";
        		files += "<p class='mainmovie'>";
        		files += "<video src='" + request.getContextPath() + "/resources/movie/videos/" + movieVO.getMovieIdx() + "/" + fileVOS.get(i).getFileName() + "' type='video/mp4' controls='controls'/>";
				files += "</p>";
				files += "<p>지우기용 텍스트</p>";
        	}else {
        		files += "<p>";
        		files += "예고편 동영상";
        		files += "</p>";
        		files += "<p>";
        		files += "<video src='" + request.getContextPath() + "/resources/movie/videos/" + movieVO.getMovieIdx() + "/" + fileVOS.get(i).getFileName() + "' type='video/mp4' controls='controls'/>";
				files += "</p>";
				files += "<p>지우기용 텍스트</p>";
        	}
        }
        
        movieVO.setFileName(files);
        movieVO.setPageIndex(searchVO.getPageIndex());
        movieVO.setSearchCondition(searchVO.getSearchCondition());
        movieVO.setSearchKeyword(searchVO.getSearchKeyword());
        
        movieVO.setMovieOpeningdate(movieVO.getMovieOpeningdate().substring(0, 10));
    	
    	model.addAttribute("adminMovieVO", movieVO);
    	model.addAttribute("genre", genre());
        model.addAttribute("age", age());
        
    	return "admin/movie/adminMovieInfo";
    }
   
    @RequestMapping("/movieUpdate")
    public String updateMovie(@ModelAttribute("adminMovieVO") AdminMovieVO movieVO ,
    		RedirectAttributes redirectAttributes,BindingResult bindingResult, 
    		Model model) throws Exception {
    	
    	beanValidator.validate(movieVO, bindingResult);
    	
    	if(bindingResult.hasErrors()) {
    		model.addAttribute("adminMovieVO", movieVO);
    		return "admin/movie/adminMovieInfo";
    	}else {
    		String baseDir = propertiesService.getString("baseDir");

            adminMovieService.updateMovie(movieVO,baseDir);
            
            redirectAttributes.addFlashAttribute("searchVO", movieVO);
            redirectAttributes.addAttribute("update","영화를 수정하였습니다.");
            
            return "redirect:/admin/movie/movieList";
    	}
    }
    
    @RequestMapping(value="/movieDeleteList", method = RequestMethod.GET)
    public String movieDeleteList(@ModelAttribute("searchVO") AdminMovieVO searchVO,
    		@RequestParam(required = false)String delete,ModelMap model) throws Exception {
    	
    	/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
        List<?> movieList = adminMovieService.selectMovieList(searchVO);
        
        model.addAttribute("resultList", movieList);
        
        int totCnt = adminMovieService.selectMovieListTotCnt(searchVO);
        
		paginationInfo.setTotalRecordCount(totCnt);
		
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("searchConditionMap",searchCondition());
        
        return "/admin/movie/adminMovieDeleteList";
    }
    
    @RequestMapping("/movieDelete")
    public String deleteMovie(AdminMovieVO movieVO,
    		RedirectAttributes redirectAttributes) throws Exception {
    	
    	String baseDir = propertiesService.getString("baseDir");
    	
        adminMovieService.deleteMovie(movieVO,baseDir);
        
        redirectAttributes.addFlashAttribute("searchVO", movieVO);
        redirectAttributes.addAttribute("delete", "영화가 삭제되었습니다.");
        
        return "redirect:/admin/movie/movieDeleteList";
    }
    
    private List<String> genre() {
    	 List<String> genre = new ArrayList<String>();
    	 
         genre.add("액션");
         genre.add("코미디");
         genre.add("드라마");
         genre.add("멜로");
         genre.add("스릴러");
         genre.add("SF");
         genre.add("판타지");
         genre.add("공포");
         genre.add("애니메이션");
         genre.add("사극");
         
         return genre;
    }
    
    private List<String> age() {
    	List<String> age = new ArrayList<String>();
    	
        age.add("전체이용가");
        age.add("12세");
        age.add("15세");
        age.add("청소년시청불가");
      
        return age;
   }
    
    private Map<String,String> searchCondition(){
		Map<String,String> searchConditionMap = new HashMap<String, String>();
		
		searchConditionMap.put("movie_idx","고유번호");
		searchConditionMap.put("movie_title","영화제목");
		searchConditionMap.put("movie_openingDate","개봉일");
		searchConditionMap.put("movie_rating","평점");
		searchConditionMap.put("movie_genre","장르");
		searchConditionMap.put("movie_age","이용가");
		searchConditionMap.put("movie_director","감독");
		searchConditionMap.put("movie_actor","배우");
		searchConditionMap.put("movie_viewCount","시청수");
		
		return searchConditionMap;
	}
}