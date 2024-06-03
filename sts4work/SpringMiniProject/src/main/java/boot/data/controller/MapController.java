package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MapController {

	@GetMapping("/load/map")
	public String loadmap() {
		
		return "/trd/load/loadmap";
	}
	
	@GetMapping("/test/test")
	public String test() {
		return "/test/test";
	}
	
}
