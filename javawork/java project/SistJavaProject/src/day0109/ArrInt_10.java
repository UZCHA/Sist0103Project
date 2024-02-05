package day0109;

public class ArrInt_10 {

	public static void main(String[] args) {
		// 배열선언과 동시에 초기값 지정 할 수 있다.
		
		int[] arr= {2,3,9,8,15,17,30};
		
		System.out.println(arr.length);
		
		System.out.println("출력1_for");
		for(int i=0;i<arr.length;i++)
		{
			System.out.print(arr[i]+" ");
		}
		
		System.out.println();
		
		for(int a:arr)
		{
			System.out.print(a+" ");
		}

	}

}
