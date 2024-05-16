package boot.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@GetMapping("/")
	public ModelAndView list() {
		ModelAndView mview=new ModelAndView();
		mview.addObject("name", "김철수");
		mview.addObject("addr", "제주시");
		
		mview.setViewName("list");
		
		return mview;
	}
}
