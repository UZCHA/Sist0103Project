package spring.db.carmember;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarMemberController {
	@Autowired
	CarMemberDaoInter memberInter;
	
	@GetMapping("/carmember/list")
	public String list(Model model) {
		int totalCount=memberInter.getTotalCount();
		model.addAttribute("totalCount", totalCount);
		
		List<CarMemberDto> list=memberInter.getAllMembers();
		model.addAttribute("list", list);
		
		return "carmember/memberlist";
	}
	
	@GetMapping("/carmember/writeform")
	public String memberform() {
		return "carmember/memberform";
	}
	@PostMapping("/carmember/write")
	public String insert(@ModelAttribute("dto") CarMemberDto dto) {
		memberInter.insertMember(dto);
		return "redirect:list";
	}
	
	@GetMapping("/carmember/updateform")
	public String uform(@RequestParam String num,Model model) {
		CarMemberDto dto=memberInter.getDataMem(num);
		model.addAttribute("dto", dto);
		return "carmember/memupdateform";
	}
	@PostMapping("/carmember/memupdate")
	public String update(@ModelAttribute("dto") CarMemberDto dto) {
		memberInter.updateMember(dto);
		return "redirect:list";
	}
	
	@GetMapping("/carmember/memdelete")
	public String delete(@RequestParam String num) {
		memberInter.deleteMember(num);
		return "redirect:list";
	}
}
