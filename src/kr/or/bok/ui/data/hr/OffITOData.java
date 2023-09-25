package kr.or.bok.ui.data.hr;

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
import ritus.utils.CalendarUtil;

/**
 * 
 *
 * <pre>
 * 	휴가자 정보
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 25. 오후 1:57:49
 */

@Component("data.hr.offito")
public class OffITOData implements IData {
	
	@Autowired
	private DataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		JSONObject json = null;
		
		parameters.put("category_id", "ITO00002");
		
		try {
			String where = null;
			DataMapVO dataMapVO = new DataMapVO();
			
			String today = CalendarUtil.getToday("yyyy-MM-dd");
			
			where = "IS_DELETE = 'N' AND ITO_ATT_TYPE='CDE00004003' AND ITO_ATT_DATETIME = #{params.today}";
			dataMapVO.setParams("today", today);
			
			dataMapVO.setWhere(where);		
			json = dataManager.getJSONData(parameters, dataMapVO);
		} catch(RitusEngineException e) {
			e.printStackTrace();
		}
		
		return json.toString();
	}

}
