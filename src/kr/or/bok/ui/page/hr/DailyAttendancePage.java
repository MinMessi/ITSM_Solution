package kr.or.bok.ui.page.hr;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import ritus.utils.CalendarUtil;

/**
 * 
 *
 * <pre>
 * 	인력관리 > 근태현황 > 일자별 출퇴근현황
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 7. 10. 오후 2:19:41
 */
@Component("page.hr.dailyattendance")
public class DailyAttendancePage implements IPage {

	/* 공통 로거 */
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(DailyAttendancePage.class);

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
				ICSSPlugins.datepicker
		));

		//breadcrumb 설정 - 페이지 path를 적어준다.
		String breadcrumb = "/인력관리/근태현황/일자별 출퇴근현황";
		result.addObject("breadcrumb", breadcrumb.split("/"));

		result.addObject("DATE", CalendarUtil.getToday("yyyy-MM-dd"));
		
		return result;
	}

}
