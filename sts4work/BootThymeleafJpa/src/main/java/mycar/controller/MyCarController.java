package mycar.controller;

import java.io.File;
import java.io.IOException;
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
import mycar.data.MyCarDto;
import mycar.repository.MyCarCommentDao;
import mycar.repository.MyCarDao;

@Controller
@RequiredArgsConstructor
public class MyCarController {

	private final MyCarDao dao;
	
	//멤버변수 추가
	private final MyCarCommentDao commentDao;
	
	@GetMapping("/")
	public String start() {
		return "redirect:list";
	}
	
	@GetMapping("/list")
	public String list(Model model) {
		
		List<MyCarDto> list=dao.getAllCars();
		
		for(MyCarDto dto:list) {
			//댓글갯수 저장
			int acount=commentDao.getMyCarCommentList(dto.getNum()).size();
			dto.setCommentcount(acount);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("totalcount", list.size());
		
		return "mycar/mycarlist"; 
	}
	
	@GetMapping("/writeform")
	public String form() {
		
		return "mycar/mycarform";
	}
	
	@PostMapping("/insert") //carupload 는 form 에 작성한 name 입니다.
	public String insert(@ModelAttribute MyCarDto dto,
			@RequestParam MultipartFile carupload,
			HttpSession session) {
		
		String realPath=session.getServletContext().getRealPath("/save");
		System.out.println(realPath);
		String uploadName=carupload.getOriginalFilename();
		dto.setCarphoto(uploadName);
		
		//실제업로드
		try {
			carupload.transferTo(new File(realPath+"\\"+uploadName));
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//db에 저장
		dao.insertMyCar(dto);
		return "redirect:list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam Long num,Model model) {
		
		MyCarDto dto=dao.getData(num);
		model.addAttribute("dto", dto);
		
		return "mycar/mycardetail";
	}
	
	@GetMapping("/updateform")
	public String uform(@RequestParam Long num,Model model) {
		
		MyCarDto dto=dao.getData(num);
		model.addAttribute("dto", dto);
		return "mycar/updateform";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam Long num,
			HttpSession session) {
		
		//파일사진부터 삭제
		String carphoto=dao.getData(num).getCarphoto();
		String realPath=session.getServletContext().getRealPath("/save");
		//파일객체 생성후 삭제
		File file=new File(realPath+"\\"+carphoto);
		
		if(file.exists())
			file.delete();
		//db삭제
		dao.deleteMyCar(num);
		//목록으로
		return "redirect:list";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute MyCarDto dto,@RequestParam MultipartFile upload,
			HttpSession session) {
		
		//수정할때 사진을 변경안하면 사진 제외하고 수정(사진 그대로 db에 있음)
		if(upload.getOriginalFilename().equals("")) {
			dao.updateMycarNoPhoto(dto);
		}else {
			String realPath=session.getServletContext().getRealPath("/save");
			String uploadName=upload.getOriginalFilename();
			dto.setCarphoto(uploadName);
			//실제업로드
			try {
				upload.transferTo(new File(realPath+"\\"+uploadName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dao.updateMyCar(dto);
		}
		
		//수정후에 상세보기로
		return "redirect:detail?num="+dto.getNum();
	}
	
}