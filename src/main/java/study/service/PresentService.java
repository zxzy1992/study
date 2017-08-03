package study.service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public interface PresentService {

	JSONArray presentMessage(String msg);

	JSONArray presentDrop();

	void insertPresent(String info);

	void deletePresent(String info);

	void updatePresent(String info);

	JSONObject selectPresent(String info);

}
