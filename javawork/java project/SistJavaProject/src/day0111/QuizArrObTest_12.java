package day0111;

class MyInfo{
	
	private String name;
	private String mbti;
	private int age;
	
	public MyInfo(String name,String mbti, int age) {
		this.name=name;
		this.mbti=mbti;
		this.age=age;
	}
	
	public static void myinfoTitle()
	{
		System.out.println("이름\t MBTI\t 나이");
		System.out.println("====================");
	}
	
	public void MyInfodata() {
		System.out.println(this.name+"\t"+this.mbti+"\t"+this.age+"세");
	}
}




public class QuizArrObTest_12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		MyInfo m1=new MyInfo("이효리","ENTP",26);
		MyInfo m2=new MyInfo("이상순","ISTJ",33);
		MyInfo m3=new MyInfo("이영자","ENFJ",28);
		
		m1.MyInfodata();
		m2.MyInfodata();
		m3.MyInfodata();
		
		
		MyInfo[] myInfo= {
				new MyInfo("이효리","ENTP" , 26),
				new MyInfo("이상순","ISTJ" , 33),
				new MyInfo("이영자","ENFJ" , 28),
		};
		
		MyInfo.myinfoTitle();
		
	}

}
