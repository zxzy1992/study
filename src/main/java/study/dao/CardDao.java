package study.dao;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public interface CardDao {

	JSONArray cardMessage(JSONObject jmsg);

	void insertCard(JSONObject jo);

	JSONObject selectCard(JSONObject jo);

	void updateCard(JSONObject jo);

}
