package kr.or.bok.ui.data.work;

import java.util.Iterator;
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
 * 	업체 상세 정보
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 25. 오후 1:57:49
 */

@Component("data.work.companydetail")
public class CompanyDetailData implements IData {
	
	@Autowired
	private DataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		JSONObject json = new JSONObject();
		
		String category_id = "CDE00002";
		String code_cd = StringUtil.getData(parameters.get("company_cd"), null);
		
		try {
			if ( code_cd != null ) {
				Map<String, Object> data = dataManager.getCodeData(category_id, code_cd);
				Iterator<String> keys = data.keySet().iterator();
				while(keys.hasNext()) {
					String key = keys.next();
					Object v = data.get(key);
					json.put(key, v);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return json.toString();
	}

}
