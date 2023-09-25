package kr.or.bok.ui.page.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.dao.manager.NamedDataManager;
import ritus.dao.vos.DataMapVO;
import ritus.ui.page.IPage;
import ritus.ui.utils.ICSSPlugins;
import ritus.ui.utils.UseCSS;

/**
 * 
 *
 * <pre>
 * 	Dashboard Page
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 8. 22. 오전 9:53:57
 */
@Component("page.main.dashboard")
public class DashboardPage implements IPage {
	
	@Autowired
	private NamedDataManager dataManager;
	
	@Override
	public ModelAndView invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		//이미지 서버 설정 - 지우지 말 것
		String imageServer = (String) result.getModelMap().get("imageServer");
		result.addObject("imageServer", imageServer);
		
		String where = "IS_DELETE = 'N' ";
		
		//CSS
		result.addObject("CSS", UseCSS.getCSS(imageServer,
				ICSSPlugins.jqGrid,
				ICSSPlugins.c3
		));
		
		JSONObject root = new JSONObject();
		
		DataMapVO dataMapVO = new DataMapVO();
		
		dataMapVO.setWhere(where);

		List<DataMapVO> supportList = dataManager.getDefaultData("CV_TODAY_SUPPORT", dataMapVO);
		List<DataMapVO> srList = dataManager.getDefaultData("CV_RECENT_SR_RESULT", dataMapVO);
		List<DataMapVO> msList = dataManager.getDefaultData("CV_MONTH_SUPPORT", dataMapVO);
		
		JSONArray array = new JSONArray();
		if ( supportList != null ) {
			for ( DataMapVO vo : supportList )
				array.put(vo.toJSONObject());
			
			root.put("support", array);
		}
		
		if ( srList != null ) {
			array = new JSONArray();
			for ( DataMapVO vo : srList )
				array.put(vo.toJSONObject());
			
			root.put("sr", array);
		}
		
		if ( msList != null ) {
			array = new JSONArray();
			for ( DataMapVO vo : msList )
				array.put(vo.toJSONObject());
			
			root.put("ms", array);
		}
		
		result.addObject("root", root.toString());
		
		//breadcrumb 설정 - 페이지 path를 적어준다.
		String breadcrumb = "/메인/Dashboard";
		result.addObject("breadcrumb", breadcrumb.split("/"));

		return result;
	}

}
