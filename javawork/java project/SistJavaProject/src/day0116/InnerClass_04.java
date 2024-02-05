package day0116;
class OuterOb{
	public void disp() {
		System.out.println("외부클래스의 disp메서드");
		System.out.println("외부에서 내부클래스의 write 메서드 호출");
		
		innerObj inobj=new innerObj();
		inobj.write();
	}
	
	class innerObj{
		public void write() {
			System.out.println("내부클래스의 write메서드");
		}
	}
	
}


/////////////////////////////////////
public class InnerClass_04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		OuterOb outobj=new OuterOb();
		outobj.disp();
		System.out.println("----------------------");
		
		//내부클래스는 외부를 통해서만 생성가능
		OuterOb.innerObj obj=new OuterOb().new innerObj();
		
		//OuterOb.innerObj obj=OuterOb.new innerObj();
		
	}

}
