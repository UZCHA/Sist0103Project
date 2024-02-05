package day0110;

public class ArraysChange_03 {

	public static void main(String[] args) {
		// 순서바꾸기 연습
		
		int a=10,b=20;
		System.out.println("a="+a+", b="+b);
		
		int temp=a;//임시저장소 느낌
		a=b;
		b=temp;
		
		System.out.println("a="+a+", b="+b);
		
		int[]n= {4,7,9};
		for(int s:n)
			System.out.print(s+" ");
		
		System.out.println("\n0번이랑 2번을 교환 후 출력");
		int temp2=n[0];
		n[0]=n[2];
		n[2]=temp2;
		
		for(int s:n)
		System.out.print(s+" ");
		
	}

}
