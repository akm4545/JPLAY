package jPlay.main.controller;

import java.io.File;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.rte.fdl.property.EgovPropertyService;
import jPlay.admin.movie.vo.AdminMovieDefaultVO;
import jPlay.admin.movie.vo.AdminMovieVO;
import jPlay.admin.userService.notify.service.AdminNotifyService;
import jPlay.admin.userService.notify.vo.AdminNotifyVO;
import jPlay.main.service.MainService;
import jPlay.main.service.MainServiceImpl;
import net.coobird.thumbnailator.Thumbnails;

@Controller
public class MainController {
	
	@Resource(name = "mainService")
	MainService mainService;
	
	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
	@RequestMapping(value = {"/", "/main"})
	public String main(Model model, @RequestParam(value = "msg", required = false) String msg) throws Exception {
		String[] genre = {"액션","코미디","드라마","멜로","스릴러","SF","판타지","공포","애니메이션","사극"};
		
		Map<String,List<AdminMovieVO>> mainImages = mainService.selectMovieImages(genre);
		
		Random genreRandom = new Random();
		List<String> genreChoice = new ArrayList<String>();
		
		List<AdminNotifyVO> notifyList = mainService.selectMainNotify();
		
		while (true) {
			String _genre = genre[genreRandom.nextInt(genre.length - 1)];
			if(!genreChoice.contains(_genre)) {
				genreChoice.add(_genre);
			}
			if(genreChoice.size() == 4) {
				break;
			}
		}
		model.addAttribute("notifyList",notifyList);
		
		model.addAttribute("mainImages", mainImages);
		model.addAttribute("genreRandom", genreChoice);
		
		if(msg != null) {
			model.addAttribute("msg",msg);
		}
	
		return "main/main";
	}
	
	@RequestMapping("/mainImage")
	protected void mainImage(String movieIdx, String fileName, HttpServletResponse response) 
			throws Exception {
		
		OutputStream out = response.getOutputStream();
		try {
			String filePath = propertiesService.getString("baseDir");
			
			filePath = filePath.substring(0,filePath.lastIndexOf("temp")) + "/movie/images/" + movieIdx + "/" + fileName;
			
			
			File image = new File(filePath);
			
			if (image.exists()) { 
				Thumbnails.of(image).size(284,330).outputFormat("jpg").toOutputStream(out);
			}
			
			byte[] buffer = new byte[1024 * 8];
			
			out.write(buffer);
			out.close();
		}catch(IndexOutOfBoundsException e) {
			e.printStackTrace();
			out.close();
		}
	}
}