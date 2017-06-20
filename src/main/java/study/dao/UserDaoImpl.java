package study.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.sf.json.JSONObject;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public JSONObject login() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("User.select");
	}

}
