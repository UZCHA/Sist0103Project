package day0104;

public class ArgsParse_03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String name=args[0];
		int java=Integer.parseInt(args[1]);
		int oracle=Integer.parseInt(args[2]);
		//변수선언을 먼저하고 출력
		System.out.println("내 이름은 "+name);
		System.out.println("자바 점수는 "+java+"점 입니다");
		System.out.println("오라클 점수는 "+oracle+"점 입니다");
		System.out.println("두 과목의 합계는 "+(java+oracle)+"점 입니다");
	}

}
