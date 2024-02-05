package day0115;

public class Exception_12 {

	public static void main(String[] args) {
		
		System.out.println("프로그램 시작");
		try {//예외가 발생할수있는 코드를 넣는다.
		int num=3/0;}//점수를 0으로 나누면 나오는 에러
		catch(ArithmeticException e)//예외를 어떻게 처리할지, 예외처리코드를 넣는다.
		{
			e.printStackTrace();//자세한 예외정보를 출력하는 것.
			//e.getMessage();
		}
		System.out.println("프로그램 종료");
		

	}

}
