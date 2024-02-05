package day0105;

import java.util.Calendar;
import java.util.Scanner;

public class QuizMyAgeInOut_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * 당신의 이름은?==>차유지
		 * 당신이 태어난 연도는==>1993
		 * 당신이 사는 지역은?==>서울
		 * 
		 * ====================
		 * [차유지 님의 개인정보]
		 * ====================
		 * 이름: 차유지
		 * 태어난년도:1993
		 * 나이: 00세
		 * 지역: 서울
		 */
		//1.import
		
		Scanner sc=new Scanner(System.in);
		Calendar cal=Calendar.getInstance();
		
		//2.변수
		String name,ji;
		int curYear,myYear,myAge;
		
		//3.입력
		System.out.print("당신의 이름은?==>");
		name=sc.nextLine();
		
		System.out.print("당신이 태어난 연도는?==>");
		myYear=Integer.parseInt(sc.nextLine());
		//sc.nextline는 키보드의 버퍼나 엔터를 먼저 읽어서 없애준다. 
		
		System.out.print("당신이 사는 지역은?==>");
		ji=sc.nextLine();
		
		//4.계산
		curYear=cal.get(cal.YEAR);
		myAge=curYear-myYear;
		
		//5.출력
		System.out.println("===================");
		System.out.println("["+name+" 님의 개인정보]");
		System.out.println("===================");
		
		System.out.println("이름: "+name);
		System.out.println("태어난년도: "+myYear);
		System.out.println("나이: "+myAge+"세");
		System.out.println("지역: "+ji);
				
	}
}
