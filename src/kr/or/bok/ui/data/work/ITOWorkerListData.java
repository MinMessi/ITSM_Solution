package kr.or.bok.ui.data.work;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.dao.manager.DataManager;
import ritus.dao.vos.DataMapVO;
import ritus.ui.data.IData;
import ritus.utils.StringUtil;

/**
 * 
 *
 * <pre>
 * 	기술지원현황 - 처리자리스트
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2018. 1. 25. 오후 1:39:15
 */

@Component("data.work.itoworkerlist")
public class ITOWorkerListData implements IData {
	
	@Autowired
	private DataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		JSONArray root = new JSONArray();
		DataMapVO dataMapVO = new DataMapVO();
		
		String company = StringUtil.getData(parameters.get("company"), null);
		
		String where = "IS_DELETE = 'N' AND ITO_TYPE != 'CDE00001001' ";
		
		if ( company != null ) {
			where += " AND ITO_COMPANY = #{params.company}";
			dataMapVO.setParams("company", company);
		}
		
		dataMapVO.setWhere(where);
		dataMapVO.setSidx("ITO_NAME");
		
		try {
			List<DataMapVO> itoList = dataManager.getDefaultData("ITO00001", dataMapVO);
			for ( DataMapVO ito : itoList ) {
				JSONObject json = new JSONObject();
				json.put("DATA_ID", ito.getIntegerData("DATA_ID"));
				json.put("ITO_NAME", ito.getStringData("ITO_NAME"));
				root.put(json);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return root.toString();
	}

}
