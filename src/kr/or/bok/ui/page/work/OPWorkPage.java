package kr.or.bok.ui.page.work;

import java.util.Calendar;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.dao.manager.DataManager;
import ritus.dao.manager.NamedDataManager;
import ritus.ui.page.IPage;
import ritus.ui.utils.ICSSPlugins;
import ritus.ui.utils.UseCSS;
import ritus.utils.CalendarUtil;

/**
 * 
 *
 * <pre>
 * 	장애관리 > 자산별 SR 처리현황
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 8. 22. 오전 9:53:57
 */
@Component("page.work.opwork")
public class OPWorkPage implements IPage {
	
	@Autowired
	private DataManager dataManager;
	
	@Autowired
	private NamedDataManager namedDataManager;
	
	@Override
	public ModelAndView invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		//이미지 서버 설정 - 지우지 말 것
		String imageServer = (String) result.getModelMap().get("imageServer");
		result.addObject("imageServer", imageServer);
		
		//CSS
		result.addObject("CSS", UseCSS.getCSS(imageServer,
				ICSSPlugins.jsTree,
				ICSSPlugins.jqGrid,
				ICSSPlugins.datepicker,
				ICSSPlugins.clockpicker
		));
		
		String startDate = CalendarUtil.getDateAdd(Calendar.MONTH, -1, "yyyy-MM-dd");
		String today = CalendarUtil.getToday("yyyy-MM-dd");
		result.addObject("today", today);
		result.addObject("startDate", startDate);
		
		result.addObject("CLIENTS", namedDataManager.getCodeTreeDataOptions("CV_CLIENTS", null, false, true));
		result.addObject("ITOS", namedDataManager.getCodeTreeDataOptions("CV_ITO_RESIDE", null, false, true));

		result.addObject("CDE00016", dataManager.getCodeTreeDataOptions("CDE00016", null, false, true));
		
		//breadcrumb 설정 - 페이지 path를 적어준다.
		String breadcrumb = "/작업관리/야간 근무일지";
		result.addObject("breadcrumb", breadcrumb.split("/"));

		return result;
	}

}
