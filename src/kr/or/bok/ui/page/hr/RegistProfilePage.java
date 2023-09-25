package kr.or.bok.ui.page.hr;

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
 * 	인력관리 > 프로필 등록
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 8. 22. 오전 9:53:57
 */
@Component("page.hr.registprofile")
public class RegistProfilePage implements IPage {
	
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
				ICSSPlugins.datepicker,
				ICSSPlugins.chosen
		));
		
		//코드 데이터 설정
		result.addObject("CDE00001", dataManager.getCodeTreeDataOptions("CDE00001", null, false, true));
		result.addObject("CDE00002", dataManager.getCodeTreeDataOptions("CDE00002", null, false, true));
		result.addObject("CDE00003", dataManager.getCodeTreeDataOptions("CDE00003", null, false, true));
		result.addObject("CDE00005", dataManager.getCodeTreeDataOptions("CDE00005", null, false, true));
		result.addObject("CDE00007", dataManager.getCodeTreeDataOptions("CDE00007", null, false, false));
		result.addObject("CDE00011", dataManager.getCodeTreeDataOptions("CDE00011", null, false, true));
		
		//breadcrumb 설정 - 페이지 path를 적어준다.
		String breadcrumb = "/인력관리/인력 프로필 등록";
		result.addObject("breadcrumb", breadcrumb.split("/"));

		return result;
	}

}
