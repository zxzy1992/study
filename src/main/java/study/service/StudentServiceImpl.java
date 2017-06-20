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
		System.out.println( studentDao.stuMessage());
		return  studentDao.stuMessage();
	}

}
