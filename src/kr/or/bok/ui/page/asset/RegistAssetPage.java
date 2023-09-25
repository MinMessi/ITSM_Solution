package kr.or.bok.ui.page.asset;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.dao.manager.DataManager;
import ritus.ui.page.IPage;
import ritus.ui.utils.ICSSPlugins;
import ritus.ui.utils.UseCSS;

/**
 * 
 *
 * <pre>
 * 	자산관리 > 자산등록
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 8. 22. 오전 9:53:57
 */
@Component("page.asset.registasset")
public class RegistAssetPage implements IPage {
	
	@Autowired
	private DataManager dataManager;
	
	@Override
	public ModelAndView invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		//이미지 서버 설정 - 지우지 말 것
		String imageServer = (String) result.getModelMap().get("imageServer");
		result.addObject("imageServer", imageServer);
		
		//CSS
		result.addObject("CSS", UseCSS.getCSS(imageServer,
				ICSSPlugins.jsTree,
				ICSSPlugins.datepicker
		));
		
		result.addObject("CDE00002", dataManager.getCodeTreeDataOptions("CDE00002", null, false, true));
		
		//breadcrumb 설정 - 페이지 path를 적어준다.
		String breadcrumb = "/자산관리/자산등록";
		result.addObject("breadcrumb", breadcrumb.split("/"));

		return result;
	}

}
