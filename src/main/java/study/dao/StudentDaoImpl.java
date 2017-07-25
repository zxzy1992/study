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
	public JSONArray stuMessage(JSONObject jmsg) {
		// TODO Auto-generated method stub
		JSONArray jo = JSONArray.fromObject(sqlSessionTemplate.selectList("StudentMessage.select", jmsg));
		return jo;
	}

	@Override
	public void insertMessage(JSONObject jo) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("StudentMessage.insert", jo);
	}

	@Override
	public void deleteMessage(JSONObject jo) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("StudentMessage.delete", jo);
	}

	@Override
	public JSONObject selectMessage(JSONObject jo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("StudentMessage.selectOne", jo);
	}

	@Override
	public void updateMessage(JSONObject info) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("StudentMessage.update", info);
	}
}
