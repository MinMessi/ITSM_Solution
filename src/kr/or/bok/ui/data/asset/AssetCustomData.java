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
 * 	자산트리 데이터
 * </pre>
 *
 * @author Unipoint 백진현 사원
 * @version 1.0 
 * @created 2018. 3. 23. 오후 2:29:24
 */

@Component("data.asset.assetcustom")
public class AssetCustomData implements IData {
	
	@Autowired
	private DataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		String isCode = StringUtil.getData(parameters.get("is_code"), null);
		
		JSONArray jsonArray = null;
		
		if ( isCode == null ) {
			jsonArray = dataManager.getCodeTreeWithNoCDData("CDE00020", null);
		} else {
			jsonArray = dataManager.getCodeTreeWithNoCDData("CDE00020", "INSTR(ICON, 'folder', 1) > 0");
		}
		
		return jsonArray.toString();
	}

}
