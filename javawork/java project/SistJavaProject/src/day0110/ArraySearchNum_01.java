package day0110;

import java.util.Scanner;

public class ArraySearchNum_01 {

	public static void main(String[] args) {
		// 배열중에서 숫자를 입력하여 찾기
		//있는지 찾기, 없으면 없다고 표시 있으면 몇번째에 있는지 출력
		//0이라고 입력시 종료
		int[]data= {74,5,42,11,32,66,89,20,8,96};
		boolean flag;
		Scanner sc=new Scanner(System.in);
		int su;
		while(true)
		{
			System.out.println("검색할 숫자 입력");
			su=sc.nextInt();
			
			if(su==0) 
			{
				System.out.println("프로그램종료");
				break;
			}
			flag=false;//찾으면 그때 true로 변경
			
			//값 찾기
			for(int i=0;i<data.length;i++)
			{
				if(su==data[i])
				{
					flag=true;
					System.out.println(i+1+"번째에서 검색");
				}
			}
			if(!flag)//flag==false라는 의미 
				System.out.println(su+"는 데이타에 없습니다");
			
		}
		
	}

}
