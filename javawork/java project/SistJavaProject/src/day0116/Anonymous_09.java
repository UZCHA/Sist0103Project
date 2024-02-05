package day0116;

abstract class AbstObj{
	
	abstract public void dataIn();
	abstract public void dataOut();
	
}
/////////////////////////////////////
//상속
class SubAbst extends AbstObj{

	@Override
	public void dataIn() {
		// TODO Auto-generated method stub
		System.out.println("상속_데이타 입력");
	}

	@Override
	public void dataOut() {
		// TODO Auto-generated method stub
		System.out.println("상속_데이타 출력");
	}
	
}
//익명내부클래스
public class Anonymous_09 {
	
	AbstObj ab=new AbstObj() {
		
		@Override
		public void dataOut() {
			// TODO Auto-generated method stub
			System.out.println("익명내부클래스_데이타 출력");
		}
		
		@Override
		public void dataIn() {
			// TODO Auto-generated method stub
			System.out.println("익명내부클래스_데이타 입력");
		}
	};
	
	//SubAbst sub=new SubAbst(); 여기에 변수하나 만들어주면 밑에처럼 anony.ab.dataIn(); 가능하다. 
	//하지만 굳이굳이 하진 않는다. 
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Anonymous_09 anony=new Anonymous_09();
		//익명내부클래스
		anony.ab.dataIn();
		anony.ab.dataOut();
		
		//상속받은 클래스
		SubAbst sub=new SubAbst();
		sub.dataIn();
		sub.dataOut();
		
		//anony.sub.dataIn();
		//anony.sub.dataOut();
		
		
	}

}
