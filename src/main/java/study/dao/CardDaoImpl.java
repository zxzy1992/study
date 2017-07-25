package study.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Repository
public class CardDaoImpl implements CardDao{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public JSONArray cardMessage(JSONObject jmsg) {
		// TODO Auto-generated method stub
		JSONArray jo = JSONArray.fromObject(sqlSessionTemplate.selectList("CardMessage.select", jmsg));
		return jo;
	}
	@Override
	public void insertCard(JSONObject jo) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("CardMessage.insert", jo);
	}
	@Override
	public JSONObject selectCard(JSONObject jo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("CardMessage.selectCard", jo);
	}
	@Override
	public void updateCard(JSONObject jo) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("CardMessage.updateCard", jo);
	}
	

}
