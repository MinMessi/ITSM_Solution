package kr.or.bok.dao.services;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.bok.dao.mappers.CustomMapper;
import kr.or.bok.ui.data.hr.HumanCountByCompanyVO;

/**
 * 
 *
 * <pre>
 * 	Custom DAO Service
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0 
 * @created 2017. 9. 25. 오후 3:53:39
 */

@Repository
public class CustomService implements CustomMapper {
	
	@Autowired
	private SqlSession sqlSession;

	private CustomMapper getMapper() {
		return sqlSession.getMapper(CustomMapper.class);
	}

	@Override
	public List<HumanCountByCompanyVO> selectHumanCountByCompany() {
		return getMapper().selectHumanCountByCompany();
	}

}
