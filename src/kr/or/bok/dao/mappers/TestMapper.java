package kr.or.bok.dao.mappers;

import java.util.List;

import ritus.dao.vos.CategoryPrefixVO;

/**
 * 
 *
 * <pre>
 * 	TestMapper
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 8. 22. 오전 10:22:00
 */
public interface TestMapper {
	
	public List<CategoryPrefixVO> selectTest();
	
}
