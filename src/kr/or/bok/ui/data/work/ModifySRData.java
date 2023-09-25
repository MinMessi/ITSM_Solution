package kr.or.bok.ui.data.work;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.dao.manager.DataManager;
import ritus.dao.manager.MessageManager;
import ritus.ui.data.IData;
import ritus.ui.utils.ReturnMessage;
import ritus.utils.CalendarUtil;
import ritus.utils.LogUtil;
import ritus.utils.StringUtil;

/**
 * 
 *
 * <pre>
 *  공통 데이터 수정
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 6. 8. 오후 4:34:29
 */
@Component("data.work.modify")
public class ModifySRData implements IData {

	@Autowired
	private DataManager dataManager;
	
	@Autowired
	private MessageManager message;

	private static final Logger logger = LoggerFactory.getLogger(ModifySRData.class);

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		ReturnMessage rm = new ReturnMessage(true, message.getMessage("ui.common.modify"));
		
		//시간외 계산 -> 시간외 본인 직접입력으로 변경
		// String sr_result = StringUtil.getData(parameters.get("SR_RESULT"), null);
		
		/*if ( sr_result != null && sr_result.equals("CDE00012001") ) {
			String complete_date = StringUtil.getData(parameters.get("SR_COMPLETE_DATE"), null);
			String working_start_time = StringUtil.getData(parameters.get("SR_WORK_START_TIME"), null);
			String working_end_time = StringUtil.getData(parameters.get("SR_WORK_END_TIME"), null);
			
			if ( !StringUtil.isNull(complete_date, working_start_time, working_end_time) ) {
				//String start = complete_date + " " + working_start_time;
				String df = complete_date + " 18:00";
				String end = complete_date + " " + working_end_time;
				
				//double start_time = CalendarUtil.toDate(start, "yyyy-MM-dd HH:mm").getTime();
				double df_time = CalendarUtil.toDate(df, "yyyy-MM-dd HH:mm").getTime();
				double end_time = CalendarUtil.toDate(end, "yyyy-MM-dd HH:mm").getTime();
				
				double out_time = end_time - df_time;
				if ( out_time < 0 )
					parameters.put("SR_WORKING_TIME_OUT", "0");
				else {
					double ct = out_time/1000d/60d/60d;
					parameters.put("SR_WORKING_TIME_OUT", Math.round(ct*100d)/100d + "");
				}
			}
		}*/
		
		try {
			dataManager.modifyData(parameters);
		} catch(Exception e) {
			e.printStackTrace();
			LogUtil.printErrorBanner(logger, e.getMessage());
			rm.set(false, e.getMessage());
		}
		
		return rm.toJSONString();

	}

}
