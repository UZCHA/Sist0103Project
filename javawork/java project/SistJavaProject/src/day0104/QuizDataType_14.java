package day0104;

public class QuizDataType_14 {

	public static void main(String[] args) {
		// 실행단계에서 상품명,수량,단가를 입력한 후 다음과 같이 출력하세요.
		/*
		 * 상품명: 아이폰15
		 * 수량:2개
		 * 단가:1200000원
		 * 총금액:2400000원
		 */
		//1.변수선언
		String name=args[0];
		int a=Integer.parseInt(args[1]);
		int b=Integer.parseInt(args[2]);

		//2.계산
		int result=a*b;

		//3.출력
		System.out.println("상품명: "+name);
		System.out.println("수량: "+a+"개");
		System.out.println("단가: "+b+"원");
		System.out.println("총금액: "+result+"원");
		
		System.out.printf("상품명: %s\n",name);
		System.out.printf("수량: %d개\n",a);
		System.out.printf("단가: %d원\n",b);
		System.out.printf("총금액: %d원\n",result);
	}

}
