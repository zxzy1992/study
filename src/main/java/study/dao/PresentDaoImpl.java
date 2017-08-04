package study.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Repository
public class PresentDaoImpl implements PresentDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public JSONArray presentMessage(JSONObject msg) {
		// TODO Auto-generated method stub
		JSONArray jo = JSONArray.fromObject(sqlSessionTemplate.selectList("PresentMessage.select", msg));
		return jo;
	}
	@Override
	public JSONArray presentDrop() {
		// TODO Auto-generated method stub
		JSONArray jo = JSONArray.fromObject(sqlSessionTemplate.selectList("PresentMessage.selectDrop"));
		return jo;
	}
	@Override
	public String selectPresent(String s) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("PresentMessage.selectByPname",s);
	}
	@Override
	public void insertPresent(JSONObject jo) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("PresentMessage.insert", jo);
	}
	@Override
	public void deletePresent(JSONObject jo) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("PresentMessage.delete", jo);
	}
	@Override
	public void updatePresent(JSONObject jo) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("PresentMessage.update", jo);
	}
	@Override
	public JSONObject selectPresent(JSONObject jo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("PresentMessage.selectMessage", jo);
	}
	@Override
	public JSONObject selectPresentByPname(JSONObject jo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("PresentMessage.selectMessageByPname", jo);
	}
	@Override
	public void updatePresentByPname(JSONObject pnum) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("PresentMessage.updateMessageByPname", pnum);
	}

}
