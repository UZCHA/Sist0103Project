package day0111;

class Apple{
	
	public Apple() {
		System.out.println("Apple_디폴트 생성자");
		
	}
	
}
///////////////////
class Banana{
	public Banana(String str) {
		System.out.println("생성자호출: "+str);
	}
	
}
///////////////////
class Orange{
	//생성자 오버로팅
	public Orange() {
		System.out.println("오렌지의 디폴트 생성자 호출");
	}
	public Orange(String str) {
		System.out.println("오렌지의 2번째 생성자: "+str);
	}
	public Orange(int n) {
		this(); //인자가있는 생성자에서 기본생성자 호출, 반드시 첫줄이여야 한다.
		//만약 괄호안에 "홍길동"이 있다면 두번째 생성자를 호출한것.
		System.out.println("오렌지의 3번째 생성자: "+n);
		
	}
}
///////////////////////////////////////////////
public class ConstTest_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Apple apple= new Apple();
		Banana banana=new Banana("바나나");
		Orange or1=new Orange();
		Orange or2=new Orange("오렌지");
		Orange or3=new Orange(22);//this로 호출했으므로 출력했을때 오렌지의 1번째 생성자도 같이 호출됨
		
		
				
				
	}

}
