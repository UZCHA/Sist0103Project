package day0109;

public class ArrMaxNum_13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int[]data= {88,99,4,5,15,20,65,47,111,588};
		System.out.println("갯수: "+data.length);
		
		int max=data[0];//첫데이타를 무조건 최대값으로 지정한다. 
		int min=data[0];//최소값 구할때도 마찬가지로 첫데이타를 최소값으로 지정
		
		//두번째 데이타부터 끝까지 max와 비교
		for(int i=1;i<data.length;i++)//두번째값부터 비교하니까 i=1부터 시작
		{
			if(max<data[i])
				max=data[i];
			
			if(min>data[i])
				min=data[i];
		}
		System.out.println("최대값: "+max);
		System.out.println("최소값: "+min);
	}

}
