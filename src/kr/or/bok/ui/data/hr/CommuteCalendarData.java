package kr.or.bok.ui.data.hr;

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
 * 	근태관리 데이터
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 25. 오후 1:57:49
 */

@Component("data.hr.commutecalendar")
public class CommuteCalendarData implements IData {
	
	@Autowired
	private DataManager dataManager;
	
	@Autowired
	private NamedDataManager namedDataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		JSONObject root = new JSONObject();
		JSONArray json = null;
		
		Integer ito_id = StringUtil.toInteger(parameters.get("usr_id"));
		String start = StringUtil.getData(parameters.get("start"), null);
		String end = StringUtil.getData(parameters.get("end"), null);
		
		DataMapVO vo = new DataMapVO();
		vo.setParams("start", start);
		vo.setParams("end", end);
		vo.setParams("data_id", ito_id);
		
		String where = "ITO_DATA_ID = #{params.data_id} AND ITO_ATT_DATETIME BETWEEN #{params.start} AND #{params.end} AND IS_DELETE = 'N'";
		
		if ( ito_id == 0 )
			where = "ITO_ATT_DATETIME BETWEEN #{params.start} AND #{params.end} AND IS_DELETE = 'N'";
			
		vo.setWhere(where);
		
		json = dataManager.getCalendarData("ITO00002", vo);
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
