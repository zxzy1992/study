package study.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;
import study.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	public UserService userService;
	
	@Autowired
    private HttpSession session;
	
	/**
	 * 登录
	 * @param info
	 * @return 如果正确返回的跳转下一页面的jsp，错误则返回错误信息
	 */
	
	@RequestMapping(value="/study/user", method=RequestMethod.GET)
	public @ResponseBody String user(@RequestParam("info") String info){
		JSONObject jo = JSONObject.fromObject(info);
		//userService.User(jo);
	
		if(userService.login(jo).equals("NotUsername")){
			return "notUsername";
		}else if(userService.login(jo).equals("NotPassword")){
			return "notPassword";
		}else if(userService.login(jo).equals("NotType")){
			return "notType";
		}else{
			session.setAttribute("isLogin", true);
			return "yes";
		}
		
		
	}
	
	@RequestMapping(value="/{jspName}", method = RequestMethod.GET)
    public String display(@PathVariable("jspName") String jspName){
        //这最好是判断一下 如果登录成功了 就记录一个成功标识！ 要不人家不guan登录没登录 都能进后面的页面
        //如果session.getAttribute("isLogin") ==  "true"
		String rt = null;
		//true or false  true rt=main false rt = unlogin
		if ( (boolean) session.getAttribute("isLogin") ) {
			rt = jspName;
		} else {
			rt = "unLogin";
		}
        return rt;
    }
	
	@RequestMapping(value="/exit", method = RequestMethod.GET)
    public @ResponseBody String exit(@RequestParam("info") String info){
		session.setAttribute("isLogin", false);
		return "no";     
    }
}
