package kr.or.bok.dao.services;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.bok.dao.mappers.TestMapper;
import ritus.dao.vos.CategoryPrefixVO;

@Repository
public class TestService implements TestMapper {

	@Autowired
	private SqlSession sqlSession;

	private TestMapper getMapper() {
		return sqlSession.getMapper(TestMapper.class);
	}
	
	@Override
	public List<CategoryPrefixVO> selectTest() {
		return getMapper().selectTest();
	}

}
