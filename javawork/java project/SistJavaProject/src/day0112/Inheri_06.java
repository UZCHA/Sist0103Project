package day0112;

class Emart{
	private String sangpum;
	private int su;
	
	public Emart() {
		//sangpum="딸기";
		//su=10;
		this("딸기", 10); //초기화 호출해서 인자값 넣어주는 방법도 있음
	}
	
	public Emart(String sangpum, int su) {
		this.sangpum=sangpum;
		this.su=su;
	}
	
	public void writeMart() {
		System.out.println("상품명: "+sangpum);
		System.out.println("수량: "+su);
	}
	
}
///////////////////////////
class KangnamEmart extends Emart{
	private int price;
	public KangnamEmart() {
		price=10000;

	}
	KangnamEmart(String sangpum,int su,int price){
		super(sangpum,su);
		this.price=price;
		
	}
	@Override
	public void writeMart() {
		// TODO Auto-generated method stub
		super.writeMart();
		System.out.println("단가: "+price);
	}
	
}
///////////////////////////

public class Inheri_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		KangnamEmart kang1=new KangnamEmart();
		kang1.writeMart();
		
		KangnamEmart kang2=new KangnamEmart("수박", 5,25000);
		kang2.writeMart();
		
	}

}
