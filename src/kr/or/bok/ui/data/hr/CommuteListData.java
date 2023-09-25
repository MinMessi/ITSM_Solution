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
import ritus.utils.StringUtil;

/**
 * 
 *
 * <pre>
 * 	근태현황 데이터
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 25. 오후 1:57:49
 */

@Component("data.hr.commutelist")
public class CommuteListData implements IData {
	
	@Autowired
	private DataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		JSONObject json = null;
		
		String startDate = StringUtil.getData(parameters.get("startDate"), null);
		String endDate = StringUtil.getData(parameters.get("endDate"), null);
		String searchOption = StringUtil.getData(parameters.get("searchOption"), null);
		String searchStr = StringUtil.getData(parameters.get("searchStr"), null);
		
		DataMapVO dataMapVO = new DataMapVO();
		
		String where = " IS_DELETE = 'N' ";
		
		if ( startDate != null && endDate != null ) {
			where += " AND ";
			dataMapVO.setParams("startDate", startDate);
			dataMapVO.setParams("endDate", endDate);
			where += "ITO_ATT_DATETIME BETWEEN #{params.startDate} AND #{params.endDate}";
			
			if ( searchStr != null ) {
				dataMapVO.setParams("searchStr", searchStr);
				
				where += " AND ";
				where += " INSTR(" + searchOption + ", #{params.searchStr}, 1) > 0";
			}
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
