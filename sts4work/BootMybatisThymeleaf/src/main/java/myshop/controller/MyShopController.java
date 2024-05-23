package myshop.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import myshop.dto.MyShopDto;
import myshop.service.MyShopService;

@Controller
@RequiredArgsConstructor
public class MyShopController {

	
	private final MyShopService shopService;
	
	@GetMapping("/")
	public String list(Model model) {
		
		int totalCount=shopService.getTotalCount();
		model.addAttribute("totalCount", totalCount);
		
		List<MyShopDto> list=shopService.getAllSangpums();
		model.addAttribute("list", list);
		
		return "myshop/shoplist";
	}
	
	@GetMapping("/addform")
	public String form() {
		return "myshop/shopform";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute MyShopDto dto,
			HttpSession session,
			@RequestParam MultipartFile upload) {
		
		String realPath=session.getServletContext().getRealPath("/photo");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmm");
		String photoName=sdf.format(new Date())+upload.getOriginalFilename();
		dto.setPhoto(photoName);
		
		try {
			upload.transferTo(new File(realPath+"\\"+photoName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		shopService.insertShop(dto);
		return "redirect:/";
		
	}
	@GetMapping("/detail")
	public String detail(@RequestParam int num,Model model) {
		MyShopDto dto=shopService.getData(num);
		model.addAttribute("dto", dto);
		
		return "myshop/shopdetail";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int num,HttpSession session) {
		
		String oldFileName=shopService.getData(num).getPhoto();
		String realPath=session.getServletContext().getRealPath("/photo");
		
		File file=new File(realPath+"\\"+oldFileName);
		if(file.exists())
			file.delete();
		
		//db지우기
		shopService.deleteshop(num);
		return "redirect:/";
	}
}
