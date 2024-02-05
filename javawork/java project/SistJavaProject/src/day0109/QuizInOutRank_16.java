package day0109;

public class QuizInOutRank_16 {

	public static void main(String[] args) {

		String[]name= {"홍수연","김수연","최수연","민수연"};
		int[]kor= {90,88,100,78};
		int[]eng= {100,55,100,87};
		int[]mat= {44,55,100,66};
		int[]tot=new int[4];
		double[]avg=new double[4];
		int[]rank=new int[4];
		
		/*
		 * 각 학생들의 점수에 대한 총점,평균,등수를 구하여 출력하시요
		 * 번호 이름 국어 영어 수학 총점 평균 등수
		 * ===============================
		 *  1 홍수현 90 100 44  00  00  0
		 */
		
		//1.총점,평균..배열로 구하시오
		
	
		
		//3.출력
		
		/*for(int i=0;i<name.length;i++)
		{
			tot[i]=kor[i]+eng[i]+mat[i];
			avg[i]=(double)tot[i]/4;
			
			System.out.println(i+1+"번 "+"\t"+name[i]+"\t"+kor[i]+"\t"+eng[i]+"\t"+mat[i]+"\t"+tot[i]+"\t"+avg[i]);
		}*/
		
		//2.등수
		/*for(int i=0;i<name.length;i++)
		{
			rank[i]=1;
			
			for(int j=0;j<name.length;j++)
			{
				if(tot[i]<tot[j])
					rank[i]++;
			}
		}*/
			System.out.println("번호\t이름\t국어\t영어\t수학\t총점\t평균\t등수");
			System.out.println("==========================================================");
			
			for(int i=0;i<name.length;i++)
			{
				tot[i]=kor[i]+eng[i]+mat[i];
				avg[i]=(double)tot[i]/3;
			}
			
			for(int i=0;i<name.length;i++) 
				{
				rank[i]=1;
				
				for(int j=0;j<name.length;j++)
				{
					if(avg[i]<avg[j])
						rank[i]++;
				}
			
				
				
				//System.out.println(i+1+"번 "+"\t"+name[i]+"\t"+kor[i]+"\t"+eng[i]+"\t"+mat[i]+"\t"+tot[i]+"\t"+avg[i]+"\t"+rank[i]);
				System.out.printf("%d번\t%s\t%d\t%d\t%d\t%d\t%.1f\t%d\n",(i+1),name[i],kor[i],eng[i],mat[i],tot[i],avg[i],rank[i]);
			}
			
	}
	


}
