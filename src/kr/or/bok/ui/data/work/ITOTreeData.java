package kr.or.bok.ui.data.work;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.dao.manager.NamedDataManager;
import ritus.dao.vos.CustomTreeVO;
import ritus.dao.vos.DataMapVO;
import ritus.ui.data.IData;

/**
 * 
 *
 * <pre>
 * 	인력 데이터 - Tree
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 25. 오후 1:57:49
 */

@Component("data.hr.itotree")
public class ITOTreeData implements IData {
	
	@Autowired
	private NamedDataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		// 각각 상주와 비상주를 저장하는 view 이름
		List<DataMapVO> resideList = dataManager.getData("CV_ITO_PROFILE_RESIDE");	// 상주인원
		List<DataMapVO> noResideList = dataManager.getData("CV_ITO_PROFILE_NORESIDE");	// 비상주 인원
		
		JSONArray array = new JSONArray();
		if ( resideList != null && resideList.size() > 0 ) {
			for ( DataMapVO vo : resideList ) {
				CustomTreeVO treeDataVO = new CustomTreeVO();
				treeDataVO.setCd(vo.getStringData("CODE_CD"));
				treeDataVO.setParent_cd(vo.getStringData("CODE_PRNT_CD"));
				treeDataVO.setValue(vo.getStringData("ITO_NAME"));
				treeDataVO.setLevel(vo.getIntegerData("LVL"));
				treeDataVO.setIsleaf(vo.getIntegerData("ISLEAF"));
				
				Integer isleaf = vo.getIntegerData("ISLEAF"); // 최상위는 0, 그밑에 1....
				if ( isleaf == 1 ) treeDataVO.setIcon("fa-user");
				else treeDataVO.setIcon("fa-folder");
				
				treeDataVO.setMetaData("V_ITO_PS", vo.getStringData("V_ITO_PS"));	// 정,부 맵에 담는다.
				treeDataVO.setMetaData("V_ITO_TYPE", vo.getStringData("V_ITO_TYPE"));	// 상주냐 아니냐 차이 맵에 담는다.
				
				array.put(treeDataVO.toJSONObject());
			}
		}
		
		if ( noResideList != null && noResideList.size() > 0 ) {
			for ( DataMapVO vo : noResideList ) {
				String v_ito_ps = vo.getStringData("V_ITO_PS");
				String ito_name = vo.getStringData("ITO_NAME");
				String v_ito_type = vo.getStringData("V_ITO_TYPE");
				if ( v_ito_ps != null ) {
					ito_name += "(" + v_ito_ps + ")";
					if ( v_ito_type != null ) 
						ito_name += " - " + v_ito_type; 
				}
				
				CustomTreeVO treeDataVO = new CustomTreeVO();
				treeDataVO.setCd(vo.getStringData("CODE_CD"));
				treeDataVO.setParent_cd(vo.getStringData("CODE_PRNT_CD"));
				treeDataVO.setValue(ito_name);
				treeDataVO.setLevel(vo.getIntegerData("LVL"));
				treeDataVO.setIsleaf(vo.getIntegerData("ISLEAF"));
				
				if ( v_ito_ps != null ) treeDataVO.setIcon("fa-user");
				else treeDataVO.setIcon("fa-folder");
				
				treeDataVO.setMetaData("V_ITO_PS", v_ito_ps);
				treeDataVO.setMetaData("V_ITO_TYPE", v_ito_type);
				
				array.put(treeDataVO.toJSONObject());
			}
		}
		
		return array.toString();
	}

}
