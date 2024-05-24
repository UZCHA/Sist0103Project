package boot.guest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.html.HTMLModElement;

import boot.guest.dto.GuestDto;
import boot.guest.service.GuestService;

@Controller
public class GuestListController {

	@Autowired
	private GuestService gService;
	
	@GetMapping("/")
	public String start() {
		return "redirect:guest/list";
	}
	
	@GetMapping("/guest/list")
	public String list(Model model) {
		
		int totalCount=gService.getTotalCount();
		model.addAttribute("totalCount", totalCount);
		
		List<GuestDto> list=gService.getAllDatas();
		model.addAttribute("list", list);
		
		return "guest/guestlist";
	}
	
	@GetMapping("/guest/delete")
	public Map<String, Object> delete(@RequestParam int num,@RequestParam String pass) {
		Map<String, Object> map=new HashMap<String,Object>();
		int b=gService.passCheck(pass, num);
		if(b==1) {
			gService.deleteGuest(num);
		}
		map.put("status", b==1?1:0);
		return map;
		
	}

	
	
	
	
}
