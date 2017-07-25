package study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import study.service.StudentService;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	/**
	 * 显示学生信息
	 * @param id
	 * @return 查询后的学生信息
	 */
	@RequestMapping(value="/student", method = RequestMethod.POST)
	public @ResponseBody JSONArray stuMessage(@RequestBody String msg){	
		return studentService.stuMessage(msg);
	}
	/**
	 * 添加学生信息
	 * @param msg
	 * @return
	 */
	@RequestMapping(value="/insertMessage", method = RequestMethod.POST)
	public @ResponseBody String InsertMessage(@RequestParam("info") String info){
		studentService.InsertMessage(info);
		return "yes";
	}
	/**
	 * 
	 * 删除学生信息
	 * @param info
	 * @return
	 */
	@RequestMapping(value="/deleteMessage", method = RequestMethod.POST)
	public @ResponseBody String deleteMessage(@RequestParam("info") String info){
		studentService.deleteMessage(info);
		return "yes";
	}
	
	/**
	 * 修改界面显示的信息
	 * @param info
	 * @return
	 */
	@RequestMapping(value="/selectMessage", method = RequestMethod.POST)
	public @ResponseBody JSONObject selectMessage(@RequestParam("info") String info){
		return studentService.selectMessage(info);
	}
	/**
	 * 修改信息
	 * @param info
	 * @return
	 */
	@RequestMapping(value="/updateMessage", method = RequestMethod.POST)
	public @ResponseBody String updateMessage(@RequestParam("info") String info){
		studentService.updateMessage(info);
		return "yes";
	}
}
