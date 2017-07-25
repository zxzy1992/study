package study.service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public interface StudentService {
	
	public JSONArray stuMessage(String msg);

	public void InsertMessage(String info);

	public void deleteMessage(String info);

	public JSONObject selectMessage(String info);

	public void updateMessage(String info);
}
