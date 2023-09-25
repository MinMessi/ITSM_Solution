package kr.or.bok.ui.data.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.dao.manager.NamedDataManager;
import ritus.dao.vos.DataMapVO;
import ritus.ui.data.IData;

/**
 * 
 *
 * <pre>
 * 	Dashboard Chart data
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2018. 1. 23. 오전 11:26:05
 */

@Component("data.main.chart")
public class ChartData implements IData {
	
	@Autowired
	private NamedDataManager namedDataManager;

	@Override
	public String invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {
		
		JSONObject root = new JSONObject();
		JSONObject json1 = new JSONObject();
		JSONObject json2 = new JSONObject();
		
		List<DataMapVO> countList = namedDataManager.getData("CV_TROUBLE_COUNT");

		/*
		data:{
	            columns: [
	                ['data1', 3, 0, 1, 9]
	            ],
	            names: {
	            	data1: '건수',
	            },
	            colors:{
	                data1: '#1ab394',
	            },
	            type: 'bar',
	            groups: [
	                ['data1']
	            ]
	        },
	        axis : {
    	    	x : {
    	    		type : 'category',
    	    		categories: ['요청접수', '분석', '조치', '완료']
    	    	},
		*/
		
		JSONArray c1Columns = new JSONArray();
		JSONArray c1Columns_cmplt = new JSONArray();
		JSONArray c1Columns_inbox = new JSONArray();
		JSONArray c1Columns_ing = new JSONArray();
		JSONObject c1Names = new JSONObject();
		JSONArray c1Groups = new JSONArray();
		JSONArray c1Groups_inside = new JSONArray();
		JSONArray c1Categories = new JSONArray();
		
		JSONArray c2Columns = new JSONArray();
		JSONArray c2Columns_inside = new JSONArray();
		JSONObject c2Names = new JSONObject();
		JSONArray c2Groups = new JSONArray();
		JSONArray c2Groups_inside = new JSONArray();
		JSONArray c2Categories = new JSONArray();
		
		c1Columns_cmplt.put("cmplt");
		c1Columns_inbox.put("inbox");
		c1Columns_ing.put("ing");
		
		c1Names.put("cmplt", "처리완료");
		c1Names.put("inbox", "접수");
		c1Names.put("ing", "처리중");
		
		c1Groups_inside.put("cmplt");
		c1Groups_inside.put("inbox");
		c1Groups_inside.put("ing");
		
		c2Categories.put("접수");
		c2Categories.put("처리중");
		c2Categories.put("처리완료");
		
		Integer sumCmplt = 0, sumInbox = 0, sumIng = 0;
		for ( DataMapVO vo : countList ) {
			String vle = vo.getStringData("VLE");
			Integer cmplt = vo.getIntegerData("CMPLT");
			Integer inbox = vo.getIntegerData("INBOX");
			Integer ing = vo.getIntegerData("ING");
			
			c1Columns_cmplt.put(cmplt);
			c1Columns_inbox.put(inbox);
			c1Columns_ing.put(ing);
			
			c1Categories.put(vle);
			
			sumCmplt += cmplt;
			sumInbox += inbox;
			sumIng += ing;
		}
		
		c2Columns_inside.put("data1");
		c2Columns_inside.put(sumInbox);
		c2Columns_inside.put(sumIng);
		c2Columns_inside.put(sumCmplt);
		c2Columns.put(c2Columns_inside);
		
		c2Names.put("data1", "건수");
		
		c2Groups_inside.put("data1");
		c2Groups.put(c2Groups_inside);
		
		c1Columns.put(c1Columns_cmplt);
		c1Columns.put(c1Columns_inbox);
		c1Columns.put(c1Columns_ing);
		c1Groups.put(c1Groups_inside);
		
		json1.put("columns", c1Columns);
		json1.put("names", c1Names);
		json1.put("groups", c1Groups);
		json1.put("categories", c1Categories);
		
		json2.put("columns", c2Columns);
		json2.put("names", c2Names);
		json2.put("groups", c2Groups);
		json2.put("categories", c2Categories);
		
		root.put("chart1", json1);
		root.put("chart2", json2);
		
		return root.toString();
	}

}
