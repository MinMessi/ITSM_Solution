package kr.or.bok.ui.data.hr;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.dao.manager.DataManager;
import ritus.dao.vos.DataMapVO;
import ritus.dao.vos.LoginUserVO;
import ritus.sso.SSO;
import ritus.ui.data.IData;
import ritus.ui.utils.ReturnMessage;
import ritus.utils.CalendarUtil;

/**
 * 
 *
 * <pre>
 * 	출퇴근 현황 조회
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 25. 오후 1:57:49
 */

@Component("data.hr.itoattendanceinfo")
public class ITOAttendanceInfoData implements IData {
	
	@Autowired
	private DataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {

		ReturnMessage rm = new ReturnMessage(true, "1");
		
		LoginUserVO userVO = SSO.check(request);	// 로그인한 사람에 대한 정보
		DataMapVO dataMapVO = new DataMapVO();

		String today = CalendarUtil.getToday("yyyy-MM-dd");
		
		dataMapVO.setWhere("IS_DELETE = 'N' AND ATT_USR_ID = #{params.usr_id} AND ATT_DATE = #{params.today}");
		dataMapVO.setParams("usr_id", userVO.getUser_id());
		dataMapVO.setParams("today", today);
		
		List<DataMapVO> list = dataManager.getDefaultData("ITO00004", dataMapVO);
		if ( list == null || list.size() == 0 )
			rm.set(false, "0");	// 만약 출근도장 안찍은 상태면 result에 false가 담기고, message에는 0이 담긴다.
		else {
			DataMapVO data = list.get(0);

			if ( data.getStringData("ATT_OUT_TIME") == null )
				rm.set(true, "1");	// 출근도장은 찍엇지만 아직 퇴근도장 안찍은 상태면 result에 true가 담기고, message에는 1이 담긴다.
			else rm.set(true, "2");	// 출근도장도 찍었고 퇴근도장도 찍었으면 result에는 true가 담기고, message에는 2가 담긴다.
		}
		
		return rm.toJSONString();
	}

}
