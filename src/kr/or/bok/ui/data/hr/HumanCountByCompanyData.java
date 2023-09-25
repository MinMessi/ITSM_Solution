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

/**
 * 
 *
 * <pre>
 * 	업체목록 별 인원수 데이터
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 25. 오후 1:57:49
 */

@Component("data.hr.humancountbycompany")
public class HumanCountByCompanyData implements IData {
	
	@Autowired
	private NamedDataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		DataMapVO vo = new DataMapVO();
		parameters.put("view_name", "CV_ITO_COUNT_BY_COMPANY");
		
		JSONObject json = null;
		
		try {
			json = dataManager.getJSONData(parameters, vo);
		} catch(RitusEngineException e) {
			e.printStackTrace();
		}
		
		return json.toString();
	}

}
