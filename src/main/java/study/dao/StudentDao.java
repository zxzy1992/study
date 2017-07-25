package study.dao;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public interface StudentDao {
	
	public JSONArray stuMessage(JSONObject jmsg);

	public void insertMessage(JSONObject jo);

	public void deleteMessage(JSONObject jo);

	public JSONObject selectMessage(JSONObject jo);

	public void updateMessage(JSONObject jo);

}
