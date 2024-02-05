package day0111;


class Shop{

	private String sangpum;
	private int price;
	private String sangColor;

	public Shop(String s, int p, String c) {
		sangpum=s;
		price=p;
		sangColor=c;

	}
	//제목

	public static void showTitle() {
		System.out.println("상품명\t가격\t색상");
		System.out.println("=======================");

	}
	//생성한 객수만큼 출력
	public void showShop() {
		System.out.println(sangpum+"\t"+price+"원\t"+sangColor);
	}
}


public class ArrObTest_11 {

	public static void main(String[] args) {
		// 4개 생성해서 출력할것
		//Shop[] shop=new Shop[4];

		//4개의 샵배열에 생성자를 통해서 생성
		/*shop[0]=new Shop("모니터", 25000, "블랙");
		shop[1]=new Shop("마우스", 15000, "블랙");
		shop[2]=new Shop("책상", 50000, "화이트");
		shop[3]=new Shop("볼펜", 2000, "블랙");*/
		
		//출력
		Shop.showTitle();
		
		Shop[]sh= {
				new Shop("키보드", 30000, "흰색"),
				new Shop("마우스", 15000, "검정"),
				new Shop("볼펜", 1000, "검정"),
				new Shop("모니터", 300000, "흰색")
		};
		
		
		for(int i=0;i<sh.length;i++)
		{	
			sh[i].showShop();
		}

		System.out.println("==================");

		for(Shop s1:sh)
		{
			s1.showShop();
			System.out.println("------------------");
		}
	}

}
