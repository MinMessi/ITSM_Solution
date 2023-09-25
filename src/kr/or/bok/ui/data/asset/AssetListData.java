package kr.or.bok.ui.data.asset;

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
 * 	자산현황 데이터
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 25. 오후 1:57:49
 */

@Component("data.asset.assetlist")
public class AssetListData implements IData {
	
	@Autowired
	private DataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		JSONObject json = null;
		DataMapVO dataMapVO = new DataMapVO();
		
		String company_cd = StringUtil.getData(parameters.get("company_cd"), null);
		String AST_CD = StringUtil.getData(parameters.get("ast_cd"), null);
		if ( "0".equals(AST_CD) ) AST_CD = null;
		
		String where = "IS_DELETE = 'N' ";
		
		if ( company_cd != null ) {
			where += " AND AST_SUPPORT_COMPANY = #{params.company_cd}";
			dataMapVO.setParams("company_cd", company_cd);
		}
		
		if ( AST_CD != null ) {
			String innerSQL = new SQL() {
				{
					SELECT("CD");
		            FROM("CV_AST_ALL");
		            WHERE("INSTR(ICON, 'folder', 1) > 0 AND IS_DELETE = 'N'");
				}
			}.toString();
			
			innerSQL += " START WITH CD = #{params.ast_prnt_cd} CONNECT BY PRIOR CD = PARENT_CD";
			
			where += " AND AST_PRNT_CD IN ( " + innerSQL + ") ";
			dataMapVO.setParams("ast_prnt_cd", AST_CD);
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
