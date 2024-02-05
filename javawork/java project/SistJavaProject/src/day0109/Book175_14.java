package day0109;

public class Book175_14 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int[]score= {84,90,96};
		int sum=0;
		for(int i=0;i<score.length;i++)
		{
			sum+=score[i];
		}
		System.out.println("총합: "+sum);
		double avg=(double)sum/score.length;
		System.out.println("평균: "+avg);
	}

}
