package study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import study.dao.CardDao;
@Service
public class CardServiceImpl implements CardService {
	
	@Autowired
	private CardDao cardDao;
	@Override
	public JSONArray cardMessage(String msg) {
		// TODO Auto-generated method stub
		JSONObject jmsg = JSONObject.fromObject(msg);
		JSONArray card = cardDao.cardMessage(jmsg);
		
		return card;
	}
	@SuppressWarnings("unchecked")
	@Override
	public void cardPlus(String info) {
		// TODO Auto-generated method stub
		JSONObject jo = JSONObject.fromObject(info);
		Integer starNum = jo.getInt("star_num");
		jo.replace("star_num", (starNum+1));
		cardDao.insertCard(jo);
	}
	@SuppressWarnings("unchecked")
	@Override
	public void cardPlus2(String info) {
		// TODO Auto-generated method stub
		JSONObject jo = JSONObject.fromObject(info);
		Integer starNum = jo.getInt("star_num");
		jo.replace("star_num", (starNum+2));
		cardDao.insertCard(jo);
	}
	@Override
	public JSONObject selectCard(String info) {
		// TODO Auto-generated method stub
		JSONObject jo = JSONObject.fromObject(info);
		System.out.println(jo);
		return cardDao.selectCard(jo);
	}
	@Override
	public void updateCard(String info) {
		// TODO Auto-generated method stub
		JSONObject jo = JSONObject.fromObject(info);
		cardDao.updateCard(jo);
	}
	@SuppressWarnings("unchecked")
	@Override
	public void changeMoonCard(JSONObject info) {
		// TODO Auto-generated method stub
		
		JSONObject joc = cardDao.selectCard(info);
		if(joc.getInt("bz") == 1){
			Integer star = joc.getInt("star_num") - 10; 
			Integer moon = joc.getInt("moon_num") + 1;
			joc.replace("star_num", star);
			joc.replace("moon_num", moon);
			cardDao.updateCard(joc);
		}else if(joc.getInt("bz") == 2){
			Integer sun = joc.getInt("sun_num") + 1; 
			Integer moon = joc.getInt("moon_num") - 4;
			joc.replace("sun_num", sun);
			joc.replace("moon_num", moon);
			cardDao.updateCard(joc);
		}else if(joc.getInt("bz") == 3){
			Integer sun = joc.getInt("sun_num") - 10; 
			Integer supersun  = joc.getInt("supersun_num") + 1;
			joc.replace("star_num", sun);
			joc.replace("supersun_num", supersun);
			cardDao.updateCard(joc);
		}
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public void exchange(JSONObject jo) {
		// TODO Auto-generated method stub
		JSONObject joc = cardDao.selectCard(jo);
		Integer star = joc.getInt("star_num") - jo.getInt("star");
		Integer moon = joc.getInt("moon_num") - jo.getInt("moon");
		Integer sun = joc.getInt("sun_num") - jo.getInt("sun");
		Integer supersun = joc.getInt("supersun_num") - jo.getInt("supersun");
		
		joc.replace("star_num", star);
		joc.replace("moon_num", moon);
		joc.replace("sun_num", sun);
		joc.replace("supersun_num", supersun);
		cardDao.updateCard(joc);
	}

}
