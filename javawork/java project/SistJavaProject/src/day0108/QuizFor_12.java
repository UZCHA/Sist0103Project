package day0108;

import java.util.Scanner;

public class QuizFor_12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("1. 1 2 4 5 7 8 10(continue활용할것)");
		for(int i=1;i<=10;i++)
		{
			if(i%3==0)
				continue;
			else
				System.out.print(i+" ");}
			
		System.out.println("\n2. 홀수값:1 홀수값:3 홀수값:5 홀수값:7 홀수값:9");
		
			for(int a=1;a<=10;a++)
			{
				if(a%2==0)
					continue;
				else
					System.out.println("홀수값: "+a);
			}
			
		System.out.println("3. 점수를 입력후 합계를 구하는데 0을 입력하면 빠져나와서 합계출력");
		
		Scanner sc=new Scanner(System.in);
		
		int score;
		int sum=0;
		
		while(true)
		{
			System.out.println("점수를 입력하세요");
			score=sc.nextInt();
			
			if(score==0)
				break;
		
			//1~100
			if(score<0||score>100)
			{
				System.out.println("다시입력해주세요");
				continue;
			}
			sum+=score;
		}
		
		System.out.println("총합계: "+sum);
		}

}
