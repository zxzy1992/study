package study.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Repository
public class StudentDaoImpl implements StudentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public JSONArray stuMessage() {
		// TODO Auto-generated method stub
		JSONArray jo = JSONArray.fromObject(sqlSessionTemplate.selectList("StudentMessage.select"));
		System.out.println(jo);
		return jo;
	}

	@Override
	public JSONArray subjectMessage() {
		// TODO Auto-generated method stub
		JSONArray jo = JSONArray.fromObject( sqlSessionTemplate.selectList("StudentMessage.selectSubject"));
		return jo;
	}

	

}
