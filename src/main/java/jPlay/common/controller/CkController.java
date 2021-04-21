package jPlay.common.controller;

import java.io.FileNotFoundException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.rte.fdl.cryptography.EgovEnvCryptoService;
import jPlay.common.service.EgovFormBasedFileUtil;
import jPlay.common.service.EgovProperties;
import jPlay.common.service.EgovStringUtil;

@Controller
@RequestMapping("/ck")
public class CkController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CkController.class);
	/** 첨부파일 위치 지정  => globals.properties */
	private final String uploadDir = EgovProperties.getProperty("Globals.fileStorePath");
	/** 허용할 확장자를 .확장자 형태로 연달아 기술한다. ex) .gif.jpg.jpeg.png => globals.properties */
	private final String extWhiteList = EgovProperties.getProperty("Globals.fileDownload.Extensions");    
	/** 첨부 최대 파일 크기 지정 */
	private final long maxFileSize = 1024 * 1024 * 100;   //업로드 최대 사이즈 설정 (100M)
	/** 암호화서비스 */
	@Resource(name = "egovEnvCryptoService")
	EgovEnvCryptoService cryptoService;
	/**
     * 이미지 view를 제공한다.
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value="/imageView",method=RequestMethod.GET)
    public void download(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//2017.12.12 - 출력 모듈 경로 변경 취약점 조치
    	//KISA 보안약점 조치 (2018-10-29, 윤창원)
//		String subPath = this.decrypt(EgovStringUtil.isNullToString(request.getParameter("path")));
//		String physical = this.decrypt(EgovStringUtil.isNullToString(request.getParameter("physical")));
//		String mimeType = this.decrypt(EgovStringUtil.isNullToString(request.getParameter("contentType")));
		String subPath = request.getParameter("path");
		String physical = request.getParameter("physical");
		String mimeType = request.getParameter("contentType");
		
		if (subPath.indexOf("..") >= 0 ) throw new Exception("Security Exception - illegal url called.");
		if (physical.indexOf("..") >= 0 ) throw new Exception("Security Exception - illegal url called.");
		
		String ext = "";
		if ( physical.lastIndexOf(".") > 0 )
			ext = physical.substring(physical.lastIndexOf(".") + 1,physical.length()).toLowerCase();
		if ( ext == null ) throw new FileNotFoundException();
		
		if ( extWhiteList.indexOf(ext) >= 0 ){
			EgovFormBasedFileUtil.viewFile(response, uploadDir, subPath, physical, mimeType);
		}
		else
			throw new FileNotFoundException();
    }
    
    /**
     * 복호화
     *
     * @param decrypt
     */
    private String decrypt(String decrypt){

    	try {
    		//return cryptoService.decrypt(decrypt); // Handles URLDecoding.
    		return cryptoService.decryptNone(decrypt); // Does not handle URLDecoding.
        } catch(IllegalArgumentException e) {
    		LOGGER.error("[IllegalArgumentException] Try/Catch...usingParameters Runing : "+ e.getMessage());
        } catch (Exception e) {
        	LOGGER.error("[" + e.getClass() +"] :" + e.getMessage());
        }
		return decrypt;
    }
}
