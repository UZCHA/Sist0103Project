package spring.day0430.anno1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("logic")//�̷����ϸ� id�� logic�� �ȴ�. �ƹ��͵� ������ logicController�� id�� ��
public class LogicController {
	
	
	DaoInter inter;
	
	@Autowired //dao�� �ִ� ��� �޼��带 �ڵ� ���� ����
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
