package kr.or.bok.ui.data.work;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.dao.manager.NamedDataManager;
import ritus.dao.vos.DataMapVO;
import ritus.ui.data.IData;
import ritus.utils.StringUtil;

/**
 * 
 *
 * <pre>
 *  SR 파일
 * </pre>
 *
 * @author Unipoint 백진현 사원
 * @version 1.0 
 * @created 2018. 3. 28. 오후 5:35:48
 */

@Component("data.work.srfile")
public class SRFileData implements IData {
	
	@Autowired
	private NamedDataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		JSONObject json = new JSONObject();
		DataMapVO dataMapVO = new DataMapVO();

		String file_id = StringUtil.getData(parameters.get("file_id"), null);
		
		String where = "CATEGORY_ID = 'RSR00001' AND FILE_ID = #{params.file_id}";
		dataMapVO.setParams("file_id", file_id);
		dataMapVO.setWhere(where);
		
		try {
			List<DataMapVO> list = dataManager.getDefaultData("RITUS_FILES", dataMapVO);
			if ( list != null && list.size() > 0 ) {
				DataMapVO vo = list.get(0);
				json.put("FILE_NAME", vo.getStringData("FILE_NAME"));
				json.put("FILE_ID", vo.getStringData("FILE_ID"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return json.toString();
	}

}
