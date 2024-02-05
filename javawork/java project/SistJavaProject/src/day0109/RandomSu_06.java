package day0109;

import java.util.Scanner;

public class RandomSu_06 {

	public static void main(String[] args) {
		//1~10사이의 랜덤수를 발생시켜 그 숫자 맞추기
		
		Scanner sc=new Scanner(System.in);
		
		int rnd=(int)(Math.random()*100)+1;
		int su;//입력할 수
		int cnt=0;//횟수구하는 변수
		
		while(true)
		{
			
			cnt++;
			System.out.print(cnt+"회: ");
			su=sc.nextInt();
			
			if(su>rnd)
				System.out.println(su+"보다 작습니다");
			else if(su<rnd)
				System.out.println(su+"보다 큽니다");
			else
			{
				System.out.println("맞았습니다. 정답은 "+rnd+"입니다");
				break;
			}
					
		}
		System.out.println("종료");
	}

}
