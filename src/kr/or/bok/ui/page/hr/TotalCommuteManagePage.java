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
 * 	인력관리 > 전체근태현황
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 7. 10. 오후 2:19:41
 */
@Component("page.hr.totalcommutemanage")
public class TotalCommuteManagePage implements IPage {

	/* 공통 로거 */
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(TotalCommuteManagePage.class);

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
		String breadcrumb = "/인력관리/근태현황/근태현황";
		result.addObject("breadcrumb", breadcrumb.split("/"));

		/* 코딩 시작 부분 */
		//근태코드 변경히스토리 카테고리
		String category_id = "IHH00003";
		result.addObject("category_id", category_id);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM");

		result.addObject("holidayJson", "");

		Date date  = new Date();
		String dTime = formatter.format(date);
		result.addObject("DATE", dTime);
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		
		String startDay = CalendarUtil.getString(cal.getTimeInMillis(), "yyyy-MM-dd");
		
		cal.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);
		String endDay = CalendarUtil.getString(cal.getTimeInMillis(), "yyyy-MM-dd");
		
		result.addObject("startDate", startDay);
		result.addObject("endDate", endDay);

		/* 코딩 종료 */

		return result;
	}

}
