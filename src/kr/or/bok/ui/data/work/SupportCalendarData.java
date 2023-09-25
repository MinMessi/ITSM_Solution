package kr.or.bok.ui.data.work;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.dao.manager.DataManager;
import ritus.dao.manager.NamedDataManager;
import ritus.dao.vos.DataMapVO;
import ritus.ui.data.IData;
import ritus.utils.StringUtil;

/**
 * 
 *
 * <pre>
 * 	월별 점검 관리
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2018. 1. 10. 오후 1:38:25
 */

@Component("data.work.supportcalendar")
public class SupportCalendarData implements IData {
	
	@Autowired
	private DataManager dataManager;
	
	@Autowired
	private NamedDataManager namedDataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		JSONObject root = new JSONObject();
		JSONArray json = null;
		
		String start = StringUtil.getData(parameters.get("start"), null);
		String end = StringUtil.getData(parameters.get("end"), null);
		
		DataMapVO vo = new DataMapVO();
		vo.setParams("start", start);
		vo.setParams("end", end);
		
		String where = "IS_DELETE = 'N' AND RSR_SUPPORT_DATE BETWEEN #{params.start} AND #{params.end}";
		vo.setWhere(where);
		
		json = dataManager.getCalendarData("RSR00004", vo);
		root.put("event", json);
		
		//휴일 정보
		String year = end.substring(0, 4);
		DataMapVO dataMapVO = new DataMapVO();
		dataMapVO.setWhere("INSTR(RSR_HOLIDAY_DATE, #{params.year}, 1) > 0 OR INSTR(RSR_HOLIDAY_DATE, '*', 1) > 0");
		dataMapVO.setParams("year", year);
		
		List<DataMapVO> holidayList = namedDataManager.getDefaultData("CV_HOLIDAY", dataMapVO);
		
		JSONArray holidayJsonArray = new JSONArray();
		for ( DataMapVO _vo : holidayList ) 
			holidayJsonArray.put(_vo.toJSONObject());

		root.put("holiday", holidayJsonArray);
		
		return root.toString();
	}

}
