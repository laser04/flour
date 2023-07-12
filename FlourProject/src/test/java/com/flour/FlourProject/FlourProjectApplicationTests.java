package com.flour.FlourProject;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class FlourProjectApplicationTests {
	

    @Autowired
    private SqlSessionTemplate sqlSession;

	@Test
	void contextLoads() {
	}
	
	 @Test   //SqlSessionTemplat잘 생성 됐는지 테스트 
	    public void testSqlSession() throws Exception{
	        System.out.println(sqlSession.toString());
	    }

}
