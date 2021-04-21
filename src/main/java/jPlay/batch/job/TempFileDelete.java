package jPlay.batch.job;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.property.EgovPropertyService;

@Service("tempFileDelete")
public class TempFileDelete {
	
	@Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
	public void tempDirectoryDelete() {
		System.out.println("임시 파일 삭제 시작");
		
		String baseDir = propertiesService.getString("baseDir");
		
		File base = new File(baseDir);
		
		try {
			FileUtils.cleanDirectory(base);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("삭제 완료");
	}
}