package kr.or.bok.ui.admin.page.extend;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
 * 	사용자 관리
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 8. 21. 오전 10:39:48
 */

@Component("admin.page.extend.users.manageuser")
public class ManageUserPage implements IPage {

	@Autowired
	private DataManager dataManager;

	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(ManageUserPage.class);

	@Override
	public ModelAndView invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {

		String imageServer = (String) result.getModelMap().get("imageServer");

		//set CSS
		result.addObject("CSS", UseCSS.getCSS(imageServer,
				ICSSPlugins.jsTree,
				ICSSPlugins.jqGrid,
				ICSSPlugins.jQueryUI,
				ICSSPlugins.iCheck,
				ICSSPlugins.toastr
		));

		String options = dataManager.getCodeTreeDataOptions("CDE00018", null, false, true);
		result.addObject("CDE00018", options);

		//breadcrumb 설정
		String breadcrumb = "/관리자/사용자 및 메뉴 관리/사용자 관리";
		result.addObject("breadcrumb", breadcrumb.split("/"));

		return result;
	}

}
