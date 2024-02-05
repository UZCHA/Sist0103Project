package day0110;

import java.util.Scanner;

public class ArraySearchName_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String [] names= {"김철수","이영희","김지수","김유리","나카무라상","김강산"};
		boolean flag;
		Scanner sc=new Scanner(System.in);
		String n;

		/*	while(true)
		{
			System.out.println("검색할 이름을 입력");
			n=sc.nextLine();

			/*if(n=="종료")
			{System.out.println("종료합니다");
			break;
			}
			flag=false;

			for(int i=0;i<names.length;i++)
			{
				if(n==names[i])
				{
					flag=true;
					System.out.println(i+1+"번째에서 검색");
				}
			}
			if(!flag)
				System.out.println(n+" 은/는 검색결에 없습니다");
		}*/

		while(true)
		{
			System.out.println("검색할 이름");
			n=sc.nextLine();

			if(n.equalsIgnoreCase("종료"))
			{
				System.out.println("종료합니다");
				break;
			}
			flag=false;

			for(int i=0;i<names.length;i++)
			{
				if(n.equals(names[i]))
				{
					flag=true;
					System.out.println(i+1+"번째에서 검색됨");
				}
			}
			if(!flag)
				System.out.println(n+"님은 데이타에 없습니다.");
		}
	}
}
