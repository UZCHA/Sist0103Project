package day0109;

public class ForStar_02 {

	public static void main(String[] args) {
		// 
		System.out.println("**다중 for문으로 star(*) 출력하기**");
		
		for(int i=1;i<=5;i++)//행 갯수
		{
			for(int j=1;j<=5;j++)//열 갯수
			{
				System.out.print("*");
			}
			System.out.println();
		}
		//삼각
		for(int a=1;a<=5;a++)
		{
			for(int b=1;b<=a;b++)//열갯수(행의 값만큼 반복)
			{
				System.out.print("*");
			}
			System.out.println();
		}
		//역삼각
		for(int c=1;c<=5;c++)
		{
			for(int d=c;d<=5;d++)//열갯수(행의 값이 1일때 5번, 행이2일때 4번)
			{
				System.out.print("*");
			}
			System.out.println();
		}
	}

}
