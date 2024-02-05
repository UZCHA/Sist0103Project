package day0112;

//클래스를 객체 생성할때는 자동으로 부모->자신 순서. 그래야 자식이 부모의 멤버를 사용할 수 있기 때문.
public class MainEmp_04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Manager_04 man= new Manager_04("이효리", 2500000, "기획부");
		System.out.println(man.getEmployee());
	}

}
