package kr.or.bok.ui.portlet;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.ui.page.IPage;

@Component("portlet.todo")
public class TodoPage implements IPage {

	@Override
	public ModelAndView invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		// TODO Auto-generated method stub
		return result;
	}

}
