package kr.or.bok.ui.data.asset;

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
 * 	자산 상세 정보
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 25. 오후 1:57:49
 */

@Component("data.asset.assetdetail")
public class AssetDetailData implements IData {
	
	@Autowired
	private DataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		JSONObject json = new JSONObject();

		Integer data_id = StringUtil.toInteger(parameters.get("data_id"));

		Map<String, Object> map = dataManager.getData("AST00001", data_id);
		for ( Map.Entry<String, Object> entry : map.entrySet() ) {
			String key = entry.getKey();
			Object value = entry.getValue();
			json.put(key, value);
		}
		
		// dataManager.getSeqData("V_ASSET", "AST_ID", "SEQ_2018_UNIX_");
		
		return json.toString();
	}

}
