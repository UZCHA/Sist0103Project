package day0105;

import java.util.Scanner;

public class QuizOper_13 {

	public static void main(String[] args) {
			//3개의 숫자를 입력하여 가장 큰값(max)을 구하시오	
		//if문 && 삼항연산자로도 구할것
		/*
		 * 3개의 숫자를 입력하시오
		 * 3 
		 * 5 
		 * 4
		 * **if문**
		 * max=5
		 * **삼항연산자**
		 * max=5
		 */
		
		int a,b,c,max;
		
		Scanner sc=new Scanner(System.in);
		System.out.println("3개의 숫자를 입력하시오");
		a=sc.nextInt();
		b=sc.nextInt();
		c=sc.nextInt();
		
		System.out.println("**if문**");
		if(a>b&&a>c)
			max=a;
		else if(b>a&&b>c)
			max=b;
		else
			max=c;
		
		System.out.println("max="+max);
		
		System.out.println("**조건연산자**");
		
		max=a>b&&a>c?a:b>a&&b>c?b:c;
		System.out.println("max="+max);
		
		
		
	}

}
