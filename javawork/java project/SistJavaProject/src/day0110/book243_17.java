package day0110;

class Car{
	String model;
	int speed;
	
}

public class book243_17 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Car c1=new Car();
		c1.model="포르쉐";
		c1.speed=100;
		
		Car c2=new Car();
		c2.model="벤츠";
		c2.speed=100;
		
		System.out.println(c1.model+"가 달립니다. (시속: "+c1.speed+"km/h)");
		System.out.println(c2.model+"가 달립니다. (시속: "+c2.speed+"km/h)");
	}

}
