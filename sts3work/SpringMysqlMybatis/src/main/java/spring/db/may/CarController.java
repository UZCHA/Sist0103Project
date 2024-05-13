package spring.db.may;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarController {
	
	@Autowired
	SpringCarDaoInter carInter;
	
	@GetMapping("/samsung/list")
	public String list(Model model) {
		//dao�κ��� �Ѱ��� ����
		int totalCount=carInter.getTotalCount();
		//��ϰ�������
		List<SpringCarDto> list=carInter.getAllCarDatas();
		//request�� ����
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("list", list);
		return "car/carlist";
	}
	
	@GetMapping("/samsung/writeform")
	public String carform() {
		return "car/addform";
	}
	@PostMapping("/samsung/write")
	public String insert(@ModelAttribute("dto") SpringCarDto dto) {
		carInter.insertCar(dto);
		return "redirect:list";
	}
	
	@GetMapping("/samsung/updateform")
	public String uform(@RequestParam String num,Model model) {
		SpringCarDto dto=carInter.getData(num);
		model.addAttribute("dto", dto);
		return "car/updateform";
	}
	
	@PostMapping("/samsung/update")
	public String update(@ModelAttribute("dto") SpringCarDto dto) {
		carInter.updateCar(dto);
		return "redirect:list";
	}
	
	@GetMapping("/samsung/delete")
	public String delete(@RequestParam String num) {
		carInter.deleteCar(num);
		return "redirect:list";
	}

}