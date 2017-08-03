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
import study.service.PresentService;

@Controller
public class PresentController {
	
	@Autowired
	private PresentService presentService;
	
	/**
	 * 显示奖品信息
	 * @param id
	 * @return 查询后的奖品信息
	 */
	@RequestMapping(value="/present", method = RequestMethod.POST)
	public @ResponseBody JSONArray presentMessage(@RequestBody String msg){	
		return presentService.presentMessage(msg);
	}
	
	/**
	 * 兑换奖品下拉框
	 * @param id
	 * @return 查询后的奖品信息
	 */
	@RequestMapping(value="/presentDrop", method = RequestMethod.POST)
	public @ResponseBody JSONArray presentDrop(){	
		return presentService.presentDrop();
	}
	/**
	 * 添加奖励信息
	 * @return
	 */
	@RequestMapping(value="/insertPresent", method = RequestMethod.POST)
	public @ResponseBody String insertPresent(@RequestParam("info") String info){	
		presentService.insertPresent(info);
		return "yes";
	}
	/**
	 * 删除奖励信息
	 * @return
	 */
	@RequestMapping(value="/deletePresent", method = RequestMethod.POST)
	public @ResponseBody String deletePresent(@RequestParam("info") String info){
		presentService.deletePresent(info);
		return "yes";
	}
	/**
	 * 显示修改奖励信息界面的信息
	 * @return
	 */
	@RequestMapping(value="/selectPresent", method = RequestMethod.POST)
	public @ResponseBody JSONObject selectPresent(@RequestParam("info") String info){
		return presentService.selectPresent(info);
	}
	/**
	 * 修改奖励信息
	 * @return
	 */
	@RequestMapping(value="/updatePresent", method = RequestMethod.POST)
	public @ResponseBody String updatePresent(@RequestParam("info") String info){
		presentService.updatePresent(info);
		return "yes";
	}
}
