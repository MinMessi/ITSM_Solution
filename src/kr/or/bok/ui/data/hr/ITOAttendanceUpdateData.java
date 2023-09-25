package kr.or.bok.ui.data.hr;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
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
import ritus.utils.StringUtil;

/**
 * 
 *
 * <pre>
 * 	출퇴근 현황 반영
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 25. 오후 1:57:49
 */

@Component("data.hr.itoattendanceupdate")
public class ITOAttendanceUpdateData implements IData {
	
	@Autowired
	private DataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {

		ReturnMessage rm = new ReturnMessage(true, "처리되었습니다.");
		
		LoginUserVO userVO = SSO.check(request);

		String nowDate = CalendarUtil.getToday("yyyy-MM-dd");		
		String nowTime = CalendarUtil.getToday("HH:mm:ss"); 
		String type = StringUtil.getData(parameters.get("type"), null);
		String user_id = userVO.getUser_id();
		
		DataMapVO dataMapVO = new DataMapVO();
		dataMapVO.setWhere("IS_DELETE = 'N' AND ATT_DATE = #{params.att_date} AND ATT_USR_ID = #{params.usr_id}");
		dataMapVO.setParams("att_date", nowDate);
		dataMapVO.setParams("usr_id", user_id);
		List<DataMapVO> list = dataManager.getDefaultData("ITO00004", dataMapVO);
		
		if ( "0".equals(type) ) {
			Date d = CalendarUtil.dateAdd(new Date(), Calendar.MINUTE, -10);
			nowTime = CalendarUtil.getString(d.getTime(), "HH:mm:ss");
			
			for ( DataMapVO data : list ) {
				Map<String, String> params = new HashMap<>();
				params.put("category_id", "ITO00004");
				params.put("data_id", data.getStringData("DATA_ID"));
				try {
					dataManager.deleteData(parameters);
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			Map<String, String> params = new HashMap<>();
			params.put("category_id", "ITO00004");
			params.put("ATT_DATE", nowDate);
			params.put("ATT_IN_TIME", nowTime);
			params.put("ATT_USR_ID", user_id);
			
			try {
				dataManager.createData(params);
			} catch(Exception e) {
				rm.set(false, e.getMessage());
			}
		} else {
			if ( list != null && list.size() > 0 ) {
				DataMapVO data = list.get(0);
				Map<String, String> params = new HashMap<>();
				params.put("category_id", "ITO00004");
				params.put("data_id", data.getStringData("DATA_ID"));
				params.put("ATT_DATE", data.getStringData("ATT_DATE"));
				params.put("ATT_IN_TIME", data.getStringData("ATT_IN_TIME"));
				params.put("ATT_OUT_TIME", nowTime);
				params.put("ATT_USR_ID", user_id);
				
				try {
					dataManager.modifyData(params);
				} catch(Exception e) {
					rm.set(false, e.getMessage());
				}
			}
		}
		
		return rm.toJSONString();
	}

}
