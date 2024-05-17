package board.data;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
public class BoardDaoController {

	@Autowired
	BoardDao dao;
	
	@GetMapping("/")
	public String home() {
		return "redirect:board/list";
	}
	
	@GetMapping("/board/list")
	public ModelAndView start() {
		ModelAndView model=new ModelAndView();
		List<BoardDto> list=dao.getAllDatas();
		
		model.addObject("list", list);
		model.addObject("count", list.size());
		model.setViewName("board/boardlist");
		
		return model;
	}
	
	@GetMapping("/board/addform")
	public String form() {
		return "board/writeform";
	}
	
	@PostMapping("/board/add")
	public String insert(@ModelAttribute BoardDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session) {
		
		//실제경로
		String realPath=session.getServletContext().getRealPath("/save");
		System.out.println(realPath);
		
		String uploadName=upload.getOriginalFilename();
		
		if(upload.isEmpty())
			dto.setPhoto("no");
		else {
			dto.setPhoto(uploadName);
			
			//실제업로그
			try {
				upload.transferTo(new File(realPath+"\\"+uploadName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		dao.insertBoard(dto);
		return "redirect:list";
	}
	
	@GetMapping("/board/detail")
	public String detail(@RequestParam Long num, Model model) {
		
		BoardDto dto=dao.getData(num);
		model.addAttribute("dto", dto);
		return "board/detail";
	}
	
	@GetMapping("/board/updateform")
	public ModelAndView update(Long num) {
		ModelAndView model=new ModelAndView();
		BoardDto dto=dao.getData(num);
		model.addObject("dto", dto);
		model.setViewName("board/updateform");
		return model;
	}
	
	
	
}
