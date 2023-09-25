package kr.or.bok.ui.data.trouble;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.jdbc.SQL;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.dao.manager.DataManager;
import ritus.dao.services.CategoryService;
import ritus.dao.vos.CategoryVO;
import ritus.dao.vos.DataMapVO;
import ritus.exception.RitusEngineException;
import ritus.ui.data.IData;
import ritus.utils.StringUtil;

/**
 * 
 *
 * <pre>
 * 	장애현황 데이터
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 25. 오후 1:57:49
 */

@Component("data.trouble.troublelist")
public class TroubleListData implements IData {
	
	@Autowired
	private DataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		JSONObject json = null;
		DataMapVO dataMapVO = new DataMapVO();

		String trb_ast_cd = StringUtil.getData(parameters.get("TRB_AST_CD"), null);
		String startDate = StringUtil.getData(parameters.get("startDate"), null);
		String endDate = StringUtil.getData(parameters.get("endDate"), null);
		
		String where = " IS_DELETE = 'N'";
		
		if ( trb_ast_cd != null ) {
			String innerSQL = new SQL() {
				{
					SELECT("CODE_CD");
		            FROM("CDV_SUPPORT_STATUS_TREE");
		            WHERE("IS_DELETE = 'N'");
				}
			}.toString();
			
			innerSQL += " START WITH CODE_CD = #{params.ast_prnt_cd} CONNECT BY PRIOR CODE_CD = CODE_PRNT_CD";
			
			where += " AND TRB_AST_CD IN ( " + innerSQL + ") ";
			dataMapVO.setParams("ast_prnt_cd", trb_ast_cd);
		}
		
		if ( startDate != null && endDate != null ) {
			where += " AND TRB_START_DATE BETWEEN #{params.startDate} AND #{params.endDate}";
			dataMapVO.setParams("startDate", startDate);
			dataMapVO.setParams("endDate", endDate);;
		} 
		
		dataMapVO.setWhere(where);
		
		try {
			json = dataManager.getJSONData(parameters, dataMapVO);
		} catch(RitusEngineException e) {
			e.printStackTrace();
		}
		
		return json.toString();
	}

}
