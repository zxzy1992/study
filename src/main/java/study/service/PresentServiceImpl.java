package study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import study.dao.PresentDao;

@Service
public class PresentServiceImpl implements PresentService {
	
	@Autowired
	private PresentDao presentDao;

	@Override
	public JSONArray presentMessage(String msg) {
		// TODO Auto-generated method stub
		JSONObject jo = JSONObject.fromObject(msg);
		JSONArray ja = JSONArray.fromObject(presentDao.presentMessage(jo));
		return ja;
	}

	@Override
	public JSONArray presentDrop() {
		// TODO Auto-generated method stub
		return presentDao.presentDrop();
	}

	@Override
	public void insertPresent(String info) {
		// TODO Auto-generated method stub
		JSONObject jo = JSONObject.fromObject(info);
		presentDao.insertPresent(jo);
	}

	@Override
	public void deletePresent(String info) {
		// TODO Auto-generated method stub
		JSONObject jo = JSONObject.fromObject(info);
		presentDao.deletePresent(jo);
	}

	@Override
	public void updatePresent(String info) {
		// TODO Auto-generated method stub
		JSONObject jo = JSONObject.fromObject(info);
		presentDao.updatePresent(jo);
	}

	@Override
	public JSONObject selectPresent(String info) {
		// TODO Auto-generated method stub
		JSONObject jo = JSONObject.fromObject(info);
		return presentDao.selectPresent(jo);
	}
}
