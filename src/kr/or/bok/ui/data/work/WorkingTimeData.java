package kr.or.bok.ui.data.work;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.dao.manager.DataManager;
import ritus.dao.vos.DataMapVO;
import ritus.exception.RitusEngineException;
import ritus.ui.data.IData;
import ritus.utils.StringUtil;

/**
 * 
 *
 * <pre>
 * 	업무량 데이터
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 25. 오후 1:57:49
 */

@Component("data.work.workingtime")
public class WorkingTimeData implements IData {
	
	@Autowired
	private DataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		JSONObject json = null;
		DataMapVO dataMapVO = new DataMapVO();
		
		String where = "IS_DELETE = 'N' AND SR_RESULT = 'CDE00012001'";
		String month = StringUtil.getData(parameters.get("month"), null);
		String user_id = StringUtil.getData(parameters.get("user_id"), null);
		
		if ( month != null ) {
			where += " AND INSTR(SR_COMPLETE_DATE, #{params.month}, 1) > 0";
			dataMapVO.setParams("month", month);
		}
		
		if ( user_id != null ) {
			where += " AND SR_MANAGER_ID = #{params.user_id}";
			dataMapVO.setParams("user_id", user_id);
		}
		
		dataMapVO.setWhere(where);
		
		try {
			json = dataManager.getJSONData(parameters, dataMapVO);
			
		} catch(RitusEngineException e) {
			e.printStackTrace();
		}
		
		return json.toString();
	}

}
