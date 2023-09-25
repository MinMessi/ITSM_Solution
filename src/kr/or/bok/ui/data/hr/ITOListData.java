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
 * 	인력 데이터
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 25. 오후 1:57:49
 */

@Component("data.hr.itolist")
public class ITOListData implements IData {
	
	@Autowired
	private DataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		JSONObject json = null;
		
		try {
			String where = null;
			DataMapVO dataMapVO = new DataMapVO();
			
			//검색 조건 설정
			String searchOption = StringUtil.getData(parameters.get("searchOption"), null);
			String searchStr = StringUtil.getData(parameters.get("searchStr"), null);
			
			if ( searchOption != null && searchStr != null ) {
				dataMapVO.setParams(searchOption, searchStr);
				where = "INSTR(" + searchOption + ", #{params." + searchOption + "}, 1) > 0";
			}
			
			String company_cd = StringUtil.getData(parameters.get("company_cd"), null);

			if ( company_cd != null ) {
				dataMapVO.setParams("company_cd", company_cd);		
				
				if ( where != null ) where += " AND ";
				else where = "";

				where += " ITO_COMPANY = #{params.company_cd}";		
			}
			
			dataMapVO.setParams("ito_is_valid", "1");
			dataMapVO.setParams("is_delete", "N");
			
			if ( where != null ) where += " AND ";
			else where = "";
			
			where += " ITO_IS_VALID = #{params.ito_is_valid} AND IS_DELETE = #{params.is_delete}";
			
			dataMapVO.setWhere(where);		
			json = dataManager.getJSONData(parameters, dataMapVO);
		} catch(RitusEngineException e) {
			e.printStackTrace();
		}
		
		return json.toString();
	}

}
