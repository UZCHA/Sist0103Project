package spring.di.ex4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex4Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext app=new ClassPathXmlApplicationContext("appContext4.xml");
		Sungjuk sungjuk=app.getBean("sj", Sungjuk.class);
		sungjuk.writeSungjuk();
	}

}
