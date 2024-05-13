package spring.db.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BoardRestController {
		@Autowired
		BoardDaoInter dao;
		
		@GetMapping("/ajax/list1")
		public List<BoardDto> list(){
			return dao.getPhotoLists();//json형태로 반환해줄거임
		}
		
		@GetMapping("/ajax/list2")
		public List<BoardDto> list2(){
			return dao.getAlllist();
		}
}
