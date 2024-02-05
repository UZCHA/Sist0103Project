package day0108;

import java.util.Scanner;

public class YoonYear_03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//연도가 4로 나누어떨어지면 윤년이다==>년도를 4로 나누어 나머지가 0이 나오고
		//년도를 100으로 나누어서 나머지가 0이 아니거나 
		//년도를 400으로 나누어서 나머지가 0이면 윤년이다. 
		//연도 입력해서 평년인지, 윤년인지 출력해보시오

		Scanner sc=new Scanner(System.in);
		int year;
		
		System.out.println("입력연도");
		year=sc.nextInt();
		
		if(year%4==0&&year%100!=0||year%400==0)
			System.out.println("윤년");
		else
			System.out.println("평년");
		
		
	}

}
