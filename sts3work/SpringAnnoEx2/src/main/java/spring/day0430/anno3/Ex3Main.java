package spring.day0430.anno3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class Ex3Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ApplicationContext app=new ClassPathXmlApplicationContext("annoContext1.xml");
		TestController test=(TestController)app.getBean("testController");
		
		test.insert("이효리");
		test.delete("3");
		test.select("이상순");
	}

}
