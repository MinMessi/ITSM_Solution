package kr.or.bok.ui.page.test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
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
import ritus.utils.CalendarUtil;

/**
 * 
 *
 * <pre>
 * 	테스트
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 7. 10. 오후 2:19:41
 */
@Component("page.test.test")
public class TestPage implements IPage {

	@Autowired
	private DataManager dataManager;

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
		String breadcrumb = "/test/test";
		result.addObject("breadcrumb", breadcrumb.split("/"));

		synchronized(this) {
			for ( int i=0; i<100000; i++ ) {
				Map<String, String> param = new HashMap<>();
				param.put("category_id", "TST00001");
				param.put("FIELD1", "임시 필드 1의 데이터 구분자 : field1");
				param.put("FIELD2", "임시 필드 2의 데이터 구분자 : field2");
				param.put("FIELD3", "임시 필드 3의 데이터 구분자 : field3");
				param.put("FIELD4", "임시 필드 4의 데이터 구분자 : field4");
				param.put("FIELD5", "임시 필드 5의 데이터 구분자 : field5");
				
				try {
					dataManager.createData(param);
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}

		/* 코딩 종료 */

		return result;
	}

}
