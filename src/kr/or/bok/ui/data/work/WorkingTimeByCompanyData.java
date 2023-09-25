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
 * 	업체별 업무량 데이터
 * </pre>
 *
 * @author Unipoint 백진현 사원
 * @version 1.0 
 * @created 2018. 3. 20. 오후...
 */
@Component("data.work.workingtimebycompany")
public class WorkingTimeByCompanyData implements IData {
	
	@Autowired
	private DataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		// TODO Auto-generated method stub
		JSONObject json = null;
		
		// 처음에는 빈 객체
		DataMapVO dataMapVO = new DataMapVO();
		
		String where = "IS_DELETE = 'N' AND SUP_STATUS = 'CDE00016003'";
		String month = StringUtil.getData(parameters.get("month"), null); 
		String company_cd = StringUtil.getData(parameters.get("company_cd"), null);
		
		if ( month != null ) {
			where += " AND INSTR(SUP_REQ_DATE, #{params.month}, 1) > 0";
			dataMapVO.setParams("month", month);
		}
		
		if ( company_cd != null ) {
			where += " AND SUP_COMPANY = #{params.company_cd}";
			// Map<String, Object> params = new HashMap<>();에 각각 key, value값으로 삽입
			dataMapVO.setParams("company_cd", company_cd);
		}
		
		// 그냥 String 형태의 where절 추가
		dataMapVO.setWhere(where);
		
		try {
			json = dataManager.getJSONData(parameters, dataMapVO);
			
		} catch(RitusEngineException e) {
			e.printStackTrace();
		}
		
		return json.toString();
	}

}
