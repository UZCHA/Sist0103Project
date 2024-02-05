package day0108;

public class For_09 {

	public static void main(String[] args) {
		// 가로로 1~10까지 출력
		for(int a=1;a<=10;a++)
		{
			System.out.print(a+" ");
		}
		
		//10~1까지 출력
		System.out.println();
		for(int b=10;b>=1;b--)
		{
			System.out.print(b+" ");
		}
		
		
		//5배수
		System.out.println();
		for(int i=0;i<=50;i+=5)
		{
			System.out.print(i+" ");
		}
		
		//continue
		System.out.println();
		for(int i=1;i<=20;i++)
		{
			//1 2 3 4 6 7 8 9 ...19
			//5의 배수 제외하고 출력
			if(i%5==0)
				continue;//5의배수가 맞으므로 continue아래의 문장은 수행하지않고 i++로 이동
			System.out.print(i+" ");
		}
		
		
	}

}
