package boot.data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.AnswerMboardDto;
import boot.data.service.AnsMboardService;
import boot.data.service.MemberService;

@RestController
public class AnswerMboardRestController {

	@Autowired
	AnsMboardService service;
	@Autowired
	MemberService mservice;
	//insert
	@PostMapping("/answer/insert")
	public void insert(@ModelAttribute AnswerMboardDto dto,HttpSession session) {
		String myid=(String)session.getAttribute("myid");
		String name=mservice.getName(myid);
		
		dto.setName(name);
		dto.setMyid(myid);
		service.insertAnswer(dto);
		
	}
	//전체 출력
	@GetMapping("/answer/anslist")
	public List<AnswerMboardDto> anslist(@RequestParam String num){
	
		return service.getAllAnswer(num);
	}
	
	//수정 폼
	@GetMapping("/answer/ansupdateform")
	public AnswerMboardDto getData(String idx) {
		return service.getAnswer(idx);
	}
	
	//수정
	@PostMapping("/answer/ansupdate")
	public void ansupdate(AnswerMboardDto dto) {
		service.updateAnswer(dto);
	}
	
	//삭제
	@GetMapping("/answer/ansdelete")
	public void ansdelete(String idx) {
		service.deleteAnswer(idx);
	}
	@GetMapping("/board/anscount")
	public int anscount(String num) {
		return service.totalAnsCount(num);
	}
	
}
