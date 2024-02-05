package day0115;

import java.util.Date;

public class NullPointException_13 {
	Date date;//선언만 한것. new Date하고 생성해줘야함.
	
	public void write() {
		int y,m,d;
		try {
		y=date.getYear()-1900;
		m=date.getMonth()+1;
		d=date.getDate();
		
		System.out.println(y+"년"+m+"월"+y+"일 입니다.");
		}
		catch(NullPointerException e) {
			e.printStackTrace();
			System.out.println("객체생성을 안했어요."+e.getMessage());
		}
	}
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		NullPointException_13 nullex=new NullPointException_13();
		nullex.write();
		System.out.println("**프로그램 정상 종료**");
		
		
		
	}

}
