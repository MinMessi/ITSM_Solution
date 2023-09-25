package kr.or.bok.ui.page.work;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.ui.page.IPage;
import ritus.ui.utils.ICSSPlugins;
import ritus.ui.utils.UseCSS;

/**
 * 
 *
 * <pre>
 * 	작업관리 > 이슈관리
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 7. 10. 오후 2:19:41
 */
@Component("page.work.issuemanage")
public class IssueManagePage implements IPage {

	/* 공통 로거 */
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(IssueManagePage.class);

	@Override
	public ModelAndView invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {

		//이미지 서버 설정 - 지우지 말 것
		String imageServer = (String) result.getModelMap().get("imageServer");

		//사용하려는 오픈소스의 css를 추가한다.
		result.addObject("CSS", UseCSS.getCSS(imageServer,
				ICSSPlugins.jqGrid,
				ICSSPlugins.jsTree,
				ICSSPlugins.jQueryUI,
				ICSSPlugins.datepicker,
				ICSSPlugins.daterangepicker
		));

		//breadcrumb 설정 - 페이지 path를 적어준다.
		String breadcrumb = "/작업관리/이슈관리";
		result.addObject("breadcrumb", breadcrumb.split("/"));

		return result;
	}

}
