package study.service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public interface CardService {

	JSONArray cardMessage(String msg);

	void cardPlus(String info);

	void cardPlus2(String info);

	JSONObject selectCard(String info);

	void updateCard(String info);

	void changeMoonCard(JSONObject info);

	void exchange(JSONObject jo);

}
