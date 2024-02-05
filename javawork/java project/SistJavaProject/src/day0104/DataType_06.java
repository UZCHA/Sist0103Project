package day0104;

public class DataType_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//1.기본 자료형 8개
		boolean flag=false;//논리형 true,false
		//2.문자형
		//반드시 하나의 문자, 16바이트 유니코드값 표현
		//2바이트 문자하나
		//기본적으로 정수형,아스키코드로 변경이 가능하므로 정수형으로 봐도괜춘
		// ''으로 표현
		char ch='가';
		//3.정수형
		byte a=-128;//1바이트 -128~127
		short b=32000;//16bit
		int c=320000;//32bit
		long d=100l;//64bit 뒤에 L,l을 붙여야 long 인지 int인지를 의미
		//실수
		float f=3.1234f;//32bit 뒤에 f를 안붙이면 무조건 double을 의미함.그래서 보통 더블을 사용함
		double o=23456.1234567;//64bit 소수점가진 숫자의미 double이 기본
		//출력
		System.out.println("flag="+flag);
		System.out.println("문자형 ch="+ch);
		System.out.println("정수 a="+a);
		System.out.println("정수 b="+b);
		System.out.println("정수 c="+c);
		System.out.println("정수 d="+d);
		System.out.println("실수형 f="+f);
		System.out.println("실수형 o="+o);


	}

}
