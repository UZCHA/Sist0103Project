package day0109;

import java.util.Scanner;

public class WhileReview_03 {

	public static void main(String[] args) {
		/*
		 * 반복적으로 나이를 입력한다. 0이되면 종료
		 * 나이가 50이상일 경우 a증가
		 * 나이가 30이상일 경우 b증가
		 * 그 외에는 c변수 증가
		 * 빠져나온 후 출력내용
		 * 50세 이상 3명
		 * 30세 이상 2명
		 * 그외:3명 
		 */

		Scanner sc=new Scanner(System.in);

		int age;
		int a=0,b=0,c=0;
		while(true)
		{
			System.out.println("나이를 입력하세요");
			age=sc.nextInt();
			if(age==0)
				break;

			if(age>=50)
				a++;
			else if(age>=30)
				b++;
			else
				c++;
		}
		System.out.println("50세 이상: "+a+"명");
		System.out.println("30세 이상: "+b+"명");
		System.out.println("그 외: "+c+"명");
	}

}
