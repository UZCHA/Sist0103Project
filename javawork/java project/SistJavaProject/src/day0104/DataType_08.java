package day0104;

public class DataType_08 {

	public static void main(String[] args) {
		// 묵시적형변환: 자동으로 결졍되는 타입
		//String+int=String
		//double+int=double
		//long+short=long
		//char+int=int

		char a='A';//65의 아스키코드
		// char 내부적으로 아스키코드 값으로 인식
		System.out.println(a+32);
		System.out.println("Happy"+5+6);//String에 int를 더해서 String이 나옴
		System.out.println("Happy"+(5+6));//괄호안에부터 먼저 더해짐
		System.out.println('A'+3);//A의 아스키값은 65이기 때문에 결과값이 68
		System.out.println(2+'b');
		System.out.println('a'+'b');
	}

}
