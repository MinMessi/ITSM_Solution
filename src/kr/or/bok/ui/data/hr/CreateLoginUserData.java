package kr.or.bok.ui.data.hr;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.dao.manager.MessageManager;
import ritus.dao.services.LoginUserService;
import ritus.dao.vos.LoginUserVO;
import ritus.ui.data.IData;
import ritus.ui.data.prv.CreatePageData;
import ritus.ui.utils.ReturnMessage;
import ritus.utils.LogUtil;
import ritus.utils.SecureUtil;
import ritus.utils.StringUtil;

/**
 * 
 *
 * <pre>
 * 	관리 페이지 - 로그인 사용자 생성
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 8. 21. 오후 2:04:15
 */
@Component("data.hr.createloginuser")
public class CreateLoginUserData implements IData {
	
	@Autowired
	private LoginUserService userService;
	
	@Autowired
	private MessageManager messageSource;
	
	private static final Logger logger = LoggerFactory.getLogger(CreatePageData.class);

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		ReturnMessage rm = new ReturnMessage(true, "");
		
		String user_id = StringUtil.getData(parameters.get("user_id"), null);
		String user_name = StringUtil.getData(parameters.get("user_name"), null);
		String user_pwd = StringUtil.getData(parameters.get("user_pwd"), user_id);
		String user_type = StringUtil.getData(parameters.get("user_type"), "CDE00018001");
		String isadmin = StringUtil.getData(parameters.get("isadmin"), "N");
		
		if ( StringUtil.isNull(user_id, user_name, user_pwd, isadmin) )
			return rm.setError(messageSource.getMessage("ui.common.check.fail", null, null)).toJSONString();
		
		LoginUserVO user = new LoginUserVO();
		user.setUser_id(user_id);
		user.setUser_name(user_name);
		user.setUser_pwd(SecureUtil.shaEncrypt(user_pwd));
		user.setUser_type(user_type);
		user.setIsadmin(isadmin);
		user.setDepts("*");
		user.setAuth("*");
		
		try {
			userService.insertUser(user);
		} catch(SQLException e) {
			e.printStackTrace();
			LogUtil.printErrorBanner(logger, e.getMessage());
			rm.set(false, messageSource.getMessage("ui.common.error", null, null));
		}
		
		return rm.toJSONString();
	}

}
