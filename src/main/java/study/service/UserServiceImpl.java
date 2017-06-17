package study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;
import study.dao.UserDao;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public String User(JSONObject jo) {
		// TODO Auto-generated method stub
		System.out.println(jo);
		userDao.User(jo);
		return null;
	}

}
