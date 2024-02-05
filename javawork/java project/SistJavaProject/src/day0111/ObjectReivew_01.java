package day0111;

//개체의 속성: 인스턴스 변수, 객체의 동작:클래스의 메서드로 표현
//Object:객체, 실제로 존재하는 사물(핸드폰,자동차...)
//class:객체를 정의하는것, 객체를 생성하기위해 존재(설계도, 붕어빵틀...)
//Instance:클래스에서 만들어진 객체를 그 클래스의 인스턴스
//alt+shift+s 세터게터 자동생성 단축키

class Person{
	 private String name;
	 private int age;
	 private String hp;
	 private String addr;
	 
	 public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public String getHp() {
		return hp;
	}


	public void setHp(String hp) {
		this.hp = hp;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	//디폴트 생성자
	 public Person(){
		 
	 }
	 
	 
	 //명시적 생성자
	 public Person(String name,int age, String addr, String hp) {
		 this.name=name;
		 this.age=age;
		 this.addr=addr;
		 this.hp=hp;
	 }
	 
}

public class ObjectReivew_01 {

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Person p1=new Person();
		//p1.name="홍길동" //private인스턴스 변수는 생성을 해도 변수에 접근이 안됨
		
		p1.setName("김민지");
		p1.setAddr("강남구");
		p1.setAge(22);
		p1.setHp("010-123-456");
		
		String name=p1.getName();
		int age=p1.getAge();
		String add=p1.getAddr();
		String hp=p1.getHp();
		
		
		
		//////////////////////////////////////////////////////////////
		Person p2=new Person("김소미",22,"서울시","010-123-45678");
		System.out.println("----------------");
		System.out.println(p2.getName());
		System.out.println(p2.getAge());
		System.out.println(p2.getAddr());
		System.out.println(p2.getHp());
		
	}

}
