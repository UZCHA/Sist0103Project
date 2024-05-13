package spring.day0430.anno2;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyFruit {
	//�������̽��� ������ Ŭ������ 1���ϰ�쿡�� �ڵ������� �Ǵµ� 
	//���� ������ Ŭ������ 2�� �̻��϶� �ڵ����Կ� ������ �����.
	//@Autowired 
	
	//��Ȯ�ϰ� bean�� �̸����� �����Ϸ��� resource ���
	//@Resource(name="tManggo")
	@Resource(name="vietnamManggo")
	Manggo mg;
	
	public void writeManggo() {
		System.out.println("**���� �����ϴ� ������**");
		mg.writeManggoName();
	}
	
}