package spring.day0430.anno1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("logic")//이렇게하면 id가 logic이 된다. 아무것도 없으면 logicController이 id가 됨
public class LogicController {
	
	
	DaoInter inter;
	
	@Autowired //dao에 있는 모든 메서드를 자동 주입 받음
	public LogicController(MyDao dao) {
		this.inter=dao;
	}
	
	//insert
	public void insert(String str) {
		inter.insertData(str);
	}
	
	//delete
	public void delete(String num) {
		inter.deleteData(num);
	}
}
