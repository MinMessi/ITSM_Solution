package kr.or.bok.ui.page.hr;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.dao.manager.DataManager;
import ritus.dao.manager.NamedDataManager;
import ritus.dao.vos.DataMapVO;
import ritus.ui.page.IPage;
import ritus.ui.utils.ICSSPlugins;
import ritus.ui.utils.UseCSS;
import ritus.utils.CalendarUtil;

/**
 * 
 *
 * <pre>
 * 	인력관리 > 근태관리
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 7. 10. 오후 2:16:07
 */

@Component("page.hr.commutemanage")
public class CommuteManagePage implements IPage {

	@Autowired
	private DataManager dataManager;
	
	@Autowired
	private NamedDataManager namedDataManager;
	
	/* 공통 로거 */
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(CommuteManagePage.class);

	@Override
	public ModelAndView invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {

		//이미지 서버 설정 - 지우지 말 것
		String imageServer = (String) result.getModelMap().get("imageServer");

		//사용하려는 오픈소스의 css를 추가한다.
		result.addObject("CSS", UseCSS.getCSS(imageServer,
				ICSSPlugins.jqGrid,
				ICSSPlugins.jsTree,
				ICSSPlugins.fullcalendar,
				ICSSPlugins.datepicker
		));

		//breadcrumb 설정 - 페이지 path를 적어준다.
		String breadcrumb = "/인력관리/근태관리";
		result.addObject("breadcrumb", breadcrumb.split("/"));

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM");
		
		String year = CalendarUtil.getToday("yyyy");
		
		DataMapVO dataMapVO = new DataMapVO();
		dataMapVO.setWhere("INSTR(RSR_HOLIDAY_DATE, #{params.year}, 1) > 0 OR INSTR(RSR_HOLIDAY_DATE, '*', 1) > 0");
		dataMapVO.setParams("year", year);
		
		List<DataMapVO> holidayList = namedDataManager.getDefaultData("CV_HOLIDAY", dataMapVO);
		
		JSONArray holidayJsonArray = new JSONArray();
		for ( DataMapVO vo : holidayList ) 
			holidayJsonArray.put(vo.toJSONObject());

		result.addObject("holidayJson", holidayJsonArray.toString());

		result.addObject("CDE00004", dataManager.getCodeTreeDataOptions("CDE00004", null, false, true));

		Date date  = new Date();
		String dTime = formatter.format(date);
		result.addObject("DATE", dTime);

		return result;
	}

}
