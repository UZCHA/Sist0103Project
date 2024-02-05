package day0112;

class Shop{
	/*
	 * [쌍용매장 입고상품]

 번호	 상품명	가격	색상
 ======================
 1	요가매트	25000원	핑크
 2	아령	30000원	블랙
 3	레깅스	45000원	베이지
 4	나시	22000원	화이트
	 */
	private String sName;
	private int price;
	private String color;
	private static int cnt;
	static String shopName="쌍용";
	
	public Shop(String sname, int pri,String col)
	{
		this.sName=sname;
		this.price=pri;
		this.color=col;
		
	}
	
	public static void shopTitle() {
		System.out.println("["+shopName+"매장입고상품]");
		System.out.println("번호\t상품명\t가격\t색상");
		System.out.println("==============================");
	}
	
	public void shopData() {
		cnt++;
		System.out.println(cnt+"\t"+sName+"\t"+price+"\t"+color);
	}
	
}
/////////////////////////////////
public class ArrReview_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Shop[]shop= {
				new Shop("요가매트",25000,"핑크"),
				new Shop("아령",30000,"블랙"),
				new Shop("레깅스",45000,"베이지"),
				new Shop("나시",22000,"화이트")
		};
		//foreach문
		Shop.shopTitle();
		for(Shop s:shop)
		{
			s.shopData();
		}
		
		//for문
		Shop.shopTitle();
		for(int i=0;i<shop.length;i++) {
			shop[i].shopData();
		}
		
	}

}
