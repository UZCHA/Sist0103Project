package spring.mvc.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("/info") 이렇게하면 info로 시작하는 모든 것.이러면 다른걸로 시작하는 걸 여기에 쓸 수가 없다. 
public class InfoController {
	
	@GetMapping("/info/myform")
	public String myform() {
		return "info/infoform";//WEB-INF/info/infoform.jsp를 의미
	}
	
	@PostMapping("/info/read")//Infodto를 dto라는 이름으로 저장하겠다는 것. 아니라면 소문자 infodto로 자동저장됨.
	public String result(@ModelAttribute("dto") InfoDto dto) {
		return "info/infowrite";
	}
}
