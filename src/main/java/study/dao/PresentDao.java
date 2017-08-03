package study.dao;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public interface PresentDao {

	public JSONArray presentMessage(JSONObject jo);

	public JSONArray presentDrop();

	public String selectPresent(String s);

	public void insertPresent(JSONObject jo);

	public void deletePresent(JSONObject jo);

	public void updatePresent(JSONObject jo);

	public JSONObject selectPresent(JSONObject jo);

}
