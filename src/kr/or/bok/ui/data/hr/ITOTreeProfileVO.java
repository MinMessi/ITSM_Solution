package kr.or.bok.ui.data.hr;

import org.json.JSONObject;

/**
 * 
 *
 * <pre>
 * 	Tree용 ITO 정보
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 12. 18. 오전 10:48:46
 */
public class ITOTreeProfileVO {

	private Integer lvl;
	private Integer isleaf;
	private String code_prnt_cd;
	private String code_cd;
	private String ito_name;
	private String v_ito_ps;
	private String v_ito_type;
	
	
	/**
	 * @return lvl 반환
	 */
	public Integer getLvl() {
		return lvl;
	}
	/**
	 * @param lvl 설정
	 */
	public void setLvl(Integer lvl) {
		this.lvl = lvl;
	}
	/**
	 * @return isleaf 반환
	 */
	public Integer getIsleaf() {
		return isleaf;
	}
	/**
	 * @param isleaf 설정
	 */
	public void setIsleaf(Integer isleaf) {
		this.isleaf = isleaf;
	}
	/**
	 * @return code_prnt_cd 반환
	 */
	public String getCode_prnt_cd() {
		return code_prnt_cd;
	}
	/**
	 * @param code_prnt_cd 설정
	 */
	public void setCode_prnt_cd(String code_prnt_cd) {
		this.code_prnt_cd = code_prnt_cd;
	}
	/**
	 * @return code_cd 반환
	 */
	public String getCode_cd() {
		return code_cd;
	}
	/**
	 * @param code_cd 설정
	 */
	public void setCode_cd(String code_cd) {
		this.code_cd = code_cd;
	}
	/**
	 * @return ito_name 반환
	 */
	public String getIto_name() {
		return ito_name;
	}
	/**
	 * @param ito_name 설정
	 */
	public void setIto_name(String ito_name) {
		this.ito_name = ito_name;
	}
	/**
	 * @return v_ito_ps 반환
	 */
	public String getV_ito_ps() {
		return v_ito_ps;
	}
	/**
	 * @param v_ito_ps 설정
	 */
	public void setV_ito_ps(String v_ito_ps) {
		this.v_ito_ps = v_ito_ps;
	}
	/**
	 * @return v_ito_type 반환
	 */
	public String getV_ito_type() {
		return v_ito_type;
	}
	/**
	 * @param v_ito_type 설정
	 */
	public void setV_ito_type(String v_ito_type) {
		this.v_ito_type = v_ito_type;
	}
	
	/**
	 * to json object
	 * @return
	 */
	public JSONObject toJSONObject() {
		JSONObject json = new JSONObject();
		json.put("id", this.code_cd);
		json.put("text", this.ito_name);

		JSONObject state = new JSONObject();
		state.put("opened", true);

		json.put("state", state);
		json.put("parent", this.code_prnt_cd == null? "#":this.code_prnt_cd);
		
		if ( this.isleaf == 1 ) json.put("icon", "fa fa_user");
		else json.put("icon", "fa fa_folder");
		
		JSONObject metadata = new JSONObject();
		metadata.put("v_ito_ps", this.v_ito_ps);
		metadata.put("v_ito_type", this.v_ito_type);

		json.put("metaData", metadata);
		return json;
	}
	
}
