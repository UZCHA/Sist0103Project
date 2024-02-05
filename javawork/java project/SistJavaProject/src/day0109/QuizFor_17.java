package day0109;

import java.util.Scanner;

public class QuizFor_17 {

	public static void main(String[] args) {
		//quiz1();
				quiz3();
				//quiz2();

	}
	public static void quiz1() {
		/*
		 * 팩토리얼 구할 숫자를 입력하여 해당숫자에 대한 팩토리얼 구하기
		 * 팩토리얼 구할 숫자입력하세요.
		 * 3
		 * 3!=6
		 * 5
		 * 5!=120
		 */

		/*int i;
		int result=1;
		Scanner sc=new Scanner(System.in);
		System.out.println("팩토리얼 구할 숫자를 입력하세요");
		i=sc.nextInt();
		for(int a=1;a<sc.nextInt();a++)
			{
			result*=i;
			System.out.println(i+"!="+result);

		}*/
		Scanner sc=new Scanner(System.in);
		int su,result=1;
		System.out.println("팩토리얼 구할 숫자를 입력하세요");
		su=sc.nextInt();

		for(int i=1;i<=su;i++)
		{
			result*=i;
		}
		System.out.println(su+"!="+result);

	}

	public static void quiz2() {
		/*
		 * Q.두수x,y를 입력후 x의 y승_for문을 이용해서 구하시오(x를 y횟수만큼 곱하는 것)
		 * 
		 * 두수 입력
		 * 3 3
		 * 3의3승은 27입니다.
		 */
		int x,y,result=1;
		Scanner sc=new Scanner(System.in);
		System.out.println("두수를 입력하세요");
		x=sc.nextInt();
		y=sc.nextInt();
		
		for(int i=1;i<=y;i++)
		{
			result*=x;
		}
		System.out.println(x+"의"+y+" 승은="+result+"입니다");
		
	}

	public static void quiz3() {
		/*
		 * 1~100까지의 숫자중에서 짝수의 합과 홀수의 합을 출력해주세요_for문 이용
		 * 홀수합:
		 * 짝수합:
		 */
		int sum1=0,sum2=0;
		for(int i=1;i<=100;i++)
		{
			if(i%2==0) 
				sum1+=i;


			else
				sum2+=i;


		}
		System.out.println("짝수합: "+sum1);
		System.out.println("홀수합: "+sum2);

		/*int esum=0;//짝수합
		int osum=0;//홀수합
		
		for(int i=1;i<=100;i++)
		{
			if(i%2==0)
				esum+=i;
			else
				osum+=i;
		}
		System.out.println("짝수합: "+eum);
		System.out.println("홀수합: "+oum);*/
	}

}
