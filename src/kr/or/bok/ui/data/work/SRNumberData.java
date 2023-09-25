package kr.or.bok.ui.data.work;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.dao.manager.DataManager;
import ritus.ui.data.IData;
import ritus.utils.StringUtil;

/**
 * 
 *
 * <pre>
 * 	SR 처리현황 데이터 - 자산별
 * </pre>
 *
 * @author Unipoint 백진현 사원
 * @version 1.0 
 * @created 2018. 3. 27. 오후 2:29:04
 */

@Component("data.work.srnumber")
public class SRNumberData implements IData {
	
	@Autowired
	private DataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		JSONObject json = new JSONObject();

		String astName = StringUtil.getData(parameters.get("SR_AST_NAME"), null);
		String reqDate = StringUtil.getData(parameters.get("SR_REQ_DATE"), null);
		String reqYear = reqDate.substring(0, 4);
		String srNum = "SR_" + reqYear + "_" + astName + "_";
		
		srNum = dataManager.getSeqData("V_SR_STATUS", "SR_NUMBER", srNum);
		json.put("SR_NUMBER", srNum);
		
		return json.toString();
	}

}
