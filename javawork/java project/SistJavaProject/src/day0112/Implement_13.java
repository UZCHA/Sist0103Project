package day0112;
//interface: 일반메서드는 못넣는다. 상수와 추상메서드만 가질 수 있다. 
//class가 class를 상속:extends
//class가 interface를 상속: implement
//interface가 interface를 :extends
interface FoodShop{
	String SHOPNAME="남소관";//상수인지 아닌지는 이따가 확인
	public void order();//abstract는 생략가능. 왜냐면 남고에서 너 남자인거 다 아는 것 처럼 interface안에 들어온건 추상메서드취급
	public void bedal();
}
///////////////////////////////////////
class Food2 implements FoodShop{ //extends는 같은 class일때 사용가능

	@Override
	public void order() {
		// TODO Auto-generated method stub
		//SHOPNAME="왕돈까스"; 상수로 들어가있기 때문에 위에 final이 생략되어있어도 상수이다.
		System.out.println("음식을 주문합니다.");
		
	}

	@Override
	public void bedal() {
		// TODO Auto-generated method stub
		System.out.println("음식을 배달합니다.");
	}
	
}
///////////////////////////////////
class Food3 implements FoodShop{

	@Override
	public void order() {
		// TODO Auto-generated method stub
		System.out.println("키오스크 주문");
	}

	@Override
	public void bedal() {
		// TODO Auto-generated method stub
	System.out.println("쿠팡이츠 배달");	
	}
	
}
///////////////////////////////////
public class Implement_13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//다형성으로 
		FoodShop fs;
		
		fs=new Food2();
		fs.order();
		fs.bedal();
		
		fs=new Food3();
		fs.order();
		fs.bedal();
		
				
		
		
	}

}
