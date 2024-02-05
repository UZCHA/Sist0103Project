package day0112;

//부모클래스의 멤버를 자식클래스가 선언없이 사용가능하다(this)
//private은 같은패키지여도 상속 못 받는다. 
//자바는 단일 상속만 가능하다.extends 하나만 가능.
//상속 extends라는 키워드로 표현.
//class자식 클래스 extends 부모클래스
public class MainObj_03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//자식을 호출한다
		SubObj_03 sub=new SubObj_03("이영희", 22, "강남구");
		sub.writeData();
	}

}
