package study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	@RequestMapping(value="/student", method = RequestMethod.GET)
	public @ResponseBody JSONArray stuMessage(@RequestParam("id") String id){
		System.out.println(id);
		return studentService.stuMessage();
	}
}
