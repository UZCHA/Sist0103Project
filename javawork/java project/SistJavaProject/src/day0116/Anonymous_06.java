package day0116;
//익명내부클래스: 클래스 선언과 객체생성을 동시에 하는 이름없는 클래스
//이벤트가 발생시 생성했다가 끝나면 메모리가 제거_메모리 효율적관리가 쉽다.

abstract class AbstEx{
	
	abstract public void draw();
}
///////////////////////////////////

class OuterEx{
	AbstEx ab=new AbstEx() {
		
		@Override
		public void draw() {
			// TODO Auto-generated method stub
			System.out.println("익명 내부 클래스");
		}
	};
	
	
}
/////////////////////////////////////
public class Anonymous_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		OuterEx ex=new OuterEx();
		ex.ab.draw();
	}

}
