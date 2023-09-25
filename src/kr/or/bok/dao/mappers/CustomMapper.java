package kr.or.bok.dao.mappers;

import java.util.List;

import kr.or.bok.ui.data.hr.HumanCountByCompanyVO;

/**
 * 
 *
 * <pre>
 * 	CustomMapper
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 25. 오후 3:50:09
 */
public interface CustomMapper {
	
	public List<HumanCountByCompanyVO> selectHumanCountByCompany();
	
}
