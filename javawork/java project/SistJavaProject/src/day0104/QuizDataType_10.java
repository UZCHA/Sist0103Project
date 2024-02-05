package day0104;

public class QuizDataType_10 {

	public static void main(String[] args) {
		// 변수는 args를 이용할것
		/*
		 * 학생명: 차유지 님
		 * 지역: 부산
		 * 나이: 23 세
		 * 
		 * ===============================================
		 * 차유지님의 자바점수는 88점 오라클점수는 77점 총 165점입니다.
		 * 
		 */
		//1. 변수선언, 실행단계에서 문자열을 읽어서 변수에 저장
		String a=args[0];
		String b=args[1];
		String c=args[2];//계산을 할때는 int로 해야한다. 그외에는 String 가능
		int java=Integer.parseInt(args[3]);
		int oracle=Integer.parseInt(args[4]);
		

		//2.계산
		int result=java+oracle;

		//3.출력
		System.out.println("학생명: "+a+" 님");
		System.out.println("지역: "+b);
		System.out.println("나이: "+c+"세");
		System.out.println();
		System.out.println("===============================================");
		System.out.printf("%s님의 자바점수는 %d점 오라클점수는 %d점 총 %d점입니다.\n",a,java,oracle,result);
		System.out.println("차유지님의 자바점수는 "+java+"점 오라클점수는 "+oracle+"점 총 "+result+"점입니다.");
		//위에 둘다 가능
		
	}

}
