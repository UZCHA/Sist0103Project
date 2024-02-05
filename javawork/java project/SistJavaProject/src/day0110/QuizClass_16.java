package day0110;

class Mart{
	private String sangpum;
	int su;
	int dan;
	static String SHOPNAME="롯데마트";

	//상품은 메서드가 아니면 다른클래스에서 접근불가
public void setSangpum(String sangpum) {
	this.sangpum=sangpum;
}
//public void setsu(int su) {
//	this.su=su;
//}
//public void setdan(int dan) {
//	this.dan=dan;
//}

public String getSangpum()
{
	return sangpum;
}

//public int getsu() {
//	return su;
//}
//public int getdan() {
//	return dan;
}
//dan, su는 private이 아니므로 다른클래스에서 생성시 변수접근 가능..굳이 메서드로 안만들어도 됨...
//static은 다른클래스에서 접근시 클래스명.변수명으로 접근 가능하다.



public class QuizClass_16 {

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Mart mart1=new Mart();
		mart1.setSangpum("초코파이");
		mart1.su=10;
		mart1.dan=4500;
		
		//mart1.setsu(10);
		//mart1.setdan(4500); private이 아니므로 생략가능 바로 위에처럼 작성

		//String name1=mart1.getSangpum();
		//int su1=mart1.getsu();
		//int dan1=mart1.getdan();
		
		Mart mart2=new Mart();
		mart2.setSangpum("엄마손파이");
		mart2.su=5;
		mart2.dan=2500;
		
		System.out.println(Mart.SHOPNAME+" 입고상품");
		System.out.println("======================");
		System.out.println("상품명:"+mart1.getSangpum());
		System.out.println("수량: "+mart1.su+"개");
		System.out.println("가격: "+mart1.dan+"원");
		System.out.println("----------------------");
		System.out.println("상품명:"+mart2.getSangpum());
		System.out.println("수량: "+mart2.su+"개 ");
		System.out.println("가격: "+mart2.dan+"원");
		
		
		
		
		
		
		
	}

}
