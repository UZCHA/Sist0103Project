package day0108;

public class DoWhlie_08 {

	public static void main(String[] args) {
		// 선조건 후조건의 차이
		
		int n=1;
		System.out.println("**while문 결과**");
		while(n<5) //조건이 맞지않으면 한번도 출력이 안될수있다.(예: n>5로하면 출력이 안됨)
		{
			System.out.println(n++);//출력후 증가
		}
		System.out.println("**do~while문 결과**");
		n=1;
		do //조건이 맞지않아도 do부분 먼저 실행되므로 한번은 수행을 한다. 
		{
		System.out.println(n++);
		}
		while(n>=5);
	}

}
