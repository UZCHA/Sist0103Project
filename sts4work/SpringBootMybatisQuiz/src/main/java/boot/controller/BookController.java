package boot.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.BookDto;
import boot.data.BookMapperInter;
import jakarta.servlet.http.HttpSession;

@Controller
public class BookController {

	@Autowired
	BookMapperInter mapper;
	
	@GetMapping("/")
	public String start() {
		return "redirect:book/list";
	}
	
	@GetMapping("/book/list")
	public ModelAndView list() {
	
		ModelAndView mview=new ModelAndView();
		int totalCount=mapper.getBookTotalCount();
		mview.addObject("totalCount", totalCount);
		
		List<BookDto> list=mapper.getAllBookDatas();
		mview.addObject("list", list);
		
		mview.setViewName("book/booklist2");
		return mview;
	}
	
	@GetMapping("/book/addbook")
	public String addform() {
		return "book/addform";
	}
	
	@PostMapping("/book/insert")
	public String insert(@ModelAttribute BookDto dto,
			HttpSession session,@RequestParam MultipartFile bookphoto) {
		
		String realPath=session.getServletContext().getRealPath("/bookphoto");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmm");
		String bookphotoname=sdf.format(new Date())+bookphoto.getOriginalFilename();
		dto.setBookimage(bookphotoname);
		try {
			bookphoto.transferTo(new File(realPath+"\\"+bookphotoname));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mapper.insertBook(dto);
		return "redirect:list";
		
	}
	
	@GetMapping("/book/bookupdateform")
	public String uform() {
		return "book/bookupdateform";
	}
	
}
