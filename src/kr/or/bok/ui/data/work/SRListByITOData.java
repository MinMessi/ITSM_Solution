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
 * 	SR 처리현황 데이터 - 인력별
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 25. 오후 1:57:49
 */

@Component("data.work.srlistbyito")
public class SRListByITOData implements IData {
	
	@Autowired
	private DataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		JSONObject json = null;
		DataMapVO dataMapVO = new DataMapVO();
		
		String managerID = StringUtil.getData(parameters.get("mid"), null);
		String startDate = StringUtil.getData(parameters.get("startDate"), null);
		String endDate = StringUtil.getData(parameters.get("endDate"), null);
		String searchOption = StringUtil.getData(parameters.get("searchOption"), null);
		String searchTxt = StringUtil.getData(parameters.get("searchTxt"), null);
		
		String where = "IS_DELETE = 'N' ";
		
		if ( managerID != null ) {
			Map<String, Object> t = dataManager.getData("ITO00001", StringUtil.toInteger(managerID));
			managerID = t.get("ITO_USER_ID").toString();
			
			where += " AND SR_MANAGER_ID = #{params.mid} ";
			dataMapVO.setParams("mid", managerID);
		}
		
		if ( startDate != null && endDate != null ) {
			where += " AND SR_REQ_DATE BETWEEN #{params.startDate} AND #{params.endDate} ";
			dataMapVO.setParams("startDate", startDate);
			dataMapVO.setParams("endDate", endDate);
		}
		
		if ( searchOption != null && searchTxt != null ) {
			where += " AND INSTR(" + searchOption + ", #{params.searchTxt}, 1) > 0 ";
			dataMapVO.setParams("searchTxt", searchTxt);
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
