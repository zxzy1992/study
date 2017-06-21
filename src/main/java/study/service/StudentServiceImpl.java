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
	public JSONArray stuMessage() {
		// TODO Auto-generated method stub
		JSONArray stja = studentDao.subjectMessage();
		
		JSONArray ja = JSONArray.fromObject(studentDao.stuMessage());
		
		
		for(int i = 0; i < ja.size(); i++){
			JSONObject jo = (JSONObject)ja.get(i);
			String bj = jo.getString("grade")+"年"+jo.getString("classId")+"班";
			jo.remove("grade");
			jo.remove("classId");
			jo.accumulate("classId", bj);
			for(int j = 0; j < stja.size();j++){
				JSONObject stjo = (JSONObject)stja.get(j);
				if(jo.get("subjectId").equals(stjo.get("subjectId"))){
					jo.remove("subjectId");
					jo.put("subjectId", stjo.get("name"));
				}
			}
			
			if(jo.get("sex").toString().equals("1")){
				jo.remove("sex");
				jo.put("sex", "男");
			}else{
				jo.remove("sex");
				jo.put("sex", "女");
			}
			
		}
		
		System.out.println(ja );
		
		
		
		return  ja;
	}

}
