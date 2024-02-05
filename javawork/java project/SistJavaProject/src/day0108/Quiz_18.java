package day0108;

import java.util.Scanner;

public class Quiz_18 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//		quiz_1();
		quiz_2();
	}

	public static void quiz_1() {
		//Q. 반복해서 숫자를 입력하여 양수의 객수와 음수의 갯수를 구하시오(0입력시 종료)
		/*
		 * 6
		 * 10
		 * -4
		 * 12
		 * 0
		 * 양의 갯수:3개
		 * 음의 갯수:1개
		 */

		Scanner sc=new Scanner(System.in);

		/*int i;
		int p=0;
		int m=0;

			System.out.println("숫자입력");
		while(true) {
			//System.out.println("숫자입력"); 이렇게하면 첫문장에만 숫자입력글자 출력됨다
			i=sc.nextInt();
			if(i>0)
				p++;
			if(i<0)
				m++;
			if(i==0)
				break;
		}
		System.out.println("양의 갯수: "+p+"개");
		System.out.println("음의 갯수: "+m+"개");*/

		int su;
		int pcnt=0;
		int ncnt=0;

		while(true)
		{
			System.out.println("숫자입력하시오");
			su=sc.nextInt();

			if(su==0)
				break;
			if(su>0)
				pcnt++;
			else
				ncnt++;
		}
		System.out.println("양수의개수: "+pcnt);
		System.out.println("음수의개수: "+ncnt);
	}


	public static void quiz_2() {
		//반복해서 점수를 입력하고(1~100) 0을 입력시 빠져나와 총갯수와 합계와 평균을 구하시오

		/*int score;
		int sum=0;
		int t=0;
		Scanner sc=new Scanner(System.in);

		while(true)
		{
			System.out.println("점수를 입력하세요");
			score=sc.nextInt();
			if(score<=100) {
				sum+=score;
				t++;}
			if(score<0||score>100)
			{
				System.out.println("다시 입력하세요(1~100)");
				t--;
			}
			if(score==0) {
				t--;
				break;}

		System.out.println("총갯수: "+t);
		System.out.println("합계: "+sum);
		System.out.println("합계: "+sum/t);*/

		Scanner sc=new Scanner(System.in);
		int su;
		int cnt=0,sum=0;
		double avg;

		while(true)
		{
			System.out.println("점수입력");
			su=sc.nextInt();

			if(su==0)
				break;
			if(su<1||su>100) 
			{
				System.out.println("다시입력하시오");
				continue;
			}
			cnt++;
			sum+=su;
		}
		avg=sum/cnt;

		System.out.println("총갯수: "+cnt);
		System.out.println("합계: "+sum);
		System.out.println("평균: "+avg);
	}


	public static void quiz_3() {

	}
}
