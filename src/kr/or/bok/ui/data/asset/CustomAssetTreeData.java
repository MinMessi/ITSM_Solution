package kr.or.bok.ui.data.asset;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
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
 * 	커스텀 자산트리 데이터
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 14. 오후 2:03:31
 */

@Component("data.asset.customassettree")
public class CustomAssetTreeData implements IData {
	
	@Autowired
	private DataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		String isCode = StringUtil.getData(parameters.get("is_code"), null);
		String isCustom = StringUtil.getData(parameters.get("is_custom"), null);
		
		JSONArray jsonArray = null;
		
		try {
			jsonArray = dataManager.getCodeTreeWithNoCDData("CDE00019", null);
		} catch(Exception e) {
			jsonArray = new JSONArray();
		}
		
		return jsonArray.toString();
	}

}
