package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemBoardDto;
import boot.data.service.AnsMboardService;
import boot.data.service.MemBoardServiceInter;
import boot.data.service.MemberService;

@Controller
public class BoardController {

	@Autowired
	MemBoardServiceInter service;
	@Autowired
	MemberService mservice; //myid가 form에는 없는데 dto에는 있어서 그 값을 받기위해

	
//	@GetMapping("/board/list")
//	public ModelAndView boardlist() {
//		ModelAndView mview=new ModelAndView();
//		int totalCount=service.getTotalCount();
//		mview.addObject("totalCount", totalCount);
//		
//		mview.setViewName("/board/boardlist");
//		return mview;
//	}
	
	@GetMapping("/board/form")
	public String form() {
		return "/board/writeform";
	}
	
	@PostMapping("/board/insert")
	public String insert(@ModelAttribute MemBoardDto dto,HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/boardphoto");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		if(dto.getUpload().getOriginalFilename().equals(""))
			dto.setUploadfile("no");
		else {
			String uploadfile=sdf.format(new Date())+dto.getUpload().getOriginalFilename();
			dto.setUploadfile(uploadfile);
			
			try {
				dto.getUpload().transferTo(new File(path+"\\"+uploadfile));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//세션에서 아이디 얻어서 dto에 저장
		String myid=(String)session.getAttribute("myid");
		dto.setMyid(myid);
		//이름
		String name=mservice.getName(myid);
		dto.setName(name);
		//담을 거 다 담아서 insert
		service.insertMemBoard(dto);
		return "redirect:list";
	}
	@GetMapping("board/list")
	public ModelAndView list(@RequestParam(value = "currentPage",defaultValue = "1")int currentPage) {
		
		ModelAndView mview=new ModelAndView();
		
		//페이징에 필요한 변수
		int totalCount=service.getTotalCount();
		
		int perPage=3; //한페이지당 보여질 글의 갯수
		int perBlock=5; //한블럭당 보여질 페이지 갯수
		int start; //db에서 가져올 글의 시작번호(mysql은 첫글이 0번,oracle은 1번)
		int startPage; //각 블럭에서 보여질 시작페이지
		int endPage; //각 블럭당 보여질 끝 페이지
		int totalPage; //총 페이지 수

		int no; //currentPage당 출력할 시작번호

		//총 페이지수 구하기
		//총글갯수를 한페이지당 보여질 갯수로 나눔(7/5=1)
		//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요하다는 뜻)
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

		//각 블럭당 보여질 시작페이지
		//perBlock=5 일 경우 현재페이지가 1~5일 경우 시작페이지가1, 끝 페이지가 5
		//현재가 13일 경우 시작페이지:11 끝페이지:15
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;

		//예를 들어 총 페이지가 23일 경우 마지막블럭은 끝페이지가 25가 아니라 23이 된다.
		if(endPage>totalPage)
		endPage=totalPage;

		//각 페이지에서 보여질 시작 번호
		//1페이지:0, 2페이지:5 3페이지:10...
		start=(currentPage-1)*perPage;

		//각 페이지당 출력할 시작번호 구하기
		//예) 총 글갯수가 23일때 내림차순에서 시작번호는 1페이지:23, 2페이지:18, 3페이지:13..
		no=totalCount-(currentPage-1)*perPage;

		
		List<MemBoardDto> list=service.getList(start, perPage);
		
		//리퀘스에 저장
		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		mview.addObject("no", no);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("currentPage", currentPage);
		mview.addObject("totalPage", totalPage);
		
		//포워드
		mview.setViewName("/board/boardlist");
		
		return mview;
	}
	//content이동
	//조회수
	@GetMapping("/board/content")
	public ModelAndView content(String num,@RequestParam(defaultValue = "1")int currentPage) {
		
		ModelAndView mview=new ModelAndView();
		service.updateReadCount(num);
		MemBoardDto dto=service.getData(num);
		
		//업로드 파일의 확장자 얻기
		int dotloc=dto.getUploadfile().lastIndexOf('.');
		String ext=dto.getUploadfile().substring(dotloc+1);//'.'의 다음글자부터 끝까지
		
		//System.out.println(dotloc+","+ext);
		
		//이미지인지 아닌지 보고 출력하게 하기 위해서 
		if(ext.equalsIgnoreCase("jpg")|| ext.equalsIgnoreCase("gif")||ext.equalsIgnoreCase("png")||ext.equalsIgnoreCase("jpeg"))
			mview.addObject("bupload", true);
		else
			mview.addObject("bupload", false);
		
		mview.addObject("dto", dto);
		mview.addObject("currentPage", currentPage);
		mview.setViewName("/board/content");
		return mview;
	}
	
}
