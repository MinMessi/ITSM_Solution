package kr.or.bok.ui.data.hr;

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

@Component("data.work.itotree")
public class ITOTreeData implements IData {
	
	@Autowired
	private NamedDataManager dataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		List<DataMapVO> resideList = dataManager.getData("CV_ITO_PROFILE_RESIDE");
		
		JSONArray array = new JSONArray();
		if ( resideList != null && resideList.size() > 0 ) {
			for ( DataMapVO vo : resideList ) {
				CustomTreeVO treeDataVO = new CustomTreeVO();
				treeDataVO.setCd(vo.getStringData("CODE_CD"));
				treeDataVO.setParent_cd(vo.getStringData("CODE_PRNT_CD"));
				treeDataVO.setValue(vo.getStringData("ITO_NAME"));
				treeDataVO.setLevel(vo.getIntegerData("LVL"));
				treeDataVO.setIsleaf(vo.getIntegerData("ISLEAF"));
				
				Integer isleaf = vo.getIntegerData("ISLEAF");
				if ( isleaf == 1 ) treeDataVO.setIcon("fa-user");
				else treeDataVO.setIcon("fa-folder");
				
				treeDataVO.setMetaData("V_ITO_PS", vo.getStringData("V_ITO_PS"));
				treeDataVO.setMetaData("V_ITO_TYPE", vo.getStringData("V_ITO_TYPE"));
				
				array.put(treeDataVO.toJSONObject());
			}
		}
		
		return array.toString();
	}

}
