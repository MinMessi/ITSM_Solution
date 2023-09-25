package kr.or.bok.ui.data.asset;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import ritus.dao.manager.DataManager;
import ritus.ui.data.IData;
import ritus.ui.utils.ReturnMessage;
import ritus.utils.StringUtil;

/**
 *
 * <pre>
 * 엑셀 데이터 저장
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0
 *
 */
@Component("data.asset.assetexcelsave")
public class AssetExcelSaveData implements IData {

	@Autowired
	private DataManager dataManager;

	@Autowired
	private PlatformTransactionManager txManager;

	/**
	 *
	 * <pre>
	 * 1. 개요 : 데이터 처리
	 * 2. 처리내용 : 데이터 처리
	 * </pre>
	 *
	 * @param parameters
	 * @param request
	 * @param response
	 * @param result
	 * @return
	 */
	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		ReturnMessage rm = new ReturnMessage(true, "");

		String jsonString = StringUtil.getData(parameters.get("data"), null);
		if ( jsonString == null ) {
			rm.set(false, "저장할 데이터가 없습니다.");
			return rm.toJSONString();
		}

		JSONArray jsonArray = new JSONArray(jsonString);

		for ( int i=0; i<jsonArray.length(); i++ ) {
			JSONObject _json = jsonArray.getJSONObject(i);

			//transaction start
			DefaultTransactionDefinition def = new DefaultTransactionDefinition();
			def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

			TransactionStatus status = txManager.getTransaction(def);
			try {
				Map<String, String> param = new HashMap<>();
				param.put("category_id", "AST00001");

				Iterator<String> keys = _json.keys();
				while( keys.hasNext() ) {
					String key = keys.next();
					String _value = _json.getString(key);
					param.put(key, _value);
				}

				dataManager.createData(param);
				txManager.commit(status);
			} catch(Exception e) {
				txManager.rollback(status);
				e.printStackTrace();
			}
		}
		
		return rm.toJSONString();
	}

}
