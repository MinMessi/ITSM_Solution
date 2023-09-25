package kr.or.bok.ui.page.work;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.ui.page.IPage;
import ritus.ui.utils.ICSSPlugins;
import ritus.ui.utils.UseCSS;

/**
 * 
 *
 * <pre>
 * 	작업관리 > 협력업체별 업무량
 * </pre>
 *
 * @author Unipoint 백진현 사원
 * @version 1.0 
 * @created 2018. 03. 19. 오후 ...
 */
@Component("page.work.workingtimebycompany")
public class WorkingTimeByCompanyPage implements IPage {

	@Override
	public ModelAndView invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		// TODO Auto-generated method stub
		
		//이미지 서버 설정 - 지우지 말 것
		String imageServer = (String) result.getModelMap().get("imageServer");
		result.addObject("imageServer", imageServer);
		
		//CSS
		result.addObject("CSS", UseCSS.getCSS(imageServer,
				ICSSPlugins.jqGrid,
				ICSSPlugins.datepicker
		));
		
		//breadcrumb 설정 - 페이지 path를 적어준다.
		String breadcrumb = "/작업관리/협력업체별 업무량";
		result.addObject("breadcrumb", breadcrumb.split("/"));
				
		return result;
	}

}
