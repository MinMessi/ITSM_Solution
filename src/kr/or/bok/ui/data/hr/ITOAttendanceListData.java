package kr.or.bok.ui.data.hr;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.dao.manager.NamedDataManager;
import ritus.dao.vos.DataMapVO;
import ritus.exception.RitusEngineException;
import ritus.ui.data.IData;
import ritus.utils.CalendarUtil;
import ritus.utils.StringUtil;

/**
 * 
 *
 * <pre>
 * 	출퇴근 현황 조회
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 25. 오후 1:57:49
 */

@Component("data.hr.itoattendancelist")
public class ITOAttendanceListData implements IData {
	
	@Autowired
	private NamedDataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		JSONObject json = new JSONObject();
		String date = StringUtil.getData(parameters.get("date"), CalendarUtil.getToday("yyyy-MM-dd"));

		DataMapVO dataMapVO = new DataMapVO();
		dataMapVO.setWhere("IS_DELETE = 'N' AND ATT_DATE = #{params.date}");
		dataMapVO.setParams("date", date);
		
		parameters.put("view_name", "CV_ITO_ATT_DAILY");
		
		try {
			json = dataManager.getJSONData(parameters, dataMapVO);
		} catch(RitusEngineException e) {
			e.printStackTrace();
		}
		
		return json.toString();
	}

}
