package day0110;

public class ObjectEx_07 {

	String name;//인스턴스 멤버변수, 반드시 생성을 한 후 쓸 수 있다. 
	static final String MESSAGE="Happy day";//스태틱 멤버변수(클래스변수) 주로 상수로 선언할때 외에는 사용 안함
	//객체생성없이 바로 클래스명으로 접근 가능

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("static멤버변수는 new생성없이 호출 가능하다");
		System.out.println(MESSAGE); //다른 클래스에서 '클래스명.변수명'으로 가져와야한다
		//MESSAGE="Nice day";//final이라서 값변경 안됨

		//System.out.println(name);//인스턴스 변수는 객체 생성후 가져와야한다.
		ObjectEx_07 ob7=new ObjectEx_07();
		System.out.println(ob7.name);//class에서 변수는 자동초기와(0,null,false...)

		ob7.name="홍길동";
		System.out.println(ob7.name);
		
		ObjectEx_07 ob8=new ObjectEx_07();
		ob8.name="이효리";
		System.out.println(ob8.name);

	}

}
