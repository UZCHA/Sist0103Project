package day0108;

public class WhlieTest_06 {

	public static void main(String[] args) {
		// 1~10까지 반복해서 출력
		
		int n=0;//초기값
		
		while(n<10)
		{
			n++;
			System.out.printf("%4d",n);
		}
		System.out.println();
		
		n=0;
		
		while(n<10)
		{
			System.out.printf("%4d",++n);
		}
		
		System.out.println();
		
		n=0;
		while(true)
		{
			System.out.printf("%4d",++n);
			if(n==10)//while(true)일 경우에는 수행문장에 반드시 break 조건문을 써줘야한다.안그러면 무한 반복함.
				break;
		}
	}

}
