package spring.mvc.quiz;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@GetMapping("/")
	public String start()
	{
		return "redirect:quiz/myshop";
	}
	
	@GetMapping("/quiz/myshop")
	public String form()
	{
		return "day0507Quiz/quizUploadForm";
	}
	
	@PostMapping("/quiz/shopwrite")
	public ModelAndView shopwrite(
			@RequestParam String sangpum,
			@RequestParam ArrayList<MultipartFile> photo,
			@RequestParam String price,
			@RequestParam String ipgoday,
			HttpServletRequest request) {
		ModelAndView mview=new ModelAndView();
		
		String path=request.getSession().getServletContext().getRealPath("/WEB-INF/image");
		System.out.println(path);

		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		ArrayList<String> files=new ArrayList<String>();
		for(MultipartFile f:photo) {
			String fileName=sdf.format(new Date())+"_"+f.getOriginalFilename();
			files.add(fileName);
			try {
				f.transferTo(new File(path+"\\"+fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		mview.addObject("files", files);
		mview.addObject("sangpum",sangpum);
		mview.addObject("price", price);
		mview.addObject("ipgoday", ipgoday);
		mview.addObject("path", path);
		
		mview.setViewName("day0507Quiz/quizUploadWrite");
		
		return mview;
	}
	
}
