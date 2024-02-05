package day0105;

public class OperTest_03 {

	public static void main(String[] args) {
		//증감연산자 ++,--
		int a,b;
		a=b=5;
		
		//단항일 경우에는 증감연산자를 앞에붙이나 뒤에붙이나 값이 같다. 
		
		++a;
		b++;
		
		System.out.println("a="+a+",b="+b);
		
		//수식에서는 전치,후치가 결과값이 다르다. 
		
		int n,m;
		n=m=0;
		a=b=5; //위에 결과값이 6이 나왔지만 다시 5로 선언가능
		
		m=a++; //후치일경우 먼저 대입후 증가, m에 a(5)가 대입먼저 되고 1이 증가함
		System.out.println("m="+m+",a="+a);
		n=++b;//전치일경우 먼저 증가후 대입
		System.out.println("n="+n+",b="+b);

	}

}
