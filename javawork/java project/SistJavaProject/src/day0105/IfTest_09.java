package day0105;

public class IfTest_09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a=10;
		if(a>5) {//if 바로 아래있는 한줄은 괄호없이도 출력됨. 대신 두줄 이상일때는 괄호해줘야함
			System.out.println(a+"는 5보다 크다");
		}

		int b=100;
		if(b%2==0)
			System.out.println(b+"는 짝수이다");
		else
			System.out.println(b+"는 홀수이다");
		System.out.println("프로그램종료");
	}

}
