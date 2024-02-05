package day0110;

class Ipgo{
	private String sangName;
	private int price;
	
	//set메서드
	
	public void setName(String sangName) {
		this.sangName=sangName;
	}
	
	/*public void setName(String Name)
	 *  {
		sangName=Name; 디스생략가능
		}
	 */
	public void setPrice(int price) {
		this.price=price;
	}
	
	
	//get메서드
	
	public String getName() {
		return sangName;
		
	}
	public int getPrice() {
		return price;
	}
}



public class SangpumIpgo_13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Ipgo ipgo1=new Ipgo();
		ipgo1.setName("사과");
		ipgo1.setPrice(2500);
		
		String name1=ipgo1.getName();
		int price1=ipgo1.getPrice();
		
		Ipgo ipgo2=new Ipgo();
		ipgo2.setName("오렌지");
		ipgo2.setPrice(4500);
		
		String name2=ipgo2.getName();
		int price2=ipgo2.getPrice();
		
		System.out.println(name1+","+price1+"원");
		System.out.println(name2+","+price2+"원");
		
	}

}
