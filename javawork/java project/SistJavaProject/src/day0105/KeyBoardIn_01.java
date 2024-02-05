package day0105;

import java.util.Scanner;

public class KeyBoardIn_01 {

	public static void main(String[] args) {
		// 이름,핸드폰번호 주소 입력 후 출력
		Scanner sd=new Scanner(System.in);
		
		//변수선언
		String name,hp,addr;
		
		System.out.println("이름을 입력하세요");
		name=sd.nextLine();
		
		System.out.println("핸드폰번호는?");
		hp=sd.nextLine();
		
		System.out.println("주소는?");
		addr=sd.nextLine();
				
		//최종출력
		System.out.println("===================");
		System.out.println("[입력결과]");
		System.out.println("이름: "+name+"님");
		System.out.println("핸드폰: "+hp);
		System.out.println("주소: "+addr);
				
				
	}

}
