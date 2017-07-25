package study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import study.service.CardService;
@Controller
public class CardController {
	
	@Autowired
	private CardService cardService;
	/**
	 * 显示星星卡数量
	 * @param msg
	 * @return
	 */
	@RequestMapping(value="/card", method = RequestMethod.POST)
	public @ResponseBody JSONArray cardMessage(@RequestBody String msg){
		
		return cardService.cardMessage(msg);
	}
	/**
	 * 给某成员加一张星星卡
	 * @param info
	 * @return
	 */
	@RequestMapping(value="/cardPlus", method = RequestMethod.POST)
	public @ResponseBody String cardPlus(@RequestParam("info") String info){
		cardService.cardPlus(info);
		return "yes";
	}
	/**
	 * 给某成员加两张星星卡
	 * @param info
	 * @return
	 */
	@RequestMapping(value="/cardPlus2", method = RequestMethod.POST)
	public @ResponseBody String cardPlus2(@RequestParam("info") String info){
		System.out.println(info);
		cardService.cardPlus2(info);
		return "yes";
	}
	/**
	 * 修改界面显示卡片数量
	 * @param info
	 * @return
	 */
	
	@RequestMapping(value="/selectCard", method = RequestMethod.POST)
	public @ResponseBody JSONObject selectCard(@RequestParam("info") String info){
		return cardService.selectCard(info);
	}
	/**
	 * 修改卡片数量
	 * @param info
	 * @return
	 */
	@RequestMapping(value="/updateCard", method = RequestMethod.POST)
	public @ResponseBody String updateCard(@RequestParam("info") String info){
		cardService.updateCard(info);
		return "yes";
	}
	/**
	 * 换卡
	 * @param info
	 * @param b
	 * @return
	 */
	@RequestMapping(value="/changeMoonCard/{bz}", method = RequestMethod.POST)
	public @ResponseBody String changeMoonCard(@RequestParam("info") String info ,@PathVariable("bz") String b){
		System.out.println(b);
		JSONObject jo = JSONObject.fromObject(info);
		jo.put("bz", b);
		cardService.changeMoonCard(jo);
		return "yes";
	}
	/**
	 * 换礼物
	 * @param info
	 * @return
	 */
	@RequestMapping(value="/prize", method = RequestMethod.POST)
	public @ResponseBody String prize(@RequestParam("info") String info){
		System.out.println(info);
		JSONObject jo = JSONObject.fromObject(info);
		cardService.exchange(jo);
		return "yes";
	}
}
