package day0108;

public class For_07 {

	public static void main(String[] args) {
		// whlie문과 for문 비교

		int i=10;

		while(i>=0) {
			System.out.print(i--+" ");
		}
		System.out.println();
		System.out.println("**for문으로 10~0 출력**");

		for(int a=10;a>=0;a--) 
		{
			System.out.print(a+" ");
		}
		System.out.println();
		System.out.println("**for문 1~10 종료까지");
		//for문에서는 같은 변수를 사용가능, 밖으로 나와있는 변수는 사용불가하지만 for문안에서 사용한 변수는 또 사용가능
		for(int a=1;a<=10;a++)
			System.out.print(a+" ");
		System.out.print("종료 ");

		System.out.println();	
		System.out.println("**while문 1~10 종료");
		int w=1;
		while(true) {
			System.out.print(w+++" ");
			if(w>10)
				break;
		}
		System.out.println("종료");

		System.out.println("**for문 1,4,7,10**");
		
		for(int b=1;b<=10;b+=3)
		{
			System.out.print(b+" ");
		}

		System.out.println();
		System.out.println("**for문 5,4,3,2,1**");
		for(int c=5;c>=1;c--)
		{
			System.out.print(c+" ");
		}
		System.out.println();
		System.out.println("**while문 5,4,3,2,1**");
		int q=5;
		while(q>0)
		{
			System.out.print(q--+" ");
		}
		
		System.out.println("\n**for문 Hello Java를 5번 반복**");
		
		int s=1;
		for(;s<5;s++)//int의 변수를 밖으로 빼낼때도 초기값의 세미콜론은 입력해야함
		{
			System.out.print("Hello Java"+" ");
		}
		
		for(int d=1;d<=6;d++)
		{
			System.out.print("안녕"+" ");
		}
	}

}
