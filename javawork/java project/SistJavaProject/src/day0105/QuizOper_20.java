package day0105;

import java.util.Scanner;

public class QuizOper_20 {

	public static void main(String[] args) {
/*(상품을 5개 이상 구매시 10% 할인하여 계산된다)
 * 상품명: 키보드
 * 수량:3
 * 가격:20000
 * ================
 * 5개 이상 구매시 10%할인됩니다.
 * 키보드 3개는 총 60000원 입니다
 * 할인된금액:0000원
 */
		
		Scanner sc=new Scanner(System.in);
		
		String name;
		int su,pri,tot;
		double dis;
		
		System.out.println("상품명: ");
		name=sc.nextLine();
		System.out.println("수량: ");
		su=sc.nextInt();
		System.out.println("가격: ");
	
		pri=sc.nextInt();
		
		System.out.println("=================");
		System.out.println("5개 이상 구매시 10%할인 됩니다");
		
		tot=su*pri;
		
		
		System.out.println(name+su+"개는 총"+tot+"원 입니다");
		
		if(su>=5)
			dis=tot*0.1;
		else 
			dis=0;
		
		System.out.println("총할인금액: "+dis);
		
		
				
	}

}
