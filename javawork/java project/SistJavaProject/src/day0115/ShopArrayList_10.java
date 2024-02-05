package day0115;

import java.util.List;
import java.util.Scanner;
import java.util.Vector;

public class ShopArrayList_10 {

	List<Shop_10> list=new Vector<Shop_10>();//ArrayList<shop_10>도 가능
	
	//입력메서드
	public void ipgoData() {
		Scanner sc=new Scanner(System.in);
		String sangname;
		int su,dan;
		
		System.out.println("입고된 상품명?");
		sangname=sc.nextLine();
		System.out.println("단가?");
		dan=Integer.parseInt(sc.nextLine());
		System.out.println("수량?");
		su=Integer.parseInt(sc.nextLine());
		
		/*
		 * 디폴트생성자로 구할때
		 * Shop_10 data= new Shop_10
		 * shop.setsangname(sangname)
		 * shop.setDan(dan)
		 * shop.setSu(su)
		 */
		
		
		Shop_10 data= new Shop_10(sangname, su, dan);
		list.add(data);
		System.out.println("현재 "+list.size()+"개의 상품을 입고했습니다.");
	}
	 
	//출력메서드
	public void jaegoData() {
		System.out.println("***상품재고현황***");
		
		for(int i=0;i<list.size();i++)
		{ 	
			Shop_10 s=list.get(i);
			System.out.println("No."+(i+1)+"\t상품명:"+s.getSangName()+"\t단가:"+s.getDan()+"  수량:"+s.getSu()+"  총액"+s.getTot()+"원");
			System.out.println("----------------------------------------------------");
		}
	}
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ShopArrayList_10 sa=new ShopArrayList_10();
		Scanner sc=new Scanner(System.in);
		int n;
		while(true)
		{
			System.out.println("1.상품입고  2.상품재고  9.종료");
			n=Integer.parseInt(sc.nextLine());
			
			if(n==1)
				sa.ipgoData();
			else if(n==2)
				sa.jaegoData();
			else if(n==9) {
				System.out.println("종료합니다");
			break;}
		}
				
		
	}

}
