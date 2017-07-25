package study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import study.dao.StudentDao;

@Service
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentDao studentDao;
	@Override
	public JSONArray stuMessage(String msg) {
		// TODO Auto-generated method stub
		JSONObject jmsg = JSONObject.fromObject(msg);
		JSONArray ja = JSONArray.fromObject(studentDao.stuMessage(jmsg));
		
		for(int i = 0; i < ja.size(); i++){
			JSONObject jo = (JSONObject)ja.get(i);
			String bj = jo.getString("grade")+"年"+jo.getString("classId")+"班";
			jo.remove("grade");
			jo.remove("classId");
			jo.accumulate("classId", bj);	
	
			if(jo.get("sex").toString().equals("1")){
				jo.remove("sex");
				jo.put("sex", "男");
			}else{
				jo.remove("sex");
				jo.put("sex", "女");
			}
			
		
		}	
		return  ja;
	}
	
	@Override
	public void InsertMessage(String info) {
		// TODO Auto-generated method stub
		
		JSONObject jo = JSONObject.fromObject(info);
		String joindate = jo.get("joindate").toString().substring(0, 10);
		jo.remove("joindate");
		jo.put("joindate", joindate);
		jo.put("sname", jo.get("sname"));
		jo.put("star_num", "0");
		jo.put("moon_num", "0");
		jo.put("sun_num", "0");
		jo.put("supersun_num", "0");
		studentDao.insertMessage(jo);
	}

	@Override
	public void deleteMessage(String info) {
		// TODO Auto-generated method stub
		JSONObject jo = JSONObject.fromObject(info);
		studentDao.deleteMessage(jo);
	}

	@Override
	public JSONObject selectMessage(String info) {
		// TODO Auto-generated method stub
		JSONObject jo = JSONObject.fromObject(info);
		JSONObject stjo = studentDao.selectMessage(jo);
		return stjo;
	}

	@Override
	public void updateMessage(String info) {
		// TODO Auto-generated method stub
		JSONObject jo = JSONObject.fromObject(info);
		String joindate = jo.get("joindate").toString().substring(0, 10);
		jo.remove("joindate");
		jo.put("joindate", joindate);
		studentDao.updateMessage(jo);	
	}
}
