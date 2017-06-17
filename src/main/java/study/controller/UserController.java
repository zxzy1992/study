package study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@RequestMapping(value="/study/user", method=RequestMethod.GET)
	public @ResponseBody String user(@RequestParam("info") String info){
		JSONObject jo = JSONObject.fromObject(info);
		userService.User(jo);
		return jo.toString();
	}
}
