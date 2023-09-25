package kr.or.bok.ui.data.hr;

import org.json.JSONObject;

import ritus.dao.vos.VOCommon;

/**
 * 
 *
 * <pre>
 * 	업체별 인원수 VO
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 25. 오후 3:44:10
 */
public class HumanCountByCompanyVO extends VOCommon {
	
	private String company_cd;
	private String company;
	private Integer cnt;
	/**
	 * @return company_cd 반환
	 */
	public String getCompany_cd() {
		return company_cd;
	}
	/**
	 * @param company_cd 설정
	 */
	public void setCompany_cd(String company_cd) {
		this.company_cd = company_cd;
	}
	/**
	 * @return company 반환
	 */
	public String getCompany() {
		return company;
	}
	/**
	 * @param company 설정
	 */
	public void setCompany(String company) {
		this.company = company;
	}
	/**
	 * @return cnt 반환
	 */
	public Integer getCnt() {
		return cnt;
	}
	/**
	 * @param cnt 설정
	 */
	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}
	
	/**
	 * <pre>
	 *	1. 개요 : JSONObject 변환
	 *	2. 처리내용 : JSONObject 변환
	 * </pre>
	 *
	 * @return
	 * @author Unipoint 이원혁 차장
	 * @created 2017. 9. 25. 오후 3:45:39
	 */
	@Override
	public JSONObject toJSONObject() {
		JSONObject json = new JSONObject();
		
		json.put("company_cd", this.company_cd);
		json.put("company", this.company);
		json.put("cnt", this.cnt);
		
		return json;
	}

}
