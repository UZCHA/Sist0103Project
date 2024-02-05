package day0105;

public class SwitchTest_17 {

	public static void main(String[] args) {
		//switch문 예제 #1
		int a=3;

		//break가 없을 경우 끝까지 실행

		switch (a) 
		{
		case 1:
			System.out.println("a is 1");
			break;
		case 2:
			System.out.println("a is 2");
			break;
		case 3:
			System.out.println("a is 3");
			break;
		default:
			System.out.println("a is 입력값 없음");
			break;
		}

		char ch='b';
		switch (ch) {
		case 'a':
			System.out.println("apple");
			break;
		case 'b':
			System.out.println("banana");
			break;
		default:
			System.out.println("사과 바나나가 아니다");
		}
		
		String msg="hi";
		//switch 문자열이 jdk8부터 가능
		switch(msg)
		{case "hello":
			System.out.println("msg is hello");
			break;
		case "happy":
			System.out.println("msg is happy");
			break;
		case "hi":
			System.out.println("msg is hi");
			break; 
		default:
			System.out.println("인사안함");
		}


	}

}
