package jPlay.common.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ibm.icu.text.SimpleDateFormat;
import com.ibm.icu.util.Calendar;

@Service("dateService")
public class DateService {
	
	public String getBeginDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        String beginDate = sdf.format(cal.getTime());

        return beginDate;
	}
	
	public String getEndDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, 30);
        String endDate = sdf.format(cal.getTime());
        return endDate;
	}
	
	public List<String> getMonthList(){
		List<String> monthList = new ArrayList<String>();
		for(int i=0; i<12; i++) {
			monthList.add(String.valueOf(i+1));
		}
		
		return monthList;
	}
	
	public List<String> getYearList(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        Calendar cal = Calendar.getInstance();
        
		List<String> yearList = new ArrayList<String>();
		for(int i=0; i<12; i++) {
			yearList.add(sdf.format(cal.getTime()));
			cal.add(Calendar.YEAR, 1);
		}
		
		return yearList;
	}
}
