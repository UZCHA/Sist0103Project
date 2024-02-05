package day0111;

class Mycar1{
	String carName;
	int carPrice;
	String carColor;
}


public class CallByReference_12 {

	public static void dataIn(Mycar1 car1) 
	{
		car1.carName="미니쿠퍼";
		car1.carPrice=420000;
		car1.carColor="진주색";
	}
	
	public static void dataOut(Mycar1 car1) {
		System.out.println("차종명: "+car1.carName);
		System.out.println("차량가격: "+car1.carPrice);
		System.out.println("색상: "+car1.carColor);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Mycar1 car=new Mycar1();
		//두개의 메서드 다 주소가 전달되므로 결국 메인에 car라는 변수에 데이타가 들어가고 출력된다.
		dataIn(car);
		dataOut(car);
	}

}
