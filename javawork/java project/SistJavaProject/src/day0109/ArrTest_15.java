package day0109;

import java.util.Scanner;

public class ArrTest_15 {

	public static void main(String[] args) {
		// 학생명과 점수를 입력_몇명인지는 입력해 주는 만큼 
		//등수를 구한다
		//입력해준 데이타로 등수,합계, 평군도 구하시오
		
		int inwon;
		String[]name;
		int[]score;
		int[]rank;//등수
		
		int tot=0;
		double avg=0;
		
		Scanner sc=new Scanner(System.in);
		
		System.out.println("인원수를 입력하시오");
		inwon=Integer.parseInt(sc.nextLine());//문자를 숫자로 형변환해주는것, 숫자 다음 문자가 올때 변환해줘야함
		
		//인원수만큼 배열로 할당
		name=new String[inwon];
		score=new int[inwon];
		rank=new int[inwon];
		
		//인원수만큼 데이타 입력
		for(int i=0;i<inwon;i++)
		{
			System.out.println(i+1+"번지 이름");
			name[i]=sc.nextLine();
			System.out.println(i+1+"번지 점수");
			score[i]=Integer.parseInt(sc.nextLine());
		
		//총점
			tot+=score[i];
		}	
		//등수구하기(다중 for)
		for(int i=0;i<inwon;i++)
		{
			rank[i]=1;
			
			for(int j=0;j<inwon;j++)
			{
				//비교되는 대상이 점수가 더 높으면 현재 i를 1증가시킨다.
				if(score[i]<score[j])
					rank[i]++;
			}
		}
		
		//계산
		avg=(double)tot/inwon;
		
		//출력
		System.out.println("번호\t이름\t점수\t등수");
		System.out.println("==============================");
		for(int i=0;i<inwon;i++)
		{
			System.out.println(i+1+"\t"+name[i]+"\t"+score[i]+"\t"+rank[i]);
		}
		System.out.println("총점: "+tot);
		System.out.printf("평균: %.2f ",avg);
	}

}
