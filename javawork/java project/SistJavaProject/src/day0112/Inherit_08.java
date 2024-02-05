package day0112;
//부모클래스
class Car{
	private String carCompany;//제조회사
	private String carKind;//종류
	
	//디폴트 생성자
	public Car() {
		carCompany="현대";
		carKind="전기차 트럭";
	}
	//명시적생성자
	public Car(String carcompany, String carkind) {
	this.carCompany=carcompany;
			this.carKind=carkind;
	}
	//setter&getter
	public String getCarCompany() {
		return carCompany;
	}

	public void setCarCompany(String carCompany) {
		this.carCompany = carCompany;
	}

	public String getCarKind() {
		return carKind;
	}

	public void setCarKind(String carKind) {
		this.carKind = carKind;
	}
	//메서드
	public void writeData() {
		System.out.println("회사명: "+carCompany);
		System.out.println("종류: "+carKind);
		
	}
	
}
///////////////////////////

//자식클래스
class MyCar extends Car{
	private String carName;
	private String carColor;
	private int carPrice;
	
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getCarColor() {
		return carColor;
	}
	public void setCarColor(String carColor) {
		this.carColor = carColor;
	}
	public int getCarPrice() {
		return carPrice;
	}
	public void setCarPrice(int carPrice) {
		this.carPrice = carPrice;
	}
	public MyCar() {
	super();
	carName="아이오닉5";
	//carColor="화이트";
	//carPrice=2500000;
	}
	
	public MyCar(String carcompany, String carkind,String carName,String carColor,int carPrice)
	{super(carcompany, carkind);
	this.carName=carName;
	this.carColor=carColor;
	this.carPrice=carPrice;
	
	}
	@Override
	public void writeData() {
		// TODO Auto-generated method stub
		super.writeData();
		System.out.println("자동차명: "+this.carName);
		System.out.println("색상: "+this.carColor);
		System.out.println("가격: "+this.carPrice+"원");
	}
	
}
///////////////////////
public class Inherit_08 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("**디폴트 생성자로 생성**");
		MyCar my1=new MyCar();
		my1.setCarColor("블랙");//여기서 set으로 수정해주던가 위에 자식클래스의 디폴트값에서 수정하는 것도 가능.
		my1.setCarPrice(25000000);
		my1.writeData();
		
		System.out.println();
		System.out.println("**명시적 생성자로 생성**");
		MyCar my2=new MyCar("기아", "가솔린", "코나", "블랙", 15000000);
		my2.writeData();
		
		System.out.println();
		System.out.println("**부모메서드 출력**");
		Car c1=new Car();
		c1.writeData();
	}

}
