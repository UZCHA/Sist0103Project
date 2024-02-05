package day0104;

import java.util.Scanner;

public class QuizKeyBoardIn_16 {

	public static void main(String[] args) {
		/*
		 * 상품명을 입력하세요==> 아이폰15
		 * 가격은 얼마입니까?==> 1200000
		 * 수량은 몇개입니까?==>5
		 * 
		 * [상품입고]
		 * =========================
		 * 입고상품명: 아이폰15
		 * 수량:5개
		 * 가격1200000원
		 * =========================
		 * 총가격: 6000000원
		 */
		
		Scanner sc=new Scanner(System.in);
		String name;
		int su,dan,tot;
	
		
		System.out.print("상품명을 입력하세요==>");
		name=sc.nextLine();
		
		System.out.print("가격은 얼마입니까==>");
		dan=sc.nextInt();
	
		System.out.print("수량은 몇개입니까?==>");
		su=sc.nextInt();
		
		tot=su*dan;
		
		System.out.print("[상품입고]\n");
		System.out.println("=======================");
		System.out.println("입고상품명: "+name);
		System.out.println("입고수량: "+su+"개");
		System.out.println("입고가격: "+dan+"원");
		System.out.println("=======================");
		System.out.print("총가격: "+tot+"원");
		
	}

}
