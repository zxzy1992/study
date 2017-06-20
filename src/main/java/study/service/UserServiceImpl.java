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
	public String login(JSONObject jo) {
		// TODO Auto-generated method stub
		JSONObject userMessage = userDao.login();
		boolean isUsername = (userMessage.getString("username").equals(jo.getString("username")));
		boolean isPassword = (userMessage.getString("password").equals(jo.getString("password")));
		boolean isType = (userMessage.getString("logintype").equals(jo.getString("logintype")));
		
		if(isUsername==true){
			if(isPassword==true){
				if(isType==true){
					return "yes";
				}else{
					return "NotType";
				}		
			}else{
				return "NotPassword";
			}
			
		}else{
			return "NotUsername";
		}
		
	
	}

}
