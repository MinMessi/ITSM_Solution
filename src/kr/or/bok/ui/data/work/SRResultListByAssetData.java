package kr.or.bok.ui.data.work;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.jdbc.SQL;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.dao.manager.DataManager;
import ritus.dao.vos.DataMapVO;
import ritus.exception.RitusEngineException;
import ritus.ui.data.IData;
import ritus.utils.StringUtil;

/**
 * 
 *
 * <pre>
 * 	SR 처리현황 데이터 - 자산별
 * </pre>
 *
 * @author Unipoint 백진현 사원
 * @version 1.0 
 * @created 2018. 3. 28. 오전 12:42:55
 */

@Component("data.work.srresultlistbyasset")
public class SRResultListByAssetData implements IData {
	
	@Autowired
	private DataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		JSONObject json = null;
		DataMapVO dataMapVO = new DataMapVO();
		
		String AST_CD = StringUtil.getData(parameters.get("ast_id"), null);
		String startDate = StringUtil.getData(parameters.get("startDate"), null);
		String endDate = StringUtil.getData(parameters.get("endDate"), null);
		String searchOption = StringUtil.getData(parameters.get("searchOption"), null);
		String searchTxt = StringUtil.getData(parameters.get("searchTxt"), null);
		
		String where = "IS_DELETE = 'N' AND SR_RESULT = 'CDE00012001'";
		
		
		if ( AST_CD != null && !AST_CD.equals("CDE00020008")) {
				String innerSQL = new SQL() {
					{
						SELECT("CODE_CD");
			            FROM("CDV_ASSET_CUSTOM");
			            WHERE("IS_DELETE = 'N'");
					}
				}.toString();
				
				innerSQL += " START WITH CODE_CD = #{params.ast_prnt_cd} CONNECT BY PRIOR CODE_CD = CODE_PRNT_CD";
				
				where += " AND SR_AST_ID IN ( " + innerSQL + ") ";
				dataMapVO.setParams("ast_prnt_cd", AST_CD);
		}
		
		if ( startDate != null && endDate != null ) {
			where += " AND SR_REQ_DATE BETWEEN #{params.startDate} AND #{params.endDate} ";
			dataMapVO.setParams("startDate", startDate);
			dataMapVO.setParams("endDate", endDate);
		}
		
		if ( searchOption != null && searchTxt != null ) {
			where += " AND INSTR(" + searchOption + ", #{params.searchTxt}, 1) > 0 ";
			dataMapVO.setParams("searchTxt", searchTxt);
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
