package info.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InfoController {

	@Autowired
	InfoDao dao;
	
	@GetMapping("/info/list")
	public ModelAndView list() {
		
		ModelAndView model=new ModelAndView();
		
		List<InfoDto> list=dao.getAllDatas();
		model.addObject("list", list);
		model.addObject("count", list.size());
		
		model.setViewName("info/infolist");
		
		return model;
	}
	
	@GetMapping("/info/addform")
	public String addform() {
		return "info/addform";
	}
	
	@PostMapping("/info/insert")
	public String add(@ModelAttribute InfoDto dto) {
		dao.insertInfo(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/info/updateform")
	public ModelAndView uform(int num) {
		ModelAndView model=new ModelAndView();
		InfoDto dto=dao.getData(num);
		model.addObject("dto", dto);
		model.setViewName("info/updateform");
		return model;
	}
	
	@PostMapping("/info/soojung")
	public String update(@ModelAttribute InfoDto dto) {
		dao.updateInfo(dto);
		return "redirect:list";
	}
	
	@GetMapping("/info/sakjae")
	public String delete(int num) {
		dao.deleteInfo(num);
		return "redirect:list";
	}
	
}
