package study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import study.dao.CardDao;
import study.dao.PresentDao;
@Service
public class CardServiceImpl implements CardService {
	
	@Autowired
	private CardDao cardDao;
	@Autowired
	private PresentDao presentDao;
	
	@Override
	public JSONArray cardMessage(String msg) {
		// TODO Auto-generated method stub
		JSONObject jmsg = JSONObject.fromObject(msg);
		JSONArray card = cardDao.cardMessage(jmsg);
		String res = "";
		
		for(int i = 0; i < card.size(); i++){
			JSONObject jo = (JSONObject)card.get(i);
			if(jo.get("bz").equals("无")==false){
				String[] s = jo.get("bz").toString().split(",");
				for(int j = 0; j < s.length; j++){
					int count = Integer.parseInt(s[j].substring(5, 7));
					res += presentDao.selectPresent(s[j].substring(0, 5))+count+"个（套）"+",";		
				}				
				jo.remove("bz");
				jo.put("bz", res.substring(0, res.length()-1));
				res ="";
			}
		}	
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
		joc.put("bz", "无");
		if(info.getInt("co") == 1){
			Integer star = joc.getInt("star_num") - 10; 
			Integer moon = joc.getInt("moon_num") + 1;
			joc.replace("star_num", star);
			joc.replace("moon_num", moon);
			cardDao.updateCard(joc);
		}else if(info.getInt("co") == 2){
			Integer sun = joc.getInt("sun_num") + 1; 
			Integer moon = joc.getInt("moon_num") - 4;
			joc.replace("sun_num", sun);
			joc.replace("moon_num", moon);
			cardDao.updateCard(joc);
		}
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public void exchange(JSONObject jo) {
		// TODO Auto-generated method stub
		Integer numByPname;
		String ress = "";																			
		String kind = jo.getString("pname").substring(0,1);	//取pname代码第1位，即表示兑换卡的类型
		String num = jo.getString("pname").substring(1,3);	//取pname代码第2、3位，即表示兑换卡的数量
		JSONObject joc = cardDao.selectCard(jo);			//通过前台传来的pname，进入后台数据查询对应的cname
		String liwu = joc.getString("bz");
		
		if(liwu.equals("无")){
			joc.remove("bz");
			joc.put("bz", jo.getString("pname") + "01");
			if(kind.equals("2")){
				int moon = Integer.parseInt(num);
				joc.replace("moon_num", (joc.getInt("moon_num")- moon));
			}else if(kind.equals("3")){
				int sun = Integer.parseInt(num);
				joc.replace("sun_num", (joc.getInt("sun_num")- sun));
			}
			cardDao.updateCard(joc);
			JSONObject pnum = presentDao.selectPresentByPname(jo);
			numByPname = pnum.getInt("num") - 1;
			pnum.remove("num");
			pnum.put("num", numByPname);
			presentDao.updatePresentByPname(pnum);
		}else if(liwu.contains(",") == false){
			if(liwu.substring(0, 5).equals(jo.getString("pname"))){
				int temp = Integer.parseInt(liwu);
				joc.remove("bz");
				joc.put("bz", (temp+1));
				if(kind.equals("2")){
					int moon = Integer.parseInt(num);
					joc.replace("moon_num", (joc.getInt("moon_num")- moon));
				}else if(kind.equals("3")){
					int sun = Integer.parseInt(num);
					joc.replace("sun_num", (joc.getInt("sun_num")- sun));
				}
			}else{
				String s = liwu;
				s = s + ","+ jo.getString("pname")+"01";		//出现第二个新的礼物时，把原来的和后来的礼物用逗号隔开放在一个字符串里放进数据库
				joc.remove("bz");
				joc.put("bz", s);
				if(kind.equals("2")){
					int moon = Integer.parseInt(num);
					joc.replace("moon_num", (joc.getInt("moon_num")- moon));
				}else if(kind.equals("3")){
					int sun = Integer.parseInt(num);
					joc.replace("sun_num", (joc.getInt("sun_num")- sun));
				}
			}
			cardDao.updateCard(joc);
			JSONObject pnum = presentDao.selectPresentByPname(jo);
			numByPname = pnum.getInt("num") - 1;
			pnum.remove("num");
			pnum.put("num", numByPname);
			presentDao.updatePresentByPname(pnum);
		}else if(liwu.contains(",") == true){
			String[] res = liwu.split(",");
			for(int i = 0;i < res.length; i++){
				if(res[i].substring(0, 5).equals(jo.getString("pname"))){
					int temp = Integer.parseInt(res[i]);
					temp+=1;
					res[i] = String.valueOf(temp);
					if(kind.equals("2")){
						int moon = Integer.parseInt(num);
						joc.replace("moon_num", (joc.getInt("moon_num")- moon));
					}else if(kind.equals("3")){
						int sun = Integer.parseInt(num);
						joc.replace("sun_num", (joc.getInt("sun_num")- sun));
					}
				}
			}
			
			for(int j = 0; j < res.length; j++){
				ress += res[j]+",";
			}
			if(ress.substring(0, ress.length()-1).equals(liwu)){
				liwu+=","+jo.getString("pname")+"01";
				if(kind.equals("2")){
					int moon = Integer.parseInt(num);
					joc.replace("moon_num", (joc.getInt("moon_num")- moon));
				}else if(kind.equals("3")){
					int sun = Integer.parseInt(num);
					joc.replace("sun_num", (joc.getInt("sun_num")- sun));
				}
				joc.remove("bz");
				joc.put("bz", liwu);
			}else{
				joc.remove("bz");
				joc.put("bz", ress.substring(0,ress.length()-1));
			}
			cardDao.updateCard(joc);
			JSONObject pnum = presentDao.selectPresentByPname(jo);
			numByPname = pnum.getInt("num") - 1;
			pnum.remove("num");
			pnum.put("num", numByPname);
			presentDao.updatePresentByPname(pnum);
		}
		
	}

}
