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
	public void User(JSONObject jo) {
		System.out.println(jo);
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("study.dao.insert", jo);
		
	}

}
