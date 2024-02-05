package day0112;

import java.util.Scanner;

class Food{
	
	private String foodName;
	private int fPrice;
	
	static int no;
	
	
	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public int getfPrice() {
		return fPrice;
	}

	public void setfPrice(int fPrice) {
		this.fPrice = fPrice;
	}
	
	//명시적 생성자(2개)
	public Food(String foodname,int fprice)
	{
		this.foodName=foodname;
		this.fPrice=fprice;
	}
	
	//출력문
	/*public static void foodMenu(Food[] food) {
	no++;
	for(Food fm:food) {
	System.out.println("[메뉴_"+no+"]");
	System.out.println("음식명:"+fm.getFoodName());
	System.out.println("가격: "+fm.getfPrice());
	System.out.println("-----------------------");
	}
	}*/
	
	public void getFood() {
		no++;
		System.out.println("[메뉴_"+no+"]");
		System.out.println("음식명:"+ foodName);
		System.out.println("가격:"+fPrice);
		System.out.println("-------------");
	}
	
	
}



public class ArrReview_01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*Food food1=new Food("마르게리타 피자", 12000);
		food1.getFood();
		Food food2=new Food("까르보나라", 15000);
		food2.getFood();
		Food food3=new Food("리코타 샐러드", 9000);
		food3.getFood();*/
		
		Food[]food=new Food[3];
		
		food[0]=new Food("마르게리타 피자", 12000);
		food[1]=new Food("까르보나라", 15000);
		food[2]=new Food("리코타 샐러드", 9000);
		
		for(int i=0;i<food.length;i++)
		{
			food[i].getFood();
		}
		
		for(Food f:food)
		{
			f.getFood();
		}
	}

}
