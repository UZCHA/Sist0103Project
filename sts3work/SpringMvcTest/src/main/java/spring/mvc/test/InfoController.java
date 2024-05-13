package spring.mvc.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("/info") �̷����ϸ� info�� �����ϴ� ��� ��.�̷��� �ٸ��ɷ� �����ϴ� �� ���⿡ �� ���� ����. 
public class InfoController {
	
	@GetMapping("/info/myform")
	public String myform() {
		return "info/infoform";//WEB-INF/info/infoform.jsp�� �ǹ�
	}
	
	@PostMapping("/info/read")//Infodto�� dto��� �̸����� �����ϰڴٴ� ��. �ƴ϶�� �ҹ��� infodto�� �ڵ������.
	public String result(@ModelAttribute("dto") InfoDto dto) {
		return "info/infowrite";
	}
}