package product.controller;

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
import product.dto.ProductDto;
import product.service.ProductService;

@Controller
@RequiredArgsConstructor
public class ProductController {

	private final ProductService proService;
	
	@GetMapping("/")
	public String start(Model model) {
		int totalCount=proService.getTotalProduct();
		model.addAttribute("totalCount", totalCount);
		
		List<ProductDto> list=proService.getAllProduct();
		model.addAttribute("list", list);
		
		return "product/productlist";
	}
	
	@GetMapping("/addform")
	public String addform() {
		return "product/addform";
	}
	
	@PostMapping("/add")
	public String insert(@ModelAttribute ProductDto dto,HttpSession session,@RequestParam MultipartFile photo) {
		
		String realPath=session.getServletContext().getRealPath("/productimage");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String photoName=sdf.format(new Date())+photo.getOriginalFilename();
		dto.setPro_image(photoName);
		
		try {
			photo.transferTo(new File(realPath+"\\"+photoName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		proService.insertProduct(dto);
		
		return "redirect:/";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam int pro_num,Model model) {
		ProductDto dto=proService.getData(pro_num);
		model.addAttribute("dto", dto);
		
		return "product/productdetail";
	}
	
	
	
	
}
