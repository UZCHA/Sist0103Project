package day0112;

public class SubObj_03 extends SuperObj_03{
	
	String addr;
	
	public SubObj_03(String name, int age,String addr) {
		super(name, age);//this랑 동일하게 반드시 첫줄에 와야함 부모생성자 호출
		this.addr=addr;
	}
	
	public SubObj_03() {
		
	}//부모의 디폴트 생성자를 부모거에서 작성해야 자식에서도 오류가 안난다.

	public void writeData() {
		System.out.println("이름: "+this.name);//부모여도 this를 사용한다
		System.out.println("나이: "+this.age);
		System.out.println("주소: "+this.addr);
	}
}
